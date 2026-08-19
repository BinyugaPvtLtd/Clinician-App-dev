import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../services/token_manager/token_manager_service.dart';
import '../../constants/constant_import.dart';
import '../../data/pending_forms_data.dart';
import '../../model/chart_patient_referral_data_model.dart';
import '../../model/patient_form_model.dart';
import '../../oasis_form_mapper.dart';
import '../../services/api/managers/form_builder_manager.dart';
import '../../services/api/managers/patient_form_manager.dart';
import '../../side_drawer/side_drawer_provider.dart';

// ─── Color Constants ───────────────────────────────────────────────────────────

const Color _kPrimaryBlue = Color(0xFF1EB0D9);
const Color _kDivider = Color(0xFFDDE6EC);
const Color _kBodyText = Color(0xFF3D3D3D);
const Color _kLightText = Color(0xFF6B7280);

// ─── Data shape ───────────────────────────────────────────────────────────────
// Fields inferred from how this popup consumes them; wire this up to the real
// getEmrPendingReviewForm API response shape once that endpoint exists.


// ─── Badge Color Helper ───────────────────────────────────────────────────────

Color _badgeColorForType(String abbreviation) {
  switch (abbreviation.toUpperCase()) {
    case 'PTA':
      return const Color(0xFFE91E63);
    case 'COTA':
      return const Color(0xFF9C27B0);
    case 'HHA':
      return const Color(0xFF1565C0);
    default:
      return const Color(0xFF607D8B);
  }
}

// ─── Main Widget ──────────────────────────────────────────────────────────────

class PendingReviewFormPopup extends StatefulWidget {
  final int visitId;
  final int patientId;
  final bool isLastEpisode;
  final dynamic visitData;
  final VoidCallback onNevigate;

  const PendingReviewFormPopup({
    super.key,
    required this.visitId,
    required this.patientId,
    required this.isLastEpisode,
    required this.visitData,
    required this.onNevigate,
  });

  @override
  State<PendingReviewFormPopup> createState() =>
      _PendingReviewFormPopupState();
}

class _PendingReviewFormPopupState extends State<PendingReviewFormPopup> {
  // Controls the initial data-fetch skeleton (hides the whole table)
  bool _isLoading = true;

  // Controls the Review-button spinner overlay (table stays visible)
  bool _isReviewLoading = false;

  // Which patientFormId is currently being reviewed (to highlight the row)
  int? _reviewingFormId;

  String? _errorMessage;
  List<PendingReviewAssistanceForm> items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // ─── Initial data fetch ─────────────────────────────────────────────────────

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await FormBuilderManager().getEmrPendingReviewForm(
        context: context,
        patientId: widget.patientId,
      );
      if (mounted) {
        setState(() {
          items = result;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load pending forms.';
          _isLoading = false;
        });
      }
    }
  }

  // ─── Review tap handler ─────────────────────────────────────────────────────

  Future<void> _onReviewPressed(
      PendingReviewAssistanceForm item, int visitId) async {
    // Prevent double-tap while a review is already in flight
    if (_isReviewLoading) return;

    await _onTap(
      ptId: item.patientId,
      patientFormId: item.patientFormId,
      visitId: visitId,
      lastFormFillByAssist: 'assistant',
    );
  }

  Future<void> _onTap({
    required int patientFormId,
    required int ptId,
    required int visitId,
    required String lastFormFillByAssist,
  }) async {
    // ── Show a small overlay spinner; keep the table intact ──────────────────
    setState(() {
      _isReviewLoading = true;
      _reviewingFormId = patientFormId;
    });

    try {
      final result = await getPatientFormByPatientID(
        context,
        patientFormId: patientFormId,
      );

      final String userRole = await TokenManager.getUserStatus();

      if (!mounted) return;

      // Clear the overlay spinner before doing anything with the Navigator
      setState(() {
        _isReviewLoading = false;
        _reviewingFormId = null;
      });

      // Guard: bail out if result is null
      if (result == null) {
        debugPrint('_onTap: result is null — aborting navigation');
        return;
      }

      // Close this popup, then push the form screen
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SideDrawerProvider>(
            create: (_) => SideDrawerProvider(),
            child: OasisFormMapper(
              form: PatientForm(
                formID: result.formId,
                formName: result.formName,
                fillStatus: result.status,
                subForms: result.subForms
                    .map(
                      (e) => PatientSubForm(
                        formID: result.formId,
                        subFormID: e.id,
                        subFormName: e.subFormName,
                        patientFormID: result.patientFormId,
                        fillStatus: e.isFilled,
                        commentCount: e.comment_count,
                      ),
                    )
                    .toList(),
              ),
              subForm: PatientSubForm(
                formID: result.formId,
                subFormID:
                    result.subForms.isNotEmpty ? result.subForms.first.id : 0,
                subFormName: result.subForms.isNotEmpty
                    ? result.subForms.first.subFormName
                    : '',
                patientFormID: result.patientFormId,
                commentCount: result.subForms.isNotEmpty
                    ? result.subForms.first.comment_count
                    : 0,
                fillStatus: result.subForms.isNotEmpty
                    ? result.subForms.first.isFilled
                    : false,
              ),
              patient: ChartPatientReferral(
                patientId: ptId,
                firstName: result.referralData.patientFirstname,
                lastName: result.referralData.patientLastname,
                contactNumber: result.referralData.patientPhone,
                address: result.referralData.patientAddress,
                imageUrl: result.referralData.patientImageUrl,
                gender: Gender(genderID: 1, genderName: 'Male'),
                dateOfBirth:
                    DateTime.tryParse(result.referralData.patientDob ?? '') ??
                        DateTime.now(),
                chartNo: result.referralData.patientChartNo,
                episodes: [],
              ),
              appBarString: 'EMR - Clinical',
              userRole: userRole,
              lastFormFillByAssist: lastFormFillByAssist,
              visitId: visitId,
            ),
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint('_onTap error: $e\n$stack');
      if (mounted) {
        setState(() {
          _isReviewLoading = false;
          _reviewingFormId = null;
        });
      }
    }
  }

  // ─── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so the table looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 640 ? screenWidth * 0.95 : 640.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.85,
        ),
        child: Container(
          width: dialogWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryAppColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                ),
                height: 37.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'Pending Forms',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: FormBuilderTextStyle.bold14style
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // ── List — flexible so it shares space with the rest ────────────
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 7.h, 16.w, 0),
                  child: SingleChildScrollView(
                    child: _buildTableBody(),
                  ),
                ),
              ),

              // ── Cancel / Skip — always at bottom, centered, equal width ────
               widget.isLastEpisode == true ? Offstage() :
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 30.h,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryAppColor,
                          side: const BorderSide(
                            color: AppColors.primaryAppColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    SizedBox(
                      width: 120.w,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onNevigate();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryAppColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableBody() {
    // ── Loading state (initial fetch only) ────────────────────────────────
    if (_isLoading) {
      return SizedBox(
        height: 200.h,
        child: const Center(
          child: CircularProgressIndicator(color: _kPrimaryBlue),
        ),
      );
    }

    // ── Error state ────────────────────────────────────────────────────────
    if (_errorMessage != null) {
      return SizedBox(
        height: 200.h,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent, size: 36.sp),
              SizedBox(height: 8.h),
              Text(
                _errorMessage!,
                style: TextStyle(fontSize: 13.sp, color: _kLightText),
              ),
              SizedBox(height: 12.h),
              TextButton(
                onPressed: _loadData,
                child: Text(
                  'Retry',
                  style: TextStyle(color: _kPrimaryBlue, fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // ── Empty state ────────────────────────────────────────────────────────
    if (items.isEmpty) {
      return SizedBox(
        height: 200.h,
        child: Center(
          child: Text(
            'No pending forms found!',
            style: TextStyle(fontSize: 13.sp, color: _kLightText),
          ),
        ),
      );
    }

    // ── Populated list ─────────────────────────────────────────────────────
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        thickness: 1,
        color: _kDivider,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final isBeingReviewed = _reviewingFormId == item.patientFormId;
        return _FormCard(
          item: item,
          isBeingReviewed: isBeingReviewed,
          onReviewPressed: () => _onReviewPressed(item, item.visitId),
        );
      },
    );
  }
}

// ─── Form Card ────────────────────────────────────────────────────────────────

class _FormCard extends StatelessWidget {
  final PendingReviewAssistanceForm item;
  final VoidCallback onReviewPressed;
  // When true, the Review button shows a mini spinner instead of text
  final bool isBeingReviewed;

  const _FormCard({
    required this.item,
    required this.onReviewPressed,
    this.isBeingReviewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Form name',
            style: TextStyle(fontSize: 13.sp, color: _kLightText),
          ),
          SizedBox(height: 4.h),
          Text(
            item.formName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: _kBodyText,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(child: _ClinicianCell(item: item)),
              SizedBox(width: 12.w),
              _ReviewButton(
                onPressed: onReviewPressed,
                isLoading: isBeingReviewed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Clinician Cell ───────────────────────────────────────────────────────────

class _ClinicianCell extends StatelessWidget {
  final PendingReviewAssistanceForm item;

  const _ClinicianCell({required this.item});

  @override
  Widget build(BuildContext context) {
    final abbreviation = item.assistantEmployeeTypeAbbreviation;
    final badgeColor = _badgeColorForType(abbreviation);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Avatar: network image with person fallback
              CircleAvatar(
                radius: 18.r,
                backgroundColor: const Color(0xFFD0C8C0),
                backgroundImage: item.assistantImage.isNotEmpty
                    ? NetworkImage(item.assistantImage)
                    : null,
                child: item.assistantImage.isEmpty
                    ? Icon(Icons.person, size: 20.sp, color: Colors.white)
                    : null,
              ),
              // Role badge
              if (abbreviation.isNotEmpty)
                Positioned(
                  bottom: -4.h,
                  right: -4.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      abbreviation,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            item.assistantName,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: _kBodyText,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ─── Review Button ────────────────────────────────────────────────────────────

class _ReviewButton extends StatelessWidget {
  final VoidCallback onPressed;
  // When true, show a small spinner in place of the label
  final bool isLoading;

  const _ReviewButton({
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: 16.w,
              height: 16.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: _kPrimaryBlue,
              ),
            )
          : Text(
              'Review',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryAppColor,
              ),
            ),
    );
  }
}


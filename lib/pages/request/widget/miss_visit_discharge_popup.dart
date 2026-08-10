import 'package:flutter/material.dart';

import 'package:clinician_app/core/constant/constant_import.dart';

import '../../../core/ui/const_sucess_popup.dart';
import '../../oasis_form_builder/services/api/managers/form_builder_manager.dart';

class DischargeMissedVisitTypePopup extends StatefulWidget {
  final int visitId;
  final VoidCallback onNevigate;
  final dynamic patientFormId;

  const DischargeMissedVisitTypePopup({
    super.key,
    required this.visitId,
    required this.onNevigate,
    this.patientFormId,
  });

  @override
  State<DischargeMissedVisitTypePopup> createState() =>
      _DischargeMissedVisitTypePopupState();
}

class _DischargeMissedVisitTypePopupState
    extends State<DischargeMissedVisitTypePopup> {
  bool _isLoadingResumption = false;
  bool _isLoadingDischarge = false;

  // ── Submit ────────────────────────────────────────────────────────────────
  Future<void> _onTap({
    required int visitTypeId,
    required String visitTypeString,
  }) async {
    final isResumption = visitTypeString == 'RECERT';

    // Set the appropriate loading state
    setState(() {
      if (isResumption) {
        _isLoadingResumption = true;
      } else {
        _isLoadingDischarge = true;
      }
    });

    // Call the patchEpisodeEnd API
    final result = await FormBuilderManager().patchEpisodeEnd(
      context: context,
      visitId: widget.visitId, // pass visit ID from prefill model
      episodeEndType: visitTypeString, // 'RESUMPTION_OF_CARE' or 'DISCHARGE'
    );

    // Always clear loading flags before any navigation
    if (mounted) {
      setState(() {
        _isLoadingResumption = false;
        _isLoadingDischarge = false;
      });
    }

    if (result.success) {
      // Close this popup, then trigger navigation callback
      if (mounted) Navigator.pop(context, true);
      widget.onNevigate();

      showSucessDialog(
        context: context,
        title: 'Successfully',
        message: 'Visit type updated successfully',
      );
    } else {
      showDocErrorDialog(
        context: context,
        title: 'Failed',
        message: result.message.isNotEmpty
            ? result.message
            : 'Something went wrong!',
      );
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so it looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 400 ? screenWidth * 0.85 : 400.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.6,
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
                        'RECERT or Discharge',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.bold14style
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

              // Body — scrolls if it's ever too tall for a small screen.
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Since this is last visit, how would you like to '
                        'proceed?\nwith the treatment plan?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.mediumgrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12.w,
                        runSpacing: 10.h,
                        children: [
                          // ── Resumption of Care ──────────────────────
                          SizedBox(
                            width: 130.w,
                            height: 40.h,
                            child: _isLoadingResumption
                                ? Center(
                                    child: SizedBox(
                                      width: 22.w,
                                      height: 22.h,
                                      child:
                                          const CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                      ),
                                    ),
                                  )
                                : OutlinedButton(
                                    onPressed: _isLoadingDischarge
                                        ? null
                                        : () => _onTap(
                                              visitTypeId: 11,
                                              visitTypeString: 'RECERT',
                                            ),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          AppColors.primaryAppColor,
                                      side: const BorderSide(
                                        color: AppColors.primaryAppColor,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                          ),

                          // ── Discharge ────────────────────────────────
                          SizedBox(
                            width: 130.w,
                            height: 40.h,
                            child: _isLoadingDischarge
                                ? Center(
                                    child: SizedBox(
                                      width: 22.w,
                                      height: 22.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: AppColors.primaryAppColor,
                                      ),
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: _isLoadingResumption
                                        ? null
                                        : () => _onTap(
                                              visitTypeId: 4,
                                              visitTypeString: 'DISCHARGE',
                                            ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.primaryAppColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

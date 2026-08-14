import 'package:flutter/material.dart';

import 'package:clinician_app/core/constant/constant_import.dart';

import '../../../core/ui/const_sucess_popup.dart';
import '../../oasis_form_builder/services/api/managers/form_builder_manager.dart';

class RecertFormDialog extends StatefulWidget {
  final int visitId;
  final dynamic visitData;
  final VoidCallback onNevigate;
  // final VoidCallback? onYesSuccess;
  // final VoidCallback? onNoSuccess;

  const RecertFormDialog({
    super.key,
    required this.visitId,
    required this.visitData, required this.onNevigate,
    // this.onYesSuccess,
    // this.onNoSuccess,
  });

  @override
  State<RecertFormDialog> createState() => _RecertFormDialogState();
}

class _RecertFormDialogState extends State<RecertFormDialog> {
  bool _isLoadingYes = false;
  bool _isLoadingNo = false;

  // ── Submit ────────────────────────────────────────────────────────────────
  Future<void> _handleDecision({
    required String decision,
    required bool isYes,
  }) async {
    setState(() {
      if (isYes) {
        _isLoadingYes = true;
      } else {
        _isLoadingNo = true;
      }
    });

    final result = await FormBuilderManager().patchRecertVisit(
      context: context,
      id: widget.visitId,
      decision: decision,
    );

    setState(() {
      _isLoadingYes = false;
      _isLoadingNo = false;
    });

    if (result.success) {
      // ── Close current dialog then open ViewStartVisit ─────────────────
      Navigator.of(context).pop();
      widget.onNevigate();

      // if (isYes) widget.onYesSuccess?.call();
      // else       widget.onNoSuccess?.call();
    } else {
      showDocErrorDialog(
        context: context,
        title: 'Failed',
        message: result.message,
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
                        'Recert',
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
                        'Would you like to complete the Recert Form?',
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
                          // ── No Button ───────────────────────────────
                          SizedBox(
                            width: 130.w,
                            height: 40.h,
                            child: _isLoadingNo
                                ? const Center(
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                      ),
                                    ),
                                  )
                                : OutlinedButton(
                                    onPressed: _isLoadingYes
                                        ? null
                                        : () => _handleDecision(
                                              decision: "no",
                                              isYes: false,
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
                                      'No',
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                          ),

                          // ── Yes Button ──────────────────────────────
                          SizedBox(
                            width: 130.w,
                            height: 40.h,
                            child: _isLoadingYes
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
                                    onPressed: _isLoadingNo
                                        ? null
                                        : () => _handleDecision(
                                              decision: "yes",
                                              isYes: true,
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

class DischargeVisitTypePopup extends StatefulWidget {
  final dynamic visitData;
  final Function(String visitType) onNavigate;
  DischargeVisitTypePopup({
    super.key,
    required this.visitData,
    required this.onNavigate,
  });

  @override
  State<DischargeVisitTypePopup> createState() =>
      _DischargeVisitTypePopupState();
}

class _DischargeVisitTypePopupState extends State<DischargeVisitTypePopup> {
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
    // final result = await patchEpisodeEnd(
    //   context: context,
    //   visitId: widget.visitData.visitId,    // pass visit ID from prefill model
    //   episodeEndType: visitTypeString,      // 'RESUMPTION_OF_CARE' or 'DISCHARGE'
    // );

    // Always clear loading flags before any navigation
    if (mounted) {
      setState(() {
        _isLoadingResumption = false;
        _isLoadingDischarge = false;
      });
    }

    // ── Close current dialog then trigger navigation callback ─────────────
    Navigator.pop(context);
    widget.onNavigate(visitTypeString);

    // if (result.success) {
    //   // Close this popup, then trigger navigation callback
    //   if (mounted) Navigator.pop(context, true);
    //   widget.onNevigate();
    //
    //   // showDialog(
    //   //   context: context,
    //   //   builder: (_) => const AddSuccessPopup(
    //   //     message: 'Visit type updated successfully',
    //   //   ),
    //   // );
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (_) => AddErrorPopup(
    //       message: result.message.isNotEmpty
    //           ? result.message
    //           : 'Something went wrong!',
    //     ),
    //   );
    // }
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
                        'NOM/NOC Form',
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
                        'Do you want to sign the NOM/NOC form?',
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
                                ? const Center(
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
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

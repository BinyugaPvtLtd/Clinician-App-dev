import 'package:flutter/material.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class FormSubmissionPopup extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final bool? loadingDuration;
  final String title;
  final String? text;
  final String? btnText;

  const FormSubmissionPopup({
    super.key,
    required this.onCancel,
    this.text,
    this.btnText,
    required this.onDelete,
    this.loadingDuration,
    required this.title,
  });

  @override
  State<FormSubmissionPopup> createState() => _FormSubmissionPopupState();
}

class _FormSubmissionPopupState extends State<FormSubmissionPopup> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so it looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 440 ? screenWidth * 0.9 : 400.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.6, // never taller than 60% of screen
        ),
        child: Container(
          width: dialogWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          // Let content size itself instead of forcing a fixed height,
          // so long text doesn't get clipped or overflow on small screens.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryAppColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        widget.title,
                        style: FormBuilderTextStyle.bold14style
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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

              // Body text — flexible, wraps, scrolls if it's ever too long
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: Text(
                    widget.text ?? 'Do you really want to delete?',
                    style: FormBuilderTextStyle.normal12style.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textGreyColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ),

              // Buttons — wraps to a new line on very narrow screens
              // instead of overflowing horizontally.
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 20.h),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 20.w,
                  runSpacing: 10.h,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: OutlinedButton(
                        onPressed: widget.onCancel,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          side: const BorderSide(
                            color: AppColors.primaryAppColor,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: FormBuilderTextStyle.normal12style.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primaryAppColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 105.w,
                      height: 30.h,
                      child: Center(
                        child: widget.loadingDuration == true
                            ? SizedBox(
                                height: 25.h,
                                width: 25.w,
                                child: const CircularProgressIndicator(
                                  color: AppColors.primaryAppColor,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : SizedBox(
                                width: 105.w,
                                height: 30.h,
                                child: ElevatedButton(
                                  onPressed: widget.onDelete,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryAppColor,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    widget.btnText ?? 'Delete',
                                    style: FormBuilderTextStyle.normal12style
                                        .copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
}

class ConfirmOasisFormPopup extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final VoidCallback onClickBtn2;
  final bool? loadingDuration;
  final String title;
  final String? text;
  final String? btnText;
  final String? btnText2;

  const ConfirmOasisFormPopup({
    super.key,
    required this.onCancel,
    this.text,
    this.btnText,
    required this.onDelete,
    this.loadingDuration,
    required this.title,
    this.btnText2,
    required this.onClickBtn2,
  });

  @override
  State<ConfirmOasisFormPopup> createState() => _ConfirmOasisFormPopupState();
}

class _ConfirmOasisFormPopupState extends State<ConfirmOasisFormPopup> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so it looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 440 ? screenWidth * 0.9 : 400.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.6, // never taller than 60% of screen
        ),
        child: Container(
          width: dialogWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          // Let content size itself instead of a fixed height, so it never
          // overflows on small screens.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryAppColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        widget.title,
                        style: FormBuilderTextStyle.bold14style
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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

              // Body text — flexible, wraps, scrolls if it's ever too long
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: Text(
                    widget.text ?? 'Do you really want to delete?',
                    style: FormBuilderTextStyle.normal12style.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textGreyColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ),

              // Buttons — wraps to a new line on very narrow screens
              // instead of overflowing horizontally.
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 12.w,
                  runSpacing: 10.h,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: OutlinedButton(
                        onPressed: widget.onCancel,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          side: const BorderSide(
                            color: AppColors.primaryAppColor,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: FormBuilderTextStyle.normal12style.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primaryAppColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (widget.loadingDuration == true)
                      SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: const CircularProgressIndicator(
                          color: AppColors.primaryAppColor,
                          strokeWidth: 2.5,
                        ),
                      )
                    else
                      SizedBox(
                        width: 105.w,
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: widget.onDelete,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryAppColor,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            widget.btnText ?? 'Delete',
                            style: FormBuilderTextStyle.normal12style
                                .copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    if (widget.loadingDuration == true)
                      SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: const CircularProgressIndicator(
                          color: AppColors.primaryAppColor,
                          strokeWidth: 2.5,
                        ),
                      )
                    else
                      SizedBox(
                        width: 105.w,
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: widget.onClickBtn2,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryAppColor,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            widget.btnText2 ?? 'Delete',
                            style: FormBuilderTextStyle.normal12style
                                .copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
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
}

class FormChangePopup extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final bool? loadingDuration;
  final String title;
  final String? text;
  final String? btnText;

  const FormChangePopup({
    super.key,
    required this.onCancel,
    this.text,
    this.btnText,
    required this.onDelete,
    this.loadingDuration,
    required this.title,
  });

  @override
  State<FormChangePopup> createState() => _FormChangePopupState();
}

class _FormChangePopupState extends State<FormChangePopup> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so it looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 440 ? screenWidth * 0.9 : 370.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.6, // never taller than 60% of screen
        ),
        child: Container(
          width: dialogWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          // Let content size itself instead of a fixed height, so it never
          // overflows on small screens.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryAppColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
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
                        widget.title,
                        style: FormBuilderTextStyle.bold14style
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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

              // Body text — flexible, wraps, scrolls if it's ever too long,
              // centered per the original design.
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: Text(
                    widget.text ?? 'Do you really want to delete?',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: FormBuilderTextStyle.normal12style.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ),
              ),

              // Buttons — wraps to a new line on very narrow screens
              // instead of overflowing horizontally.
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.w,
                  runSpacing: 10.h,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: OutlinedButton(
                        onPressed: widget.onCancel,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          side: const BorderSide(
                            color: AppColors.primaryAppColor,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: FormBuilderTextStyle.normal12style.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primaryAppColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (widget.loadingDuration == true)
                      SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: const CircularProgressIndicator(
                          color: AppColors.primaryAppColor,
                          strokeWidth: 2.5,
                        ),
                      )
                    else
                      SizedBox(
                        width: 105.w,
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: widget.onDelete,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryAppColor,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            widget.btnText ?? 'Yes',
                            style: FormBuilderTextStyle.normal12style
                                .copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
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
}

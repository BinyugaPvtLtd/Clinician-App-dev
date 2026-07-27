import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog({
  required BuildContext context,
  required String title,
  required String subtitle,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 33.w),
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Red top banner with icon
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 28.h),
                decoration: BoxDecoration(
                  color: AppColors.redColor.withValues(alpha: 0.08),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                        color: AppColors.redColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.error_rounded,
                        color: AppColors.redColor,
                        size: 36.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: EdgeInsets.fromLTRB(28.w, 20.h, 28.w, 28.h),
                child: Column(
                  children: [
                    // Text(
                    //   title,
                    //   style: AppTextStyle.normal12style.copyWith(
                    //     fontSize: 17.sp,
                    //     fontWeight: FontWeight.w700,
                    //     color: AppColors.defaultTxtGrey,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 8.h),
                    Text(
                      subtitle,
                      style: AppTextStyle.normal12style.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    PrimaryButton(
                      onTap: () => Get.back(),
                      width: double.infinity,
                      height: 46,
                      padding: EdgeInsets.zero,
                      borderRadius: 12,
                      label: "OK, Got it",
                      labelStyle: AppTextStyle.normal12style.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

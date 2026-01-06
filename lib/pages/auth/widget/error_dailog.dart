import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/token_manager/token_manager_service.dart';

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (_) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 33.w),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Yellow icon or SVG
            // Image.asset(AppAsset.logOut, height: 35.h),
            // SizedBox(height: 14.h),

            // Title
            Text(
              "Invalid credentials!",
              style: AppTextStyle.normal12style.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Unable to retrieve credentials for authorizing user.",
              style: AppTextStyle.normal12style.copyWith(
                fontSize: 12.sp,
                color: AppColors.textGreyColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 31.h),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cancel Button
                PrimaryButton(
                  onTap: () {
                    Get.back();
                  },
                  width: 100.w,
                  height: 40,
                  padding: EdgeInsets.zero,
                  borderRadius: 6,
                  label: "Ok",
                  labelStyle: AppTextStyle.normal12style.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
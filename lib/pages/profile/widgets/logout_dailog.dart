import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/calling_controller.dart';
import '../../../services/token_manager/token_manager_service.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  final callController = Get.put(CallingController());
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
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 54.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Yellow icon or SVG
                Image.asset(AppAsset.logOut, height: 35.h),
                SizedBox(height: 14.h),

                // Title
                Text(
                  "Are you Sure?",
                  style: AppTextStyle.normal12style.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  "Are you sure you really want to logout from your account?",
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
                    // Log Out Button
                    PrimaryOutlinedButton(
                      width: 100.w,
                      height: 40,
                      text: "Log Out",
                      borderWidth: 1,
                      radius: 6,
                      textStyle: AppTextStyle.normal12style.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.red,
                      ),
                      buttonColor: Colors.red,
                      onPressed: () async{
                        String fcmToken = await TokenManager.getFcmTokenRegister();
                        if(fcmToken.isEmpty){
                          TokenManager.removeAccessToken();
                          Get.offAll(()=>LoginScreen());
                        }else{
                          var response = await callController.unRegisterDevice(context: context, fcmToken: fcmToken);
                          if(response.statusCode == 201 || response.statusCode == 200){
                            TokenManager.removeFCMToken();
                            TokenManager.removeAccessToken();
                            Get.offAll(()=>LoginScreen());
                          }
                        }

                        TokenManager.removeAccessToken();

                      },
                    ),
                    customWidth(12.w),
                    // Cancel Button
                    PrimaryButton(
                      onTap: () {
                        Get.back();
                      },
                      width: 100.w,
                      height: 40,
                      padding: EdgeInsets.zero,
                      borderRadius: 6,
                      label: "Cancel",
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

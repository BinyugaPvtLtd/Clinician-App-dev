import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassResetEmailSentBottomsheet extends StatefulWidget {
  const PassResetEmailSentBottomsheet({super.key});

  @override
  State<PassResetEmailSentBottomsheet> createState() =>
      _PassResetEmailSentBottomsheetState();
}

class _PassResetEmailSentBottomsheetState
    extends State<PassResetEmailSentBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 27.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.emailSentImg, width: 85.w),
              customHeight(24.h),
              Text(
                'Please Check Your Mailbox!',
                style: AppTextStyle.normal14style.copyWith(
                  color: AppColors.defaultTxtGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              customHeight(3.h),
              Text(
                AppString.emailSentTxt,
                textAlign: TextAlign.center,
                style: AppTextStyle.normal12style.copyWith(
                  color: AppColors.defaultTxtGrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              customHeight(6.h),
              PrimaryButton(
                onTap: () {
                  Get.back();
                },
                label: 'Okay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

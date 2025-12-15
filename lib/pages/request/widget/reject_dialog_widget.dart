import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RejectDialogWidget extends StatefulWidget {
  const RejectDialogWidget({super.key});

  @override
  State<RejectDialogWidget> createState() => _RejectDialogWidgetState();
}

class _RejectDialogWidgetState extends State<RejectDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: ColoredBox(
        color: Colors.white30,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: (Get.width / 1.3).w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Reject',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppAsset.closeSvgIcon),
                      ),
                    ],
                  ),
                  customHeight(18.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reason*',
                      style: AppTextStyle.normal10style.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  ),
                  customHeight(3.h),
                  PrimaryTextField(maxLines: 4),
                  customHeight(10.h),
                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryOutlinedButton(
                          width: 54.w,
                          text: 'Cancel',
                          radius: 6.r,
                          borderWidth: 1.r,
                          onPressed: () {
                            Get.back();
                          },
                          textStyle: AppTextStyle.normal10style.copyWith(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                        customWidth(6.w),
                        PrimaryButton(
                          width: 54.w,
                          label: 'Save',
                          borderRadius: 6.r,
                          onTap: () {},
                          padding: EdgeInsets.zero,
                          labelStyle: AppTextStyle.normal10style.copyWith(
                            fontSize: 6.sp,
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
          ),
        ),
      ),
    );
  }
}

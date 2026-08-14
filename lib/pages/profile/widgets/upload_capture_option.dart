import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget uploadCaptureOption({
  required String icon,
  required String label,
  required String label2,
  required bool isRedValidation,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      Text(
        label2,
        style: AppTextStyle.bold12style.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: isRedValidation ? AppColors.redColor : AppColors.defaultTxtGrey,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      customHeight(12.h),
      InkWell(
        onTap: onTap,
        child: DottedBorder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          borderType: BorderType.RRect,
          dashPattern: [6],
          color: Color(0xffBEBEBE),
          radius: Radius.circular(6),
          strokeWidth: 1.5,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60.h,
                width: 62.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
                child: Center(child: Image.asset(icon, height: 40.h)),
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  color: Color(0xff008ABD),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

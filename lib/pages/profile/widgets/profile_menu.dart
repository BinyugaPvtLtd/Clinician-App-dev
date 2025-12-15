import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/material.dart';

Widget textMenuWidget({
  required String title,
  Widget? widget,
  Color? textColor,
  String? imageicon,
  Function()? ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (imageicon != null)
            Image.asset(imageicon.toString(), height: 20.h),
          customWidth(12.w),
          Text(
            title,
            style: AppTextStyle.bold12style.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.defaultTxtGrey,
            ),
          ),
          Spacer(),
          widget ??
              Icon(
                Icons.navigate_next_rounded,
                color: AppColors.defaultTxtGrey,
              ),
        ],
      ),
    ),
  );
}

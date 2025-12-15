import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String fontFamily = 'FiraSans';
  static TextStyle regular10style = TextStyle(
    fontSize: 10.sp,
    fontFamily: fontFamily,
  );
  static TextStyle regular12style = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamily,
  );
  static TextStyle regular14style = TextStyle(
    fontSize: 14.sp,
    fontFamily: fontFamily,
  );
  static TextStyle regular16style = TextStyle(
    fontSize: 16.sp,
    fontFamily: fontFamily,
  );
  //
  static TextStyle normal10style = TextStyle(
    fontSize: 10.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle normal12style = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle normal14style = TextStyle(
    fontSize: 14.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle normal16style = TextStyle(
    fontSize: 16.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  //
  static TextStyle bold14style = TextStyle(
    fontSize: 14.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bold12style = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle termsConditionStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamily,
    color: AppColors.textGreyColor,
  );
}

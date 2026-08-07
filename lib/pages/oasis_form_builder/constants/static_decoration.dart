import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';

// Padding
const EdgeInsets horizonatal20 = EdgeInsets.symmetric(horizontal: 20);

EdgeInsets customVerticalHorizontal20({double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: 20, vertical: vertical);

// Sizedbox
SizedBox customWidth(double width) => SizedBox(width: width);
const SizedBox width05 = SizedBox(width: 05);
const SizedBox width10 = SizedBox(width: 10);
const SizedBox width15 = SizedBox(width: 15);

SizedBox customHeight(double height) => SizedBox(height: height);
const SizedBox height05 = SizedBox(height: 05);
const SizedBox height10 = SizedBox(height: 10);
const SizedBox height15 = SizedBox(height: 15);
const SizedBox height20 = SizedBox(height: 20);
const SizedBox height16 = SizedBox(height: 16);

SizedBox sbh(double height) {
  return SizedBox(height: height.h,);
}

SizedBox sbw(double width) {
  return SizedBox(width: width.w,);
}

BorderRadius circularBorderRadius(double radius) =>
    BorderRadius.circular(radius);
BorderRadius circular5BorderRadius = BorderRadius.circular(4);
BorderRadius circular8BorderRadius = BorderRadius.circular(8);
BorderRadius circular10BorderRadius = BorderRadius.circular(10);
BorderRadius circular15BorderRadius = BorderRadius.circular(15);
BorderRadius circular20BorderRadius = BorderRadius.circular(20);
BorderRadius circular24BorderRadius = BorderRadius.circular(24);
BorderRadius circular25BorderRadius = BorderRadius.circular(25);
BorderRadius circular30BorderRadius = BorderRadius.circular(30);

Duration customDuration(int miliseconds) => Duration(milliseconds: miliseconds);

Curve easeInOutCurveCirc = Curves.easeInOutCirc;

BoxShadow commonShadow = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.4), blurRadius: 4, offset: Offset(0, 4));
LinearGradient appPrimaryGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryAppLightColor,
      AppColors.primaryAppColor,
    ]);

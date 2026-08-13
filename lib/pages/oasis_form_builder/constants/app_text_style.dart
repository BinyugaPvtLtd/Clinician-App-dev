import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';

/*class AppTextStyle {
  static const String fontFamily = 'Fira_Sans';
  static TextStyle regular10style = TextStyle(
      fontSize: 10.sp, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular12style = TextStyle(
      fontSize: 12.sp, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular14style = TextStyle(
      fontSize: 14.sp, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular16style = TextStyle(
      fontSize: 16.sp, fontFamily: fontFamily, color: AppColors.textGreyColor);
  //
  static TextStyle normal10style = TextStyle(
      fontSize: 10.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle bold10Style = TextStyle(
      fontSize: 10.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: AppColors.textGreyColor);
  static TextStyle normal12style = TextStyle(
      fontSize: 12.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle normal14style = TextStyle(
      fontSize: 14.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle normal16style = TextStyle(
      fontSize: 16.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);

  //
  static TextStyle bold14style = TextStyle(
      fontSize: 14.sp,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      color: AppColors.textGreyColor);
  static TextStyle termsConditionStyle = TextStyle(
      fontSize: 12.sp, fontFamily: fontFamily, color: AppColors.textGreyColor);

  static Map<String,Style> htmlTextStyle(bool selected) {
    return {
      "h1": Style(
        color: selected
            ? Colors.white
            : const Color(0xff686464), // Customize text color
        fontSize: FontSize(24), // Set font size
        fontWeight: FontWeight.bold, // Make it bold
      ),
      "p": Style(
        color: selected
            ? Colors.white
            : const Color(0xff686464), // Set text color
        fontSize: FontSize(10.sp)
      ),
      "body": Style(
        fontFamily: 'Fira_Sans',
        color: selected
            ? Colors.white
            : const Color(0xff686464), // Set text color
          fontSize: FontSize(10.sp)
      ),
      "b": Style(
        color: selected
            ? Colors.white
            : const Color(0xff686464), // Style for <b> tags
          fontSize: FontSize(10.sp)
      ),
    };
  }

  static Map<String,Style> enableDisableHtmlStyle(bool selected) {
    return {
      "h1": Style(
        color: !selected
            ? const Color(0xffc1c1c1)
            : const Color(0xff686464), // Customize text color
        fontSize: FontSize(24), // Set font size
        fontWeight: FontWeight.bold, // Make it bold
      ),
      "p": Style(
        color: !selected
            ? const Color(0xffc1c1c1)
            : const Color(0xff686464), // Set text color
          fontSize: FontSize(10.sp)
      ),
      "body": Style(
        fontFamily: 'Fira_Sans',
        color: !selected
            ? const Color(0xffc1c1c1)
            : const Color(0xff686464), // Set text color
          fontSize: FontSize(10.sp)
      ),
      "b": Style(
        color: !selected
            ?const Color(0xffc1c1c1)
            : const Color(0xff686464), // Style for <b> tags
          fontSize: FontSize(10.sp)
      ),
    };
  }
}*/

class FormBuilderTextStyle {
  static const String fontFamily = 'Fira_Sans';
  static TextStyle regular10style = TextStyle(
      fontSize: 10, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular12style = TextStyle(
      fontSize: 12, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular14style = TextStyle(
      fontSize: 14, fontFamily: fontFamily, color: AppColors.textGreyColor);
  static TextStyle regular16style = TextStyle(
      fontSize: 16, fontFamily: fontFamily, color: AppColors.textGreyColor);

  //
  static TextStyle normal10style = TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle bold10Style = TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: AppColors.textGreyColor);
  static TextStyle normal12style = TextStyle(
      fontSize: 12,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle normal14style = TextStyle(
      fontSize: 18,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);
  static TextStyle normal16style = TextStyle(
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor);

  //
  static TextStyle bold14style = TextStyle(
      fontSize: 18,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      color: AppColors.textGreyColor);
  static TextStyle termsConditionStyle = TextStyle(
      fontSize: 12, fontFamily: fontFamily, color: AppColors.textGreyColor);

  static Map<String, Style> htmlTextStyle(bool selected) {
    return {
      "h1": Style(
        color: selected
            ? Colors.white
            : const Color(0xff686464), // Customize text color
        fontSize: FontSize(24), // Set font size
        fontWeight: FontWeight.bold, // Make it bold
      ),
      "p": Style(
          color: selected
              ? Colors.white
              : const Color(0xff686464), // Set text color
          fontSize: FontSize(14)),
      "body": Style(
          fontFamily: 'Fira_Sans',
          color: selected
              ? Colors.white
              : const Color(0xff686464), // Set text color
          fontSize: FontSize(14)),
      "b": Style(
          color: selected
              ? Colors.white
              : const Color(0xff686464), // Style for <b> tags
          fontSize: FontSize(14)),
    };
  }

  static Map<String, Style> enableDisableHtmlStyle(bool selected) {
    return {
      "h1": Style(
        color: !selected
            ? const Color(0xffc1c1c1)
            : const Color(0xff686464), // Customize text color
        fontSize: FontSize(24), // Set font size
        fontWeight: FontWeight.bold, // Make it bold
      ),
      "p": Style(
          color: !selected
              ? const Color(0xffc1c1c1)
              : const Color(0xff686464), // Set text color
          fontSize: FontSize(14)),
      "body": Style(
          fontFamily: 'Fira_Sans',
          color: !selected
              ? const Color(0xffc1c1c1)
              : const Color(0xff686464), // Set text color
          fontSize: FontSize(14)),
      "b": Style(
          color: !selected
              ? const Color(0xffc1c1c1)
              : const Color(0xff686464), // Style for <b> tags
          fontSize: FontSize(14)),
    };
  }
}

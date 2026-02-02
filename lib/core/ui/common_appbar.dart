import 'package:clinician_app/core/constant/app_text_style.dart';
import 'package:clinician_app/core/constant/static_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';

class CommonAppbar extends StatelessWidget {
   CommonAppbar({
    super.key,
    required this.label,
    this.padding,
    this.onTap,
    this.forgroundColor,
    this.labelStyle,
    this.widget,
    this.trailing,
     this.isBackButton = true,
  });
  final String label;
  final EdgeInsets? padding;
  final Color? forgroundColor;
  final TextStyle? labelStyle;
  final Widget? widget;
   Widget? trailing;
  final Function()? onTap;
  final bool? isBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
        isBackButton! ?  InkWell(
            onTap:
                onTap ??
                () {
                  Get.back();
                },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: forgroundColor ?? AppColors.defaultTxtGrey,
              size: 18,
            ),
          ) : SizedBox.shrink(),
          customWidth(9.w),
          Expanded(
            child:
                widget ??
                Text(
                  label,
                  style:
                      labelStyle ??
                      AppTextStyle.normal14style.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.defaultTxtGrey,
                      ),
                ),
          ),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

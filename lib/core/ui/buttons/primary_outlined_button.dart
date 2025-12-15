import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/material.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  const PrimaryOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.fillColor,
    this.textColor,
    this.textStyle,
    this.radius,
    this.height,
    this.width,
    this.icon,
    this.isIconStart,
    this.spaceBetweenIconText,
    this.borderWidth,
    this.padding,
  });
  final String text;
  final void Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? radius;
  final bool? isIconStart;
  final double? height;
  final double? width;
  final Widget? icon;
  final double? spaceBetweenIconText;
  final double? borderWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.maxFinite,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: fillColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 60),
          border: Border.all(
            color: buttonColor ?? AppColors.primaryAppColor,
            width: borderWidth ?? 2.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && (isIconStart != true)) ...[
              icon!,
              customWidth((spaceBetweenIconText ?? 10).w),
            ],
            Text(
              text,
              style:
                  textStyle ??
                  AppTextStyle.regular10style.copyWith(
                    color:
                        textColor ?? buttonColor ?? AppColors.primaryAppColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (icon != null && isIconStart == true) ...[
              customWidth((spaceBetweenIconText ?? 10).w),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}

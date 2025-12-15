import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.labelStyle,
    this.buttonColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.icon,
  });
  final String label;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;
  final Color? buttonColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onTap;

  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        margin: margin,
        width: width ?? double.maxFinite,
        alignment: Alignment.center,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 15.h, horizontal: 84.w),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primaryAppColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 200.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, customWidth(10.w)],
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  labelStyle ??
                  AppTextStyle.regular16style.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

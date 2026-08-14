import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  const PrimaryOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.textStyle,
    this.radius,
    this.height,
    this.width,
    this.icon,
    this.spaceBetweenIconText,
    this.child,
  });
  final String text;
  final Widget? child;
  final void Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? radius;
  final double? height;
  final double? width;
  final Widget? icon;
  final double? spaceBetweenIconText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            border:
                Border.all(color: buttonColor ?? AppColors.primaryAppColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              customWidth((spaceBetweenIconText ?? 10).w)
            ],
            child ??
                Text(
                  text,
                  style: textStyle ??
                      FormBuilderTextStyle.regular10style.copyWith(
                        color: textColor ??
                            buttonColor ??
                            AppColors.primaryAppColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
          ],
        ),
      ),
    );
  }
}

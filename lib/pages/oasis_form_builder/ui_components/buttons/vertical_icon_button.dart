import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

import '../../constants/responsive.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton(
      {super.key,
      required this.label,
      this.onTap,
      this.labelStyle,
      this.buttonColor,
      this.borderRadius,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.icon});
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
        padding: padding ??
            EdgeInsets.symmetric(vertical: (7.5).h, horizontal:Responsive.isMobile(context) ? 10.w:25.w),
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            boxShadow: [commonShadow.copyWith(offset: Offset(0, 2.h))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, customHeight(13.h)],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: labelStyle ??
                    FormBuilderTextStyle.regular16style
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

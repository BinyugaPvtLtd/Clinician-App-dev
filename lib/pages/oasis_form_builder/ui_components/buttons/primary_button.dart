import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
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
      this.icon,
      this.centerLabel = true});

  final String label;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;
  final Color? buttonColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool centerLabel;
  final void Function()? onTap;

  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
   
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        // height: height ?? 50,
        margin: margin,
        // width: width ?? double.maxFinite,
        alignment: centerLabel ? Alignment.center : null,
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: isMobile
                    ? 15
                    : isTablet
                        ? 15
                        : 15,
                horizontal: 20),
        decoration: BoxDecoration(
            color: buttonColor ?? AppColors.primaryAppLightColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            boxShadow: [commonShadow.copyWith(offset: Offset(0, 2.h),color: AppColors.greyColor)]),
        child: Row(
          mainAxisAlignment:
              centerLabel ? MainAxisAlignment.center : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, customWidth(10.w)],
            Flexible(
              child: Text(
                label,
                textAlign: centerLabel ? TextAlign.center : TextAlign.start,
                style: labelStyle ??
                    FormBuilderTextStyle.normal10style.copyWith(
                        // fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

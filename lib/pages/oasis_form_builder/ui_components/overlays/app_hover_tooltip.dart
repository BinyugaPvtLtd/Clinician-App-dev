import 'package:custom_tooltip/custom_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class AppHoverTooltip extends StatefulWidget {
  const AppHoverTooltip(
      {super.key, required this.tooltipTxt, required this.child});
  final String tooltipTxt;
  final Widget child;

  @override
  State<AppHoverTooltip> createState() => _AppHoverTooltipState();
}

class _AppHoverTooltipState extends State<AppHoverTooltip> {
  @override
  Widget build(BuildContext context) {
    return CustomTooltip(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
      tooltip: Text(
        widget.tooltipTxt,
        style: FormBuilderTextStyle.normal12style,
        textAlign: TextAlign.center,
      ),
      tooltipHeight: 35.h,
      hoverShowDelay: Duration.zero,
      hideDuration: Duration.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [commonShadow],
      ),
      child: widget.child,
    );
  }
}

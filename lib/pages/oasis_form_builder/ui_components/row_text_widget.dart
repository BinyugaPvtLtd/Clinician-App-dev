import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class RowTextWithWidget extends StatelessWidget {
  const RowTextWithWidget(
      {super.key,
      required this.first,
      required this.second,
      this.lastWidget,
      this.bottomSpace});
  final Widget first;
  final Widget second;
  final Widget? lastWidget;
  final double? bottomSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: (bottomSpace ?? 14).h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          first,
          customWidth(9.w),
          second,
          if (lastWidget != null) ...[const Spacer(), lastWidget!]
        ],
      ),
    );
  }
}

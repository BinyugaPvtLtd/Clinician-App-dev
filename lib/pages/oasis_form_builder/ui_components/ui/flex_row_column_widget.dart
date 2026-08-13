import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';

class FlexRowColWidget extends StatefulWidget {
  const FlexRowColWidget(
      {super.key,
      required this.firstChild,
      required this.second,
      this.betweenHeight,
      this.betweenWidth});
  final Widget firstChild;
  final List<Widget> second;
  final double? betweenHeight;
  final double? betweenWidth;

  @override
  State<FlexRowColWidget> createState() => _FlexRowColWidgetState();
}

class _FlexRowColWidgetState extends State<FlexRowColWidget> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
      children: [
        widget.firstChild,
        SizedBox(
          height: widget.betweenHeight ?? 14.h,
          width: widget.betweenWidth,
        ),
        ...widget.second
      ],
    );
  }
}

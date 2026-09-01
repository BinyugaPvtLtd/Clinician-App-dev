import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

typedef DynamicCallBack = Function(String value, int index);

class DynamicButtonElement extends StatelessWidget {
  const DynamicButtonElement(
      {super.key,
      required this.label,
      required this.value,
      required this.selected,
      required this.onTap,
      required this.index,
      this.hint});

  final String label;
  final String value;
  final int index;
  final DynamicCallBack onTap;
  final bool selected;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getButtonWidget(),
          if (hint != null)
            Flexible(
              child: _getHintWidget(),
            )
        ],
      ),
    );
  }

  Widget _getButtonWidget() {
    return InkWell(
      onTap: () {
        onTap(value, index);
      },
      hoverColor: const Color(0xff51B5E6),
      child: Container(
          constraints: BoxConstraints(minWidth: 50.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: selected ? const Color(0xff51B5E6) : Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.black.withAlpha(25))
              ]),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
          child: Center(
            child: Html(
              shrinkWrap: true,
              data: label,
              style: FormBuilderTextStyle.htmlTextStyle(selected),
            ),
          )),
    );
  }

  Widget _getHintWidget() {
    return Html(
      shrinkWrap: true,
      data: '<i>$hint</i>',
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }
}

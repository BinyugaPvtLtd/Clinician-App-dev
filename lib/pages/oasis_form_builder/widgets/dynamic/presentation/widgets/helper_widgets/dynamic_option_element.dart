import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';

import '../../../../../constants/responsive.dart';
import '../../../../popup/popup_handler.dart';
import 'dynamic_checkbox_element.dart';

typedef DynamicCallBack = Function(String value, int index);

class DynamicOptionElement extends StatelessWidget {
  const DynamicOptionElement(
      {super.key,
      required this.label,
      required this.value,
      required this.selected,
      required this.onTap,
      this.optionsAlignment = OptionsAlignment.horizontal,
      required this.index,
      this.hint,
      this.popupCode,
      this.isTitleCenter = false,
      this.disableValueShow = false,
      this.onPopupValueChange});

  final String label;
  final String value;
  final int index;
  final DynamicCallBack onTap;
  final bool selected;
  final bool isTitleCenter;
  final String? hint;
  final String? popupCode;
  final OptionsAlignment optionsAlignment;
  final bool disableValueShow;

  final PopupValueChangeCallBack? onPopupValueChange;

  @override
  Widget build(BuildContext context) {
    return optionsAlignment == OptionsAlignment.vertical
        ? Responsive.isMobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getOptionsBox(context, isTitleCenter: isTitleCenter),
                  if ((hint?.trim() ?? "").isNotEmpty)
                    Align(
                        alignment: Alignment.centerLeft,
                        child: _getHint(hint!)),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 2,
                    child:
                        _getOptionsBox(context, isTitleCenter: isTitleCenter),
                  ),
                  if ((hint ?? "").isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: _getHint(hint!),
                      ),
                    ),
                ],
              )
        : /*Responsive.isMobile(context)
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _getOptionsBox(context, isTitleCenter: isTitleCenter),
                if ((hint ?? "").isNotEmpty)
                  Align(
                      alignment: Alignment.bottomRight, child: _getHint(hint!)),
              ])
            : */Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _getOptionsBox(context, isTitleCenter: isTitleCenter, optionsAlignment: optionsAlignment),
                  if ((hint ?? "").isNotEmpty) _getHint(hint!),
                ],
              );
  }

  Widget _getHint(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        hint,
        style: FormBuilderTextStyle.normal10style
            .copyWith(fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _getOptionsBox(BuildContext context, {bool? isTitleCenter, OptionsAlignment optionsAlignment = OptionsAlignment.vertical}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: InkWell(
        onTap: () {
          // onTap(value, index);
          processOnTap(context, selected);
        },
        // hoverColor: const Color(0xff51B5E6),
        child: Container(
           width: Responsive.isMobile(context) && optionsAlignment == OptionsAlignment.vertical ? double.infinity : null,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: selected ? const Color(0xff51B5E6) : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(25),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0),
              ]),
          padding: const EdgeInsets.all(4),
          child: isTitleCenter ?? false
              ? Center(
                  child: Html(
                    shrinkWrap: true,
                    data:
                        "$label${(value != label && selected && value.isNotEmpty) && !disableValueShow ? " : [${value}]" : ""}",
                    style: FormBuilderTextStyle.htmlTextStyle(selected),
                  ),
                )
              : Html(
                  shrinkWrap: true,
                  data:
                      "$label${(value != label && selected && value.isNotEmpty)&&!disableValueShow ? " : [${value}]" : ""}",
                  style: FormBuilderTextStyle.htmlTextStyle(selected),
                ),
        ),
      ),
    );
  }

  void processOnTap(BuildContext context, bool? isSelected) {
    if (isSelected == false && (popupCode ?? '').isNotEmpty) {
      PopupHandler.showPopup(context, popupCode!, (popupValue) {
        if (popupValue.isNotEmpty) {
          if (onPopupValueChange != null) {
            onPopupValueChange!(popupValue);
          }
          onTap(value, index);
        }
      });
    } else {
      onTap(value, index);
    }
  }
}

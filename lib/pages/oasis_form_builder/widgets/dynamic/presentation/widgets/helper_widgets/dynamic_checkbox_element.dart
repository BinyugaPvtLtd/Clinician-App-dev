import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';

import '../../../../../constants/responsive.dart';

typedef DynamicCheckBoxCallBack = void Function(bool value, int index);
typedef PopupValueChangeCallBack = void Function(String popupValue);

class DynamicCheckboxElement extends StatelessWidget {
  const DynamicCheckboxElement({
    super.key,
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
    required this.index,
    this.optionsAlignment = OptionsAlignment.horizontal,
    this.padding,
    this.enabled = true,
    this.hint,
    this.popupCode,
    this.onPopupValueChange,
  });

  final String label;
  final String value;
  final int index;
  final DynamicCheckBoxCallBack onTap;
  final PopupValueChangeCallBack? onPopupValueChange;
  final bool selected;
  final OptionsAlignment? optionsAlignment;
  final EdgeInsets? padding;
  final bool enabled;
  final String? hint;
  final String? popupCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (enabled) {
                processOnTap(context, !selected);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: AbsorbPointer(
                    absorbing: !enabled || (popupCode ?? '').isNotEmpty,
                    child: Checkbox(
                      value: selected,
                      activeColor: enabled
                          ? AppColors.checkBoxBlueColor
                          : AppColors.checkBoxBlueColor.withAlpha(50),
                      focusColor: AppColors.checkBoxBlueColor,
                      side: BorderSide(
                          color: !enabled
                              ? AppColors.checkBoxBlueColor.withAlpha(50)
                              : AppColors.checkBoxBlueColor,
                          width: 1.5),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      onChanged: (value) {
                        if (enabled) {
                          processOnTap(context, value);
                        }
                      },
                    ),
                  ),
                ),
                if (label.isNotEmpty)
                  Flexible(
                    child: Html(
                      data: label,
                      shrinkWrap: true,
                      style: FormBuilderTextStyle.enableDisableHtmlStyle(
                          enabled),
                    ),
                  ),
                if ((popupCode ?? '').isNotEmpty & selected)
                  Flexible(
                    child: Html(
                      data: ': <i>$value</i>',
                      shrinkWrap: true,
                      style: FormBuilderTextStyle.htmlTextStyle(false),
                    ),
                  ),
                if (hint != null &&
                    hint!.isNotEmpty &&
                    !Responsive.isMobile(context))
                  Flexible(
                    child: _getHintWidget(hint!),
                  ),
              ],
            ),
          ),
          if (hint != null && hint!.isNotEmpty && Responsive.isMobile(context))
            _getHintWidget(hint!)
        ],
      ),
    );
  }

  Widget _getHintWidget(String hint) {
    return Html(
      data: hint,
      shrinkWrap: true,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  void processOnTap(BuildContext context, bool? value) {
    if (value != null) {
      if (value == true && (popupCode ?? '').isNotEmpty) {
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
}

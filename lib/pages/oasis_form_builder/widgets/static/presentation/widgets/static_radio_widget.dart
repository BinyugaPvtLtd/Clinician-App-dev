import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../popup/popup_handler.dart';

class StaticRadioWidget extends StatelessWidget {
  const StaticRadioWidget({
    super.key,
    required this.subQuestionWrapper,
    this.enabled = true,
  });

  final SubQuestionWrapper subQuestionWrapper;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
          builder: (BuildContext context, subQuestionWrapper, Widget? child) {
            final subQuestion = subQuestionWrapper.subQuestion;
            return subQuestion.scrollAxisAlignment ==
                OptionsAlignment.horizontal
                ? Responsive.isMobile(context)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitleWidget(context, subQuestion),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      Wrap(
                        spacing: 20,
                        children: [
                          ...getWidget(context, subQuestionWrapper),
                        ],
                      )
                    else
                      ...getWidget(context, subQuestionWrapper),
                  ],
                ),
                if (subQuestion.flags.isNotEmpty)
                  FlagOverlayWidget(flagList: subQuestion.flags)
              ],
            )
                : Row(
              children: [
                if (subQuestion.title.isNotEmpty)
                  Expanded(
                    flex: 4,
                    child: getTitleWidget(context, subQuestion),
                  ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (subQuestion.optionsAlignment ==
                          OptionsAlignment.horizontal)
                        Wrap(
                          spacing: 20,
                          children: [
                            ...getWidget(context, subQuestionWrapper),
                          ],
                        )
                      else
                        ...getWidget(context, subQuestionWrapper),
                    ],
                  ),
                ),
                if (subQuestion.flags.isNotEmpty)
                  FlagOverlayWidget(flagList: subQuestion.flags)
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (subQuestion.title.isNotEmpty)
                      Expanded(child: getTitleWidget(context, subQuestion)),
                    if (subQuestion.flags.isNotEmpty)
                      FlagOverlayWidget(flagList: subQuestion.flags)
                  ],
                ),
                if (subQuestion.optionsAlignment ==
                    OptionsAlignment.horizontal)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Wrap(
                      spacing: 20,
                      children: [
                        ...getWidget(context, subQuestionWrapper),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...getWidget(context, subQuestionWrapper),
                      ],
                    ),
                  )
              ],
            );
          }),
    );

    // return subQuestion.optionsAlignment == OptionsAlignment.horizontal
    //     ? Wrap(
    //         runSpacing: 14.w,
    //         spacing: 10.h,
    //         children: subQuestion.options
    //             .map(
    //               (e) => getWidget(context, static: e),
    //             )
    //             .toList(),
    //       )
    //     : Column(
    //         children: subQuestion.options
    //             .map(
    //               (e) => getWidget(context, static: e),
    //             )
    //             .toList(),
    //       );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subQuestion.code != null && subQuestion.code!.isNotEmpty)
          QuestionMarkupCode(code: subQuestion.code!),
        Flexible(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  List<Widget> getWidget(BuildContext context,
      SubQuestionWrapper subQuestionWrapper) {
    return subQuestionWrapper.subQuestion.options
        .map(
          (option) =>
          StaticRadioElement(
            subQueWrapper: subQuestionWrapper,
            optionIndex: option.index,
            enabled: enabled,
          ),
    )
        .toList();
  }
}

class StaticRadioElement extends StatelessWidget {
  const StaticRadioElement({super.key,
    required this.subQueWrapper,
    required this.optionIndex,
    this.enabled = true});

  final SubQuestionWrapper subQueWrapper;
  final int optionIndex;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final option = subQueWrapper.subQuestion.options[optionIndex];
      var subQuestion = subQueWrapper.subQuestion;
      var groupValue = subQuestion.options
          .firstWhereOrNull((option) => option.selected)
          ?.value;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 15.h,
            width: 15.w,
            child: Radio(
              value: option.value,
              groupValue: groupValue,
              activeColor: enabled
                  ? AppColors.textGreyColor
                  : AppColors.textGreyColor.withAlpha(50),
              fillColor: WidgetStatePropertyAll(enabled
                  ? AppColors.textGreyColor
                  : AppColors.textGreyColor.withAlpha(50)),
              onChanged: (value) {
                if (!enabled) {
                  return;
                }
                if ((option.popupCode ?? '').isNotEmpty) {
                  PopupHandler.showPopup(context, option.popupCode!,
                          (popupValue) {
                        subQueWrapper.addNotesToOption(
                            option.index, popupValue);
                        groupValue = popupValue;
                        subQueWrapper.toggleOption(optionIndex);
                        // for (var i in subQuestion.options) {
                        //   i.selected = (popupValue == i.value);
                        // }
                        // subQueWrapper.forceNotify();
                      });
                } else {
                  groupValue = value ?? "";
                  subQueWrapper.toggleOption(optionIndex);
                  // for (var i in subQuestion.options) {
                  //   i.selected = (value == i.value);
                  // }
                  // subQueWrapper.forceNotify();
                }
              },
            ),
          ),
          customWidth(2.w),
          Flexible(
            child: Html(
              data: option.label,
              shrinkWrap: true,
              style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
              // style: FormBuilderTextStyle.normal10style,
            ),
          ),
          if (option.selected && (option.popupCode ?? '').isNotEmpty)
            Flexible(
              child: Html(
                data: ': <i>${option.value}</i>',
                shrinkWrap: true,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
                // style: FormBuilderTextStyle.normal10style,
              ),
            ),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_option_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../ui_components/app_hover_tooltip.dart';

class StaticOptionWidget extends StatelessWidget {
  const StaticOptionWidget({
    super.key,
    required this.subQuestionWrapper,
  });

  final SubQuestionWrapper subQuestionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal
              ? Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: getTitleWidget(context, subQuestion),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      ),
                    ),
                    if (subQuestion.flags.isNotEmpty)
                      FlagOverlayWidget(flagList: subQuestion.flags)
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(child: getTitleWidget(context, subQuestion)),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    ),
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      Wrap(
                        spacing: 20,
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      )
                    else
                      ...getOptionsWidgets(context, subQuestionWrapper),
                  ],
                );
        },
      ),
    );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return TitleDescription(
      code: subQuestion.code,
      title: subQuestion.title,
      description: subQuestion.description,
    );
  }

  List<Widget> getOptionsWidgets(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return subQuestion.options.map((option) {
      return DynamicOptionElement(
        label: option.label,
        value: option.value,
        selected: option.selected,
        onTap: (value, index) {
          subQuestionWrapper.toggleOption(option.index);
        },
        index: option.index,
        optionsAlignment: subQuestion.optionsAlignment,
        hint: option.hint,
        popupCode: option.popupCode,
        onPopupValueChange: (newValue){
          subQuestionWrapper.updateTextFieldValue(option.index, newValue);
        },
      );
    }).toList();
  }
}

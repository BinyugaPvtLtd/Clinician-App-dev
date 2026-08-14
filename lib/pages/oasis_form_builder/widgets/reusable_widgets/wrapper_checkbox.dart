import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';

import '../../provider/sub_question_wrapper_provider.dart';
import '../dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';

class SubQuestionCheckbox extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final int optionIndex;
  final bool isEnabled;
  final Function(bool value)? onChange;

  const SubQuestionCheckbox({
    super.key,
    required this.subQuestionWrapper,
    required this.optionIndex,
    this.isEnabled = true,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return DynamicCheckboxElement(
      label: option.label,
      value: option.value,
      selected: option.selected,
      onTap: (value, __) {
        subQuestionWrapper.toggleOption(option.index);
        if(onChange!=null)
          {
            onChange!(value);
          }
      },
      index: option.index,
      popupCode: option.popupCode,
      onPopupValueChange: (newValue) {
        subQuestionWrapper.addNotesToOption(option.index, newValue);
      },
      enabled: isEnabled,
    );
  }
}

class QuestionCheckbox extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  final int optionIndex;
  final bool isEnabled;

  const QuestionCheckbox({
    super.key,
    required this.questionWrapper,
    required this.optionIndex,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final option = questionWrapper.question.options![optionIndex];
    return DynamicCheckboxElement(
      label: option.label,
      value: option.value,
      selected: option.selected,
      onTap: (_, __) {
        questionWrapper.toggleOption(option.index);
      },
      index: option.index,
      popupCode: option.popupCode,
      onPopupValueChange: (newValue) {
        questionWrapper.addNotesToOption(option.index, newValue);
      },
      enabled: isEnabled,
    );
  }
}

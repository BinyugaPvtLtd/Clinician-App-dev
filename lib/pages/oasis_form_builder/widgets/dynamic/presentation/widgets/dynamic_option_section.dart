import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:provider/provider.dart';

import '../../../../provider/question_wapper_provider.dart';
import 'helper_widgets/dynamic_option_element.dart';

class DynamicOptionSection extends StatelessWidget {
  const DynamicOptionSection({
    super.key,
    required this.questionWrapper,
  });

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          final question = questionWrapper.question;
          final options = question.options;
          final optionsAlignment =
              question.optionsAlignment ?? OptionsAlignment.vertical;
          return optionsAlignment == OptionsAlignment.horizontal
              ? Wrap(
                  children: options!.map((option) {
                    return DynamicOptionElement(
                      label: option.label,
                      value: option.value,
                      selected: option.selected,
                      index: option.index,
                      onTap: (String value, index) {
                        questionWrapper.toggleOption(index);
                      },
                      hint: option.hint,
                      optionsAlignment: OptionsAlignment.horizontal,
                      popupCode: option.popupCode,
                      onPopupValueChange: (newValue) {
                        questionWrapper.updateTextFieldValue(
                            option.index, newValue);
                      },
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: options!.map((option) {
                    return DynamicOptionElement(
                      label: option.label,
                      value: option.value,
                      selected: option.selected,
                      index: option.index,
                      onTap: (String value, index) {
                        questionWrapper.toggleOption(index);
                      },
                      hint: option.hint,
                      optionsAlignment: OptionsAlignment.vertical,
                      popupCode: option.popupCode,
                      onPopupValueChange: (newValue) {
                        questionWrapper.updateTextFieldValue(
                            option.index, newValue);
                      },
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}

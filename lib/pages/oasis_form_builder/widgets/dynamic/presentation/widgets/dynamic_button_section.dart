import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_button_element.dart';
import 'package:provider/provider.dart';

import '../../../../provider/question_wapper_provider.dart';


class DynamicButtonSection extends StatelessWidget {
  const DynamicButtonSection({
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
                    return DynamicButtonElement(
                      label: option.label,
                      value: option.value,
                      selected: option.selected,
                      index: option.index,
                      onTap: (String value, index) {
                        questionWrapper.toggleOption(index);
                      },
                      hint: option.hint,
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options!.map((option) {
                    return DynamicButtonElement(
                      label: option.label,
                      value: option.value,
                      selected: option.selected,
                      index: option.index,
                      onTap: (String value, index) {
                        questionWrapper.toggleOption(index);
                      },
                      hint: option.hint,
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}

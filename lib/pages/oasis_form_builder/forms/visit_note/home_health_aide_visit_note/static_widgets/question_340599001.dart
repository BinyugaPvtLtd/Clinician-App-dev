import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question340599001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question340599001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBox(questionWrapper, 0),
                    _getCheckBox(questionWrapper, 1),
                    _getCheckBox(questionWrapper, 2),
                    _getCheckBox(questionWrapper, 3),
                    _getCheckBox(questionWrapper, 4),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBox(questionWrapper, 5),
                    _getCheckBox(questionWrapper, 6),
                    _getCheckBox(questionWrapper, 7),
                    _getCheckBox(questionWrapper, 8),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper, int optionIndex,
      {bool isEnabled = true}) {
    return QuestionCheckbox(
      questionWrapper: questionWrapper,
      optionIndex: optionIndex,
      isEnabled: isEnabled,
    );
  }
}

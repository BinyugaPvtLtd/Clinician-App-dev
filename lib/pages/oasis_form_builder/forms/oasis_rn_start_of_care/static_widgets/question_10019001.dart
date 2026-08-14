import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10019001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10019001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers[0],
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              Row(
                children: [
                  Expanded(child: _getCheckBox(subQuestionWrapper, 1)),
                  Expanded(child: _getCheckBox(subQuestionWrapper, 2)),
                  Expanded(child: _getCheckBox(subQuestionWrapper, 3)),
                  Expanded(child: _getCheckBox(subQuestionWrapper, 4)),
                ],
              ),
              _getCheckBox(subQuestionWrapper, 5),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
    );
  }
}

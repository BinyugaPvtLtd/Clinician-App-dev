import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10012003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10012003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          final subQuestionWrappers = questionWrapper.subQuestionWrappers;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(questionWrapper, subQuestionWrappers[0], 0, true),
              Wrap(
                children: [
                  ...subQuestionWrappers[1].subQuestion.options.map(
                        (option) => _getCheckBox(
                          questionWrapper,
                          subQuestionWrappers[1],
                          option.index,
                          !subQuestionWrappers[0]
                              .subQuestion
                              .options
                              .first
                              .selected,
                        ),
                      ),
                ],
              ),
              ...subQuestionWrappers[2].subQuestion.options.map(
                    (option) => _getCheckBox(
                      questionWrapper,
                      subQuestionWrappers[2],
                      option.index,
                      !subQuestionWrappers[0].subQuestion.options.first.selected,
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (_){
        questionWrapper.forceNotify();
      },
    );
  }
}

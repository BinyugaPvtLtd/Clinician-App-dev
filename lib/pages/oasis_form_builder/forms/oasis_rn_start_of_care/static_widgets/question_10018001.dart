import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10018001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10018001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper, Widget? child) {
          final mainOptionSelected =questionWrapper.subQuestionWrappers.first.subQuestion.options.first.selected;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(questionWrapper, questionWrapper.subQuestionWrappers.first, 0, true),
              StaticCheckBoxWidget(subQuestionWrapper: questionWrapper.subQuestionWrappers[1],enabled: !mainOptionSelected,)
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

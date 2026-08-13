import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10017001 extends StatelessWidget {
  const Question10017001({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getCheckBox(que, que.subQuestionWrappers[0], 0, true),
            StaticCheckBoxWidget(
              subQuestionWrapper: que.subQuestionWrappers[1],
              enabled: !que
                  .subQuestionWrappers[0].subQuestion.options.first.selected,
            ),
            StaticCheckBoxWidget(
              subQuestionWrapper: que.subQuestionWrappers[2],
              enabled: !que
                  .subQuestionWrappers[0].subQuestion.options.first.selected,
            ),
          ],
        );
      }),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (value){
        questionWrapper.forceNotify();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10014003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10014003({super.key, required this.questionWrapper});

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
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final itemWidth = constraints.maxWidth /
                      (Responsive.isMobile(context) ? 2 : 4);
                  return Wrap(
                    children: [
                      ...subQuestionWrappers[1].subQuestion.options.map(
                            (option) => SizedBox(
                              width: itemWidth,
                              child: _getCheckBox(
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
                          ),
                    ],
                  );
                },
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
      onChange: (value) {
        questionWrapper.forceNotify();
      },
    );
  }
}

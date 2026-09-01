import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/reusable_widgets/wrapper_checkbox.dart';
import 'package:provider/provider.dart';


class Question350601001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question350601001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          final options = questionWrapper.question.options!;
          final length = options.length;
          return Column(
            children: [
              if (length % 2 == 0)
                for(int i=0;i<length;i=i+2)
                  _getRow(questionWrapper, i)
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i=0;i<length-1;i=i+2)
                      _getRow(questionWrapper, i),
                    _getCheckBox(questionWrapper, length - 1),
                  ],
                )

            ],
          );
        },
      ),
    );
  }

  Widget _getRow(QuestionWrapper questionWrapper, int optionIndex)
  {
    return Row(
      children: [
        Expanded(
          child: _getCheckBox(questionWrapper, optionIndex),
        ),
        Expanded(
          child: _getCheckBox(questionWrapper, optionIndex+1),
        ),
      ],
    );
  }


  Widget _getCheckBox(QuestionWrapper questionWrapper, optionIndex) {
    return QuestionCheckbox(questionWrapper: questionWrapper, optionIndex: optionIndex);
  }
}

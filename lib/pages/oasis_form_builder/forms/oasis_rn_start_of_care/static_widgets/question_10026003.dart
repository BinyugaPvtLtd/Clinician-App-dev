import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10026003_3 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10026003_3({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              _getCheckBox(subQuestionWrapper, 1),
              _getCheckBox(subQuestionWrapper, 2),
              Row(
                children: [
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 3),
                  ),
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 4),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 5),
                  ),
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 6),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 7),
                  ),
                  Expanded(
                    child: _getCheckBox(subQuestionWrapper, 8),
                  ),
                ],
              )
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

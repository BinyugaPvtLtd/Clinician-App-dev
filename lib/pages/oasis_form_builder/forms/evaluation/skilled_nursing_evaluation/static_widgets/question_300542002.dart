import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/question_wapper_provider.dart';

class Question300542002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question300542002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper value, Widget? child) {
          return Row(
            children: [
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
                ),
              ),
              StaticCheckBoxWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
              ),
            ],
          );
        },
      ),
    );
  }
}

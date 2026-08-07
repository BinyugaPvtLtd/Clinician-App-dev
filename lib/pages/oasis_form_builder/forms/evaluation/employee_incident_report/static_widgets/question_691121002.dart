import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10001008.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';

class Question691121002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question691121002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        StaticDateTimeFieldElement(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
        ),
        StaticDateFieldWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
        ),
      ],
    );
  }
}

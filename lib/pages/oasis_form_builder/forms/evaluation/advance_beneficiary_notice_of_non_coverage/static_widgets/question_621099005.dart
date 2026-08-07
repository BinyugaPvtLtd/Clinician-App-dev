import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../../constants/responsive.dart';

class Question621099005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question621099005({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile?Column(
      spacing: 10.h,
      children: [
        ...questionWrapper.subQuestionWrappers
            .map((subQuestionWrapper) =>
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper))
            .toList(),
      ],
    ):Row(
      spacing: 30.w,
      children: questionWrapper.subQuestionWrappers
          .map((subQuestionWrapper) =>
              Expanded(child: StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper)))
          .toList(),
    );
  }
}

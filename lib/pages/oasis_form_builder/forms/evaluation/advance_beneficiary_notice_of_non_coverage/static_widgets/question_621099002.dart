import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question621099002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question621099002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    //TEST
    return isMobile?Column(spacing: 10.h,children: [
      StaticTextFieldWidget(
        subQuestionWrapper: subQuestionWrappers[0],
      ),
      StaticTextFieldWidget(
        subQuestionWrapper: subQuestionWrappers[1],
      ),
      StaticTextFieldWidget(
        subQuestionWrapper: subQuestionWrappers[2],
      ),
    ],):Column(
      spacing: 10.h,
      children: [
        Row(
          spacing: 20.w,
          children: [
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: subQuestionWrappers[0],
              ),
            ),
            Expanded(child: sbw(0)),
            Expanded(child: sbw(0))
          ],
        ),
        Row(
          spacing: 20.w,
          children: [
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: subQuestionWrappers[1],
              ),
            ),
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: subQuestionWrappers[2],
              ),
            ),
            Expanded(child: sbw(0))
          ],
        ),
      ],
    );
  }
}

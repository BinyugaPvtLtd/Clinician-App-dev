import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';

import '../../../oasis_rn_start_of_care/static_widgets/question_10002001.dart';

class Question731136001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  const Question731136001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Responsive(
        tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            StaticDateFieldWidget(subQuestionWrapper: subQuestionWrappers[0]),
            TitleDescription(
              title: subQuestionWrappers[1].subQuestion.title,
            ),
            HorizontalTextFields(
                subQuestionWrapper: subQuestionWrappers[1],
                option1Index: 0,
                option2Index: 1),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[2]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[3]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[4]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[5]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[6]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[7]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[8]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[9]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[10]),
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[11]),
          ],
        ),
        desktop: Row(
          spacing: 60.w,
          children: [
            Expanded(
              child: Column(
                children: [
                  StaticDateFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[0]),
                  TitleDescription(
                    title: subQuestionWrappers[1].subQuestion.title,
                  ),
                  HorizontalTextFields(
                      subQuestionWrapper: subQuestionWrappers[1],
                      option1Index: 0,
                      option2Index: 1),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[2]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[3]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[4]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[5]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[6]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[7]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[8]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[9]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[10]),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[11]),
                ],
              ),
            )
          ],
        ));
  }
}

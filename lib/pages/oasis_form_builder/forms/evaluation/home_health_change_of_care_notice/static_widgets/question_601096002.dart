import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';

class Question601096002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question601096002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Responsive(
        tablet: Column(
          spacing: 10.h,
          children: [
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[0],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[1],
            ),
            TitleDescription(
              title: "<b>Patient Name:</b>",
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[2],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[3],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[4],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[5],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[6],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[7],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[8],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[9],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[10],
            ),
            StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrappers[11],
            ),
          ],
        ),
        desktop: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[0],
                  ),
                ),
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[1],
                  ),
                ),
                Expanded(child: sbw(0))
              ],
            ),
            TitleDescription(
              title: "<b>Patient Name:</b>",
            ),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[2],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[3],
                        ),
                      ),
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[4],
                        ),
                      ),
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[5],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[6],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[7],
                        ),
                      ),
                      Expanded(
                        child: sbw(0),
                      ),
                      Expanded(
                        child: sbw(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[8],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[9],
                        ),
                      ),
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrappers[10],
                        ),
                      ),
                      Expanded(
                        child: sbw(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[11],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: sbw(0),
                ),
              ],
            ),
          ],
        ));
  }
}

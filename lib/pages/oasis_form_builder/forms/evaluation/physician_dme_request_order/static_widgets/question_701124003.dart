import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question701124003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  const Question701124003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper = questionWrapper.subQuestionWrappers.first;
    return Responsive(
        tablet: Row(
          spacing: 25,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Html(
                    data: subQuestionWrapper.subQuestion.options.first.label,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.first,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (index, value) {
                        subQuestionWrapper.updateTextFieldValue(index, value);
                      }),
                ),
              ],
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Html(
                      data: subQuestionWrapper.subQuestion.options.last.label,
                      shrinkWrap: true,
                      style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
                    ),
                  ),
                  Expanded(
                    child: StaticTextFieldElement(
                        option: subQuestionWrapper.subQuestion.options.last,
                        subQuestion: subQuestionWrapper.subQuestion,
                        onUpdate: (index, value) {
                          subQuestionWrapper.updateTextFieldValue(index, value);
                        }),
                  ),
                ],
              ),
            ),
            Expanded(child: Container())
          ],
        ),
        desktop: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Expanded(
                  child: Html(
                    data: subQuestionWrapper.subQuestion.options.first.label,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.first,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (index, value) {
                        subQuestionWrapper.updateTextFieldValue(index, value);
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Html(
                    data: subQuestionWrapper.subQuestion.options.last.label,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.last,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (index, value) {
                        subQuestionWrapper.updateTextFieldValue(index, value);
                      }),
                ),
              ],
            )
          ],
        ));
  }
}

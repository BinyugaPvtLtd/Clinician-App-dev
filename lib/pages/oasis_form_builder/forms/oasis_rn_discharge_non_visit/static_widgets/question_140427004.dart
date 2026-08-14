import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question140427004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140427004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Html(
                    data:
                        "<b>4. Last 7 days</b><br> Check all of the nutritional approaches that were received in the last 7 days",
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  Html(
                    data:
                        "<b>5. At discharge</b><br> Check all of the nutritional approaches that were being received at discharge",
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Html(
                    data:
                        "<div style='text-align:center;'><b>Check all <br>↓ that apply ↓</b></div>",
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Html(
                          data:
                              "<div style='text-align:center;'><b>4. Last 7 days</b></div>",
                          style: FormBuilderTextStyle.htmlTextStyle(false),
                        ),
                      ),
                      Expanded(
                        child: Html(
                          data:
                              "<div style='text-align:center;'><b>5. At discharge</b></div>",
                          style: FormBuilderTextStyle.htmlTextStyle(false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[0]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[1]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[2]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[3]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[4]),
        _getDivider(),
      ],
    );
  }

  Widget _getDivider() {
    return Divider();
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          final option1 = subQuestion.options[0];
          final option2 = subQuestion.options[1];
          return Row(
            children: [
              Expanded(
                flex: 4,
                child: Html(
                  data: subQuestion.title,
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SubQuestionCheckbox(
                        subQuestionWrapper: subQuestionWrapper,
                        optionIndex: option1.index,
                        isEnabled: true,
                      ),
                      SubQuestionCheckbox(
                        subQuestionWrapper: subQuestionWrapper,
                        optionIndex: option2.index,
                        isEnabled: true,
                      ),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}

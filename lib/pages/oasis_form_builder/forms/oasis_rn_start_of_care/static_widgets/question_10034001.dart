import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_style.dart';
import '../../../widgets/static/presentation/widgets/title_description.dart';

class Question10034002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10034002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 20,
      children: [
        const SizedBox(
          height: 20,
        ),
        _getHtmlRow(context, "<b><u>Primary Diagnosis</u></b>",
            "<b><u>Other Diagnosis</u></b>",
            code1: "M1021", code2: "M1023"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.greyColor),
          ),
          padding: const EdgeInsets.all(10),
          child: _getHtmlRow(context, "<b>Column 1</b>", "<b>Column 2</b>"),
        ),
        _getHtmlRow(
          context,
          " Diagnoses (Sequencing of diagnosis should reflect the seriousness of each condition and support the disciplines and services provided)",
          " ICD-10-CM and symptom control rating for each condition. Note that the sequencing of these ratings may not match sequencing of the diagnoses",
        ),
        _getDivider(),
        _getHtmlRow(context, "<b>Description</b>",
            "<b>ICD-10-CM / Symptom Control Rating</b>",
            alignment1: MainAxisAlignment.start,
            alignment2: MainAxisAlignment.start),
        _getDivider(),
        _getHtmlRow(context, "<b>Primary Diagnosis</b>",
            "<b> V, W, X, Y codes NOT allowed</b>",
            code1: "M1021",
            alignment1: MainAxisAlignment.start,
            alignment2: MainAxisAlignment.start),
        _getDivider(),
        Column(
          children: [
            _getHtmlRow(context, "", "I10",
                alignment2: MainAxisAlignment.start),
            _getRadioRow(
              context,
              "a. Essential (primary) hypertension 03/27/2024",
              subQuestionWrappers[0],
            ),
          ],
        ),
        _getDivider(),
        _getHtmlRow(context, "<b>Other Diagnoses</b>",
            "<b>All ICD-10-CM codes allowed</b>",
            alignment1: MainAxisAlignment.start,
            alignment2: MainAxisAlignment.start,
            code1: "M1023"),
        _getDivider(),
        _getRadioRow(
          context,
          "b.",
          subQuestionWrappers[1],
        ),
        _getDivider(),
        _getRadioRow(
          context,
          "c.",
          subQuestionWrappers[2],
        ),
        _getDivider(),
        _getRadioRow(
          context,
          "d.",
          subQuestionWrappers[3],
        ),
        _getDivider(),
        _getRadioRow(
          context,
          "e.",
          subQuestionWrappers[4],
        ),
        _getDivider(),
        _getRadioRow(
          context,
          "f.",
          subQuestionWrappers[5],
        ),
      ],
    );
  }

  Widget _getRadioRow(
      BuildContext context, String title, SubQuestionWrapper wrapper) {
    return Row(
      spacing: 50,
      children: [
        Expanded(
          child: _getCodeAndTitle(context, title,
              alignment: MainAxisAlignment.start),
        ),
        Expanded(
          child: Center(
            child: StaticRadioWidget(
              subQuestionWrapper: wrapper,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDivider() {
    return Divider();
  }

  Widget _getHtmlRow(BuildContext context, String text1, String text2,
      {String? code1,
      String? code2,
      MainAxisAlignment alignment1 = MainAxisAlignment.center,
      MainAxisAlignment alignment2 = MainAxisAlignment.center}) {
    return Row(
      spacing: 50,
      children: [
        Expanded(
            child: _getCodeAndTitle(context, text1,
                code: code1, alignment: alignment1)),
        Expanded(
            child: _getCodeAndTitle(context, text2,
                code: code2, alignment: alignment2)),
      ],
    );
  }

  Widget _getCodeAndTitle(BuildContext context, String title,
      {String? code, MainAxisAlignment alignment = MainAxisAlignment.center}) {
    return Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (code != null && code.isNotEmpty) QuestionMarkupCode(code: code),
        Flexible(
          child: Html(
            shrinkWrap: true,
            data: '$title',
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }
}

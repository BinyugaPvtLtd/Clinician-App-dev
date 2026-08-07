import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';

import '../../../../constants/app_text_style.dart';
import '../../../popup/popup_handler.dart';

class StaticInfoWidget extends StatelessWidget {
  final StaticQuestionModel subQuestion;

  const StaticInfoWidget({super.key, required this.subQuestion});

  @override
  Widget build(BuildContext context) {
    return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal
        ? Row(
            children: [
              Expanded(
                child: getTitleWidget(context),
              ),
              if(subQuestion.description.isNotEmpty)
              Expanded(child: getDescriptionWidget)
            ],
          )
        : Column(
            children: [
              getTitleWidget(context),
              getDescriptionWidget,
            ],
          );
  }

  Widget getTitleWidget(BuildContext context) {
    return subQuestion.title.isEmpty?SizedBox():Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (subQuestion.code != null && subQuestion.code!.isNotEmpty)
            ? QuestionMarkupCode(code:subQuestion.code!)
            : const SizedBox(
                width: 1,
              ),
        Expanded(
          child: Html(
            data: subQuestion.title,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  get getDescriptionWidget => subQuestion.description.isEmpty?SizedBox():Html(
        data: subQuestion.description,
        style: FormBuilderTextStyle.htmlTextStyle(false),
      );
}

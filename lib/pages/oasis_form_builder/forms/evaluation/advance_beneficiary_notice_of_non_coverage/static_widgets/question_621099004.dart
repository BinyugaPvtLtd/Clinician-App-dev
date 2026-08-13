import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';

class Question621099004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question621099004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers.first;
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers.last;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isMobile)
          Html(
            data: subQuestionWrapper1.subQuestion.options.first.label.substring(0,subQuestionWrapper1.subQuestion.options.first.label.length-9), //Separating <b>D.</b> from label
            style: FormBuilderTextStyle.htmlTextStyle(false),
            shrinkWrap: true,
          ),
        Wrap(
          children: [
            Html(
              data: isMobile?subQuestionWrapper1.subQuestion.options.first.label.substring(subQuestionWrapper1.subQuestion.options.first.label.length-9):subQuestionWrapper1.subQuestion.options.first.label,
              style: FormBuilderTextStyle.htmlTextStyle(false),
              shrinkWrap: true,
            ),
            SizedBox(
              width: isMobile?80.w:120.w,
              child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper1,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context,
                      SubQuestionWrapper subQuestionWrapper, Widget? child) {
                    return StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.first,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    );
                  },
                ),
              ),
            ),
            Html(
              data: subQuestionWrapper1.subQuestion.notice??"",
              style: FormBuilderTextStyle.htmlTextStyle(false),
              shrinkWrap: true,
            ),
          ],
        ),
        TitleDescription(title: subQuestionWrapper2.subQuestion.title,),
        if(isMobile)
        Html(
          data: subQuestionWrapper2.subQuestion.options.first.label.substring(0,subQuestionWrapper2.subQuestion.options.first.label.length-9), //Separating <b>D.</b> from label
          style: FormBuilderTextStyle.htmlTextStyle(false),
          shrinkWrap: true,
        ),
        Wrap(
          children: [
            Html(
              data: isMobile?subQuestionWrapper2.subQuestion.options.first.label.substring(subQuestionWrapper2.subQuestion.options.first.label.length-9):subQuestionWrapper1.subQuestion.options.first.label,
              style: FormBuilderTextStyle.htmlTextStyle(false),
              shrinkWrap: true,
            ),
            SizedBox(
              width: isMobile?80.w:120.w,
              child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper2,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context,
                      SubQuestionWrapper subQuestionWrapper, Widget? child) {
                    return StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.first,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    );
                  },
                ),
              ),
            ),
            Html(
              data: subQuestionWrapper2.subQuestion.notice??"",
              style: FormBuilderTextStyle.htmlTextStyle(false),
              shrinkWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}

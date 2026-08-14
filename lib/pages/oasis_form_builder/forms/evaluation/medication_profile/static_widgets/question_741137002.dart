import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';


class Question741137002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question741137002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 20.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Html(
              data: subQuestionWrappers[0].subQuestion.title,
              shrinkWrap: true,
              style: FormBuilderTextStyle.htmlTextStyle(false),
            ),
            HorizontalTextFields(
             // labelWidth: 95.w,
              subQuestionWrapper: subQuestionWrappers[0],
              option1Index: 0,
              option2Index: 1,
            ),
          ],
        ),
        Row(
          spacing: 8.w,
          children: [
            SizedBox(
              width: 95.w,
              child: TitleDescription(
                title: subQuestionWrappers[1].subQuestion.title,
              ),
            ),
            Expanded(
                child: ChangeNotifierProvider<SubQuestionWrapper>.value(
              value: subQuestionWrappers[1],
              child: Consumer<SubQuestionWrapper>(
                builder: (BuildContext context,
                    SubQuestionWrapper subQuestionWrapper, Widget? child) {
                  return StaticTextFieldElement(
                      option: subQuestionWrapper.subQuestion.options.first,
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      });
                },
              ),
            ))
          ],
        )
      ],
    );
  }
}

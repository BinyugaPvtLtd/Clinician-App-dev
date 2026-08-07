import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question611097002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question611097002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          StaticDateFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
          ),
          Html(
            data: questionWrapper.subQuestionWrappers[2].subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
          HorizontalTextFields(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[2],
            option1Index: 0,
            option2Index: 1,
          ),
          StaticTextFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[4],
          ),
          StaticDateFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
          ),
          StaticTextFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[3],
          ),
          StaticTextFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[5],
          ),
        ],
      ),
      desktop: Column(
        spacing: 20,
        children: [
          Row(
            spacing: 30.w,
            children: [
              Expanded(
                child: StaticDateFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
                ),
              ),
              Expanded(
                child: StaticDateFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
                ),
              ),
            ],
          ),
          Row(
            spacing: 30.w,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Html(
                      data: questionWrapper
                          .subQuestionWrappers[2].subQuestion.title,
                      shrinkWrap: true,
                      style: FormBuilderTextStyle.htmlTextStyle(false),
                    ),
                    Expanded(
                      child: HorizontalTextFields(
                        subQuestionWrapper:
                            questionWrapper.subQuestionWrappers[2],
                        option1Index: 0,
                        option2Index: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[3],
                ),
              ),
            ],
          ),
          Row(
            spacing: 30.w,
            children: [
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[4],
                ),
              ),
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[5],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';

class Question741137001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question741137001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 20.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Responsive(
          tablet: Row(
            children: [
              Html(
                data: subQuestionWrappers[0].subQuestion.title,
                shrinkWrap: true,
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
              Expanded(
                child: HorizontalTextFields(
                    textfieldWidth: MediaQuery.sizeOf(context).width / 5,
                    subQuestionWrapper: subQuestionWrappers[0],
                    option1Index: 0,
                    option2Index: 1),
              ),
            ],
          ),
          desktop: Wrap(
            children: [
              Html(
                data: subQuestionWrappers[0].subQuestion.title,
                shrinkWrap: true,
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
              HorizontalTextFields(
                  subQuestionWrapper: subQuestionWrappers[0],
                  option1Index: 0,
                  option2Index: 1),
            ],
          ),
        ),
        Responsive(
          tablet: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Row(
                spacing: 20.w,
                children: [
                  Expanded(
                    child: StaticDateFieldWidget(
                        subQuestionWrapper: subQuestionWrappers[1]),
                  ),
                  Expanded(
                    child: StaticDateFieldWidget(
                        subQuestionWrapper: subQuestionWrappers[2]),
                  ),
                  Expanded(child: Container())
                ],
              ),
              Row(
                spacing: 5,
                children: [
                  Html(
                    data: subQuestionWrappers[3].subQuestion.title,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  SizedBox(
                      width: 110,
                      child: _getDateField(context, subQuestionWrappers[3], 0)),
                  Html(
                    data: 'To',
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  SizedBox(
                      width: 110,
                      child: _getDateField(context, subQuestionWrappers[3], 1)),
                ],
              ),
            ],
          ),
          desktop: Row(
            spacing: 30.w,
            children: [
              Expanded(
                  child: Row(
                spacing: 20.w,
                children: [
                  Expanded(
                    child: StaticDateFieldWidget(
                        subQuestionWrapper: subQuestionWrappers[1]),
                  ),
                  Expanded(
                    child: StaticDateFieldWidget(
                        subQuestionWrapper: subQuestionWrappers[2]),
                  ),
                ],
              )),
              Expanded(
                  child: Wrap(
                spacing: 5.w,
                alignment: WrapAlignment.end,
                children: [
                  Html(
                    data: subQuestionWrappers[3].subQuestion.title,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: _getDateField(context, subQuestionWrappers[3], 0),
                  ),
                  Html(
                    data: 'To',
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: _getDateField(context, subQuestionWrappers[3], 1),
                  ),
                ],
              )),
            ],
          ),
        ),
        Responsive(
            tablet: Column(
              spacing: 15,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticDropdownWidget(
                    subQuestionWrapper: subQuestionWrappers[4],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[5],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[6],
                  ),
                ),
              ],
            ),
            desktop: Wrap(
              spacing: 15.w,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticDropdownWidget(
                    subQuestionWrapper: subQuestionWrappers[4],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[5],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 235.w),
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[6],
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget _getDateField(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return StaticDateFieldElement(
            onDateChange: (newDate) {
              subQuestionWrapper.updateTextFieldValue(
                optionIndex,
                newDate.toIso8601String(),
              );
            },
            initialDate: DateTime.tryParse(
                subQuestionWrapper.subQuestion.options[optionIndex].value),
          );
        },
      ),
    );
  }
}

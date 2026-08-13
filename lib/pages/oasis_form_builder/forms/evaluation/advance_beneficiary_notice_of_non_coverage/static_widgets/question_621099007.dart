import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';

class Question621099007 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question621099007({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final bool isMobile=Responsive.isMobile(context);
    //FOR RADIO
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers.first;
    //FOR TEXTFIELDS
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers.last;
    return isMobile?Column(
      children: [
        ...List.generate(questionWrapper.subQuestionWrappers.first.subQuestion.options.length, (index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper1,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context,
                      SubQuestionWrapper subQuestionWrapper, Widget? child) {
                    return StaticRadioElement(subQueWrapper: subQuestionWrapper, optionIndex: index, );
                  },
                ),
              ),
              Row(
                children: [
                  Html(
                    data: subQuestionWrapper2.subQuestion.options[index].label,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                    shrinkWrap: true,
                  ),
                  SizedBox(
                    width: 120.w,
                    child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                      value: subQuestionWrapper2,
                      child: Consumer<SubQuestionWrapper>(
                        builder: (BuildContext context,
                            SubQuestionWrapper subQuestionWrapper, Widget? child) {
                          return StaticTextFieldElement(
                            option: subQuestionWrapper.subQuestion.options[index],
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
                ],
              ),

              Html(
                data: subQuestionWrapper2.subQuestion.options[index].hint ?? "",
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            ],
          );
        })
      ],
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(questionWrapper.subQuestionWrappers.first.subQuestion.options.length, (index){
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper1,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context,
                      SubQuestionWrapper subQuestionWrapper, Widget? child) {
                    return StaticRadioElement(subQueWrapper: subQuestionWrapper, optionIndex: index, );
                  },
                ),
              ),
              Html(
                data: subQuestionWrapper2.subQuestion.options[index].label,
                style: FormBuilderTextStyle.htmlTextStyle(false),
                shrinkWrap: true,
              ),
              SizedBox(
                width: 120.w,
                child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                  value: subQuestionWrapper2,
                  child: Consumer<SubQuestionWrapper>(
                    builder: (BuildContext context,
                        SubQuestionWrapper subQuestionWrapper, Widget? child) {
                      return StaticTextFieldElement(
                        option: subQuestionWrapper.subQuestion.options[index],
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
              Expanded(
                child: Html(
                  data: subQuestionWrapper2.subQuestion.options[index].hint ?? "",
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}

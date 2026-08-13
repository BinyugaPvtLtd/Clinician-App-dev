import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question340598002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question340598002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[0]),
        _getRow1(subQuestionWrappers[1]),
        _getRow2(subQuestionWrappers[2], isMobile),
        _getRow3(subQuestionWrappers[3], isMobile),
        _getRow4(subQuestionWrappers[4], isMobile),
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[5]),
      ],
    );
  }

  Widget _getRow1(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Row(
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              SizedBox(
                width: 120.w,
                child: _getTextField(subQuestionWrapper, 1,
                    isEnabled:
                        subQuestionWrapper.subQuestion.options.first.selected),
              ),
              Html(
                data: 'days',
                shrinkWrap: true,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(
                    subQuestionWrapper.subQuestion.options.first.selected),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getRow2(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return isMobile?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              _getTextField(subQuestionWrapper, 1,
                  isEnabled: subQuestionWrapper
                      .subQuestion.options.first.selected),
            ],
          ):Row(
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 100.w),
                  child: _getTextField(subQuestionWrapper, 1,
                      isEnabled: subQuestionWrapper
                          .subQuestion.options.first.selected),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow3(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return isMobile?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBox(subQuestionWrapper, 1,
                        isEnabled:
                        subQuestionWrapper.subQuestion.options.first.selected),
                    _getCheckBox(subQuestionWrapper, 2,
                        isEnabled:
                        subQuestionWrapper.subQuestion.options.first.selected),
                  ],
                ),
              )
            ],
          ):Row(
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              _getCheckBox(subQuestionWrapper, 1,
                  isEnabled:
                      subQuestionWrapper.subQuestion.options.first.selected),
              _getCheckBox(subQuestionWrapper, 2,
                  isEnabled:
                      subQuestionWrapper.subQuestion.options.first.selected),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow4(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final enabled = subQuestionWrapper.subQuestion.options.first.selected;
          return isMobile?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBox(subQuestionWrapper, 1, isEnabled: enabled),
                    Wrap(
                      children: [
                        _getCheckBox(subQuestionWrapper, 2, isEnabled: enabled),
                        Html(
                          data: 'Of',
                          shrinkWrap: true,
                          style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: _getTextField(subQuestionWrapper, 3, isEnabled: enabled),
                        ),
                        Html(
                          data: 'lb. Over',
                          shrinkWrap: true,
                          style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: _getTextField(subQuestionWrapper, 4, isEnabled: enabled),
                        ),
                        Html(
                          data: '(Time Period)',
                          shrinkWrap: true,
                          style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ):Wrap(
            children: [
              _getCheckBox(subQuestionWrapper, 0),
              _getCheckBox(subQuestionWrapper, 1, isEnabled: enabled),
              _getCheckBox(subQuestionWrapper, 2, isEnabled: enabled),
              Html(
                data: 'Of',
                shrinkWrap: true,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
              ),
              SizedBox(
                width: 80.w,
                child: _getTextField(subQuestionWrapper, 3, isEnabled: enabled),
              ),
              Html(
                data: 'lb. Over',
                shrinkWrap: true,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
              ),
              SizedBox(
                width: 80.w,
                child: _getTextField(subQuestionWrapper, 4, isEnabled: enabled),
              ),
              Html(
                data: '(Time Period)',
                shrinkWrap: true,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, int optionIndex,
      {bool isEnabled = true}) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: isEnabled,
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex,
      {bool isEnabled = true}) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];

    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (optionIndex, value) {
        subQuestionWrapper.updateTextFieldValue(optionIndex, value);
      },
      enabled: isEnabled,
    );
  }
}

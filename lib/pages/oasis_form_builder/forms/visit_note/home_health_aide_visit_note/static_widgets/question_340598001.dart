import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../../widgets/static/data/static_option_model.dart';

class Question340598001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question340598001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(spacing: 15, children: [
      StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[0]),
      _getRow(subQuestionWrappers[1], isMobile),
      _getRow(subQuestionWrappers[2], isMobile),
      _getRow(subQuestionWrappers[3], isMobile),
      _getRow(subQuestionWrappers[4], isMobile),
      _getRow(subQuestionWrappers[5], isMobile),
      _getRow(subQuestionWrappers[6], isMobile),
      _getRow(subQuestionWrappers[7], isMobile),
    ]);
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final option1 = subQuestionWrapper.subQuestion.options[0];
          final option2 = subQuestionWrapper.subQuestion.options[1];
          final option3 = subQuestionWrapper.subQuestion.options[2];
          return Column(
            children: [
              Row(
                spacing: 10.w,
                children: [
                  Expanded(
                    child: SubQuestionCheckbox(
                      subQuestionWrapper: subQuestionWrapper,
                      optionIndex: option1.index,
                      isEnabled: true,
                      onChange: (_) {
                        questionWrapper.forceNotify();
                      },
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      child: _getTextField(subQuestionWrapper, option2,
                          option1.selected, isMobile),
                    ),
                  if (!isMobile)
                    Expanded(
                        child: _getTextField(subQuestionWrapper, option3,
                            option1.selected, isMobile)),
                ],
              ),
              if (isMobile)
                Row(
                  spacing: 10,
                  children: [

                    Expanded(
                      child: _getTextField(
                          subQuestionWrapper, option2, option1.selected, isMobile),
                    ),

                    Expanded(
                      child: _getTextField(
                          subQuestionWrapper, option3, option1.selected, isMobile),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool isEnabled, bool isMobile) {
    return isMobile
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(
                data: option.label,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(isEnabled),
                shrinkWrap: true,
              ),
              StaticTextFieldElement(
                option: option,
                subQuestion: subQuestionWrapper.subQuestion,
                onUpdate: (optionIndex, newValue) {
                  subQuestionWrapper.updateTextFieldValue(
                      optionIndex, newValue);
                },
                enabled: isEnabled,
              ),
            ],
          )
        : Row(
            spacing: 10.w,
            children: [
              Html(
                data: option.label,
                style: FormBuilderTextStyle.enableDisableHtmlStyle(isEnabled),
                shrinkWrap: true,
              ),
              Expanded(
                child: StaticTextFieldElement(
                  option: option,
                  subQuestion: subQuestionWrapper.subQuestion,
                  onUpdate: (optionIndex, newValue) {
                    subQuestionWrapper.updateTextFieldValue(
                        optionIndex, newValue);
                  },
                  enabled: isEnabled,
                ),
              ),
            ],
          );
  }
}

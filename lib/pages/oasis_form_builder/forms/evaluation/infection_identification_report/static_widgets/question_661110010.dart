import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question661110010 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question661110010({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 350.w),
          child: StaticRadioWidget(
              subQuestionWrapper: questionWrapper.subQuestionWrappers.first),
        ),
        if (isMobile) Column(
          spacing: 10.h,
          children: [
            _getTextField(questionWrapper.subQuestionWrappers.last, 0,isMobile),
            _getTextField(questionWrapper.subQuestionWrappers.last, 1,isMobile),
          ],
        ) else Row(
          spacing: 30.w,
          children: [
            Expanded(child: _getTextField(questionWrapper.subQuestionWrappers.last, 0,isMobile)),
            Expanded(child: _getTextField(questionWrapper.subQuestionWrappers.last, 1,isMobile)),
          ],
        ),
      ],
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex, bool isMobile) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return isMobile?Column(
            children: [
              TitleDescription(title: subQuestionWrapper.subQuestion.options[optionIndex].label,),
              StaticTextFieldElement(
                  option: subQuestionWrapper.subQuestion.options[optionIndex],
                  subQuestion: subQuestionWrapper.subQuestion,
                  onUpdate: (optionIndex, value) {
                    subQuestionWrapper.updateTextFieldValue(optionIndex, value);
                  })
            ],
          ):Row(
            children: [
              Expanded(child: TitleDescription(title: subQuestionWrapper.subQuestion.options[optionIndex].label,)),
              Expanded(
                child: StaticTextFieldElement(
                    option: subQuestionWrapper.subQuestion.options[optionIndex],
                    subQuestion: subQuestionWrapper.subQuestion,
                    onUpdate: (optionIndex, value) {
                      subQuestionWrapper.updateTextFieldValue(optionIndex, value);
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}

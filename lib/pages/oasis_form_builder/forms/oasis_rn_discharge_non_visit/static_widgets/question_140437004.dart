import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_option_model.dart';

class Question140437004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140437004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "↓ Check all that apply  ",
          style: FormBuilderTextStyle.normal10style,
        ),
        ...questionWrapper.subQuestionWrappers
            .map((subQuestionWrapper) => _getRow(subQuestionWrapper, isMobile)),
      ],
    );
  }

  _getRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    final option1 = subQuestionWrapper.subQuestion.options[0];
    final option2 = subQuestionWrapper.subQuestion.options[1];
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return isMobile?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, option1),
              SizedBox(height: 5,),
              _getTextFieldLabel(option2),
              SizedBox(height: 5,),
              _getTextFieldWidget(subQuestionWrapper, option2),
            ],
          ): Row(
            children: [
              Expanded(
                child: _getCheckBox(subQuestionWrapper, option1),
              ),
              Expanded(
                child: Row(
                  children: [
                    _getTextFieldLabel(option2),
                    Expanded(
                        child:
                            _getTextFieldWidget(subQuestionWrapper, option2)),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getTextFieldWidget(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option2) {
    return StaticTextFieldElement(
      option: option2,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (optionIndex, value) {
        subQuestionWrapper.updateTextFieldValue(optionIndex, value);
      },
    );
  }

  Widget _getTextFieldLabel(StaticOptionModel option2) {
    return Text(
      option2.label,
      style: FormBuilderTextStyle.normal10style,
    );
  }

  Widget _getCheckBox(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option1) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option1.index,
      isEnabled: true,
    );
  }
}

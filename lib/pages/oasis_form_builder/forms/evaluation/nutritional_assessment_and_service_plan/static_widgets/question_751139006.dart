import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

class Question751139006 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question751139006({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Wrap(
            spacing: 10,
            children: [
              _getTextField(subQuestionWrapper, 0),
              _getTextField(subQuestionWrapper, 1),
              _getTextField(subQuestionWrapper, 2),
            ],
          );
        },
      ),
    );
  }

  _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 75,
          child: TitleDescription(
            title: option.label,
          ),
        ),
        SizedBox(
          width: 160,
          child: StaticTextFieldElement(
            option: option,
            subQuestion: subQuestionWrapper.subQuestion,
            onUpdate: (optionIndex, value) {
              subQuestionWrapper.updateTextFieldValue(optionIndex, value);
            },
          ),
        )
      ],
    );
  }
}

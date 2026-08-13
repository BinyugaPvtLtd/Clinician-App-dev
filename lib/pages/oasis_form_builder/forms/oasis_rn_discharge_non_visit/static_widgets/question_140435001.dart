import 'package:flutter/material.dart';


import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';

class Question140435001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140435001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sbh(20),
        Row(
          children: [
            Expanded(
              child: Text(
                "Plan/Intervention",
                style: FormBuilderTextStyle.bold10Style,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "No",
                      style: FormBuilderTextStyle.bold10Style,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Yes",
                      style: FormBuilderTextStyle.bold10Style,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                "Not Applicable",
                style: FormBuilderTextStyle.bold10Style,
              ),
            ),
          ],
        ),
        Divider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("↓ Check only one box in each row ↓")],
        ),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[0]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[1]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[2]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[3]),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[4]),
        _getDivider(),
      ],
    );
  }

  Widget _getDivider() {
    return Divider();
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Row(
            children: [
              Expanded(
                child: Text(subQuestionWrapper.subQuestion.title,style: FormBuilderTextStyle.normal10style,),
              ),
              Expanded(
                child: _getRadioButtonRow(subQuestionWrapper),
              ),
              if (subQuestion.notice != null)
                Expanded(
                  child: Text(
                    subQuestion.notice!,
                    style: FormBuilderTextStyle.normal10style,
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  Widget _getRadioButtonRow(SubQuestionWrapper subQuestionWrapper) {
    final options = subQuestionWrapper.subQuestion.options;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StaticRadioElement(
            subQueWrapper: subQuestionWrapper, optionIndex: options[0].index),
        StaticRadioElement(
            subQueWrapper: subQuestionWrapper, optionIndex: options[1].index),
        StaticRadioElement(
            subQueWrapper: subQuestionWrapper, optionIndex: options[2].index),
      ],
    );
  }
}

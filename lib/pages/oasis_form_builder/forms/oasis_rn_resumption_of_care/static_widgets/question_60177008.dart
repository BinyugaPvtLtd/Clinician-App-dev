import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question60177008 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question60177008({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 10,
      children: [
        _getRow(context, subQuestionWrappers[0], firstRow: true),
        _getRow(context, subQuestionWrappers[1]),
        _getRow(context, subQuestionWrappers[2]),
        _getRow(context, subQuestionWrappers[3]),
        _getRow(context, subQuestionWrappers[4]),
        _getRow(context, subQuestionWrappers[5]),
        _getRow(context, subQuestionWrappers[6]),
      ],
    );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,
      {bool firstRow = false}) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Row(
            children: [
              Expanded(flex: 1, child: _getCheckBox(subQuestionWrapper, 0)),
              Expanded(
                flex: 2,
                child: _getDateFieldRow(context, subQuestionWrapper, 1),
              ),
              Expanded(
                  flex: 2,
                  child: firstRow
                      ? _getCheckBox(subQuestionWrapper, 2)
                      : SizedBox()),
            ],
          );
        },
      ),
    );
  }

  Widget _getDateFieldRow(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return StaticDateFieldElement(onDateChange: (newDate){
      subQuestionWrapper.updateTextFieldValue(optionIndex, newDate.toIso8601String());
    },initialDate: DateTime.tryParse(subQuestionWrapper.subQuestion.options[optionIndex].value));
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
    );
  }

  Future<DateTime?> openDatePicker(
      BuildContext context, DateTime? initialDate) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1000),
        lastDate: DateTime(4000),
        initialDate: initialDate);
    return date;
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/static/presentation/widgets/static_radio_widget.dart';

class Question661110002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question661110002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start    ,
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrappers[0],
          child: Consumer<SubQuestionWrapper>(
              builder: (context, subQuestionWrapper, ch) {
            final isEnabled =
                subQuestionWrapper.subQuestion.options.first.selected;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    _getRadio(subQuestionWrapper, 0),
                    StaticCheckBoxWidget(
                        subQuestionWrapper: subQuestionWrappers[1],
                        enabled: isEnabled),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 350.w),
                  child: StaticDateFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[2],
                    enabled: isEnabled,
                  ),
                )
              ],
            );
          }),
        ),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrappers[0],
          child: Consumer<SubQuestionWrapper>(
              builder: (context, subQuestionWrapper, ch) {
            final isEnabled =
                subQuestionWrapper.subQuestion.options.last.selected;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getRadio(subQuestionWrapper, 1),
                Container(
                  constraints: BoxConstraints(maxWidth: 350.w),
                  child: StaticDateFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[3],
                    enabled: isEnabled,
                  ),
                )
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _getRadio(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return StaticRadioElement(
      subQueWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
    );
  }
}

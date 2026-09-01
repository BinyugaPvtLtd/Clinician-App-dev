import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question140438001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140438001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Responsive(
        tablet: Column(
          spacing: 10.h,
          children: [
            StaticDropdownWidget(
                subQuestionWrapper: subQuestionWrappers[0]),
            _getColumn(
              subQuestionWrappers[1],
              subQuestionWrappers[2],
              subQuestionWrappers[3],
            ),
            sbh(10),
            _getColumn(
              subQuestionWrappers[4],
              subQuestionWrappers[5],
              subQuestionWrappers[6],
            ),
          ],
        ),
        desktop: Column(
          spacing: 10.h,
          children: [
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: StaticDropdownWidget(
                      subQuestionWrapper: subQuestionWrappers[0]),
                ),
                Expanded(
                  child: sbh(0),
                ),
                Expanded(
                  child: sbh(0),
                ),
              ],
            ),
            _getRow(
              subQuestionWrappers[1],
              subQuestionWrappers[2],
              subQuestionWrappers[3],
            ),
            _getRow(
              subQuestionWrappers[4],
              subQuestionWrappers[5],
              subQuestionWrappers[6],
            ),
          ],
        ));
  }

  Widget _getRow(SubQuestionWrapper subWrapper1, SubQuestionWrapper subWrapper2,
      SubQuestionWrapper subWrapper3) {
    return Row(
      spacing: 20.w,
      children: [
        Expanded(
          child: StaticTextFieldWidget(subQuestionWrapper: subWrapper1),
        ),
        Expanded(
          child: StaticTextFieldWidget(subQuestionWrapper: subWrapper2),
        ),
        Expanded(
          child: StaticTextFieldWidget(subQuestionWrapper: subWrapper3),
        ),
      ],
    );
  }

  Widget _getColumn(SubQuestionWrapper subWrapper1,
      SubQuestionWrapper subWrapper2, SubQuestionWrapper subWrapper3) {
    return Column(
      spacing: 20.w,
      children: [
        StaticTextFieldWidget(subQuestionWrapper: subWrapper1),
        StaticTextFieldWidget(subQuestionWrapper: subWrapper2),
        StaticTextFieldWidget(subQuestionWrapper: subWrapper3),
      ],
    );
  }
}

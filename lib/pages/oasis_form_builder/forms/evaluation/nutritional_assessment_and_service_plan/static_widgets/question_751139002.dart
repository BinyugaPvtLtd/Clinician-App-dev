import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question751139002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question751139002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrappers[0],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context,
                SubQuestionWrapper subQuestionWrapper, Widget? child) {
              return Column(
                children: [
                  _getTitle(subQuestionWrapper.subQuestion.title),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 0),
                    _getCheckBox(subQuestionWrapper, 1),
                    _getCheckBox(subQuestionWrapper, 2),
                    sbw(0),
                  ]),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 3),
                    _getCheckBox(subQuestionWrapper, 4),
                    _getCheckBox(subQuestionWrapper, 5),
                    _getCheckBox(subQuestionWrapper, 6),
                  ]),
                  _getExpandedRow([
                    sbw(0),
                    _getCheckBox(subQuestionWrapper, 7),
                    _getCheckBox(subQuestionWrapper, 8),
                    _getCheckBox(subQuestionWrapper, 9),
                  ]),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 10),
                    _getCheckBox(subQuestionWrapper, 11),
                    _getCheckBox(subQuestionWrapper, 12),
                    _getCheckBox(subQuestionWrapper, 13),
                  ]),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 14),
                    sbw(0),
                    sbw(0),
                    sbw(0),
                  ]),
                ],
              );
            },
          ),
        ),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrappers[1],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context,
                SubQuestionWrapper subQuestionWrapper, Widget? child) {
              return Column(
                children: [
                  _getTitle(subQuestionWrapper.subQuestion.title),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 0),
                    _getCheckBox(subQuestionWrapper, 1),
                    _getCheckBox(subQuestionWrapper, 2),
                    _getCheckBox(subQuestionWrapper, 3),
                  ]),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 4),
                    sbw(0),
                    sbw(0),
                    sbw(0),
                  ]),
                ],
              );
            },
          ),
        ),ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrappers[2],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context,
                SubQuestionWrapper subQuestionWrapper, Widget? child) {
              return Column(
                children: [
                  _getTitle(subQuestionWrapper.subQuestion.title),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 0),
                    _getCheckBox(subQuestionWrapper, 1),
                    _getCheckBox(subQuestionWrapper, 2),
                    _getCheckBox(subQuestionWrapper, 3),
                  ]),
                  _getExpandedRow([
                    _getCheckBox(subQuestionWrapper, 4),
                    sbw(0),
                    sbw(0),
                    sbw(0),
                  ]),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getExpandedRow(
    List<Widget> options,
  ) {
    return Row(
      children: [
        ...options.map(
          (option) => Expanded(
            child: option,
          ),
        ),
      ],
    );
  }

  Widget _getTitle(String title) {
    return TitleDescription(
      title: title,
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
    );
  }
}

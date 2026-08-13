import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'question_741137004.dart';

class Question741137006 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question741137006({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    final titleSubQuestionWrapper = questionWrapper.subQuestionWrappers[1];
    final scrollController = ScrollController();
    return ScrollConfiguration(
      behavior: WebDragScrollBehavior(),
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              _getDataRow1(subQuestionWrappers[0]),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(2, 11),
                  titleSubQuestionWrapper.subQuestion.options[0].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(11, 20),
                  titleSubQuestionWrapper.subQuestion.options[1].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(20, 29),
                  titleSubQuestionWrapper.subQuestion.options[2].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(29, 38),
                  titleSubQuestionWrapper.subQuestion.options[3].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(38, 47),
                  titleSubQuestionWrapper.subQuestion.options[4].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(47, 56),
                  titleSubQuestionWrapper.subQuestion.options[5].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(56, 65),
                  titleSubQuestionWrapper.subQuestion.options[6].label),
              Divider(
                height: 30.h,
              ),
              _getRestDataRow(subQuestionWrappers.sublist(65, 74),
                  titleSubQuestionWrapper.subQuestion.options[7].label),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRestDataRow(
      List<SubQuestionWrapper> subQuestionWrappers, String title) {
    return Row(
      spacing: 10.w,
      children: [
        SizedBox(
            width: 240,
            child: TitleDescription(
              title: title,
            )),
        ...subQuestionWrappers.map(
          (subQuestionWrapper) => SizedBox(
              width: 120,
              child: StaticRadioWidget(subQuestionWrapper: subQuestionWrapper)),
        ),
      ],
    );
  }

  Widget _getDataRow1(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return Row(
            spacing: 10.w,
            children: [
              SizedBox(
                width: 240,
                child: sbw(0),
                //  flex: 2,
              ),
              ...List.generate(9, (index) {
                return SizedBox(
                    width: 120,
                    child: _getDateField(subQuestionWrapper, index));
              })
            ],
          );
        },
      ),
    );
  }

  Widget _getDateField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return StaticDateFieldElement(
      onDateChange: (DateTime newDateTime) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, newDateTime.toIso8601String());
      },
      initialDate: DateTime.tryParse(
          subQuestionWrapper.subQuestion.options[optionIndex].value),
    );
  }
}

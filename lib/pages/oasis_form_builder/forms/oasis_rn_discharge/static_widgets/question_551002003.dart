import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/static/presentation/widgets/static_dropdown_widget.dart';

class Question551002003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question551002003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: isMobile?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getCoddingColumn(isMobile),
          sbh(20),
          _getDataColumn(isMobile),
        ],
      ):Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _getCoddingColumn(isMobile),
          ),
          Expanded(
            flex: 8,
            child: _getDataColumn(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _getDataColumn(bool isMobile){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '↓Enter Codes in Boxes',
          style: FormBuilderTextStyle.bold10Style,
        ),
        sbh(20),
        _getRow(questionWrapper.subQuestionWrappers[0],isMobile),
        _getRow(questionWrapper.subQuestionWrappers[1],isMobile),
        _getRow(questionWrapper.subQuestionWrappers[2],isMobile),
      ],
    );
  }

  Widget _getCoddingColumn(bool isMobile){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CODING:",
          style: FormBuilderTextStyle.bold10Style,
        ),
        sbh(isMobile?5:20),
        Text(
          isMobile? "0. None  1. One  2. Two or More":"0. None\n\n1. One\n\n2. Two or More",
          style: FormBuilderTextStyle.normal10style,
        ),
      ],
    );
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return  isMobile?Column(
            children: [
              StaticDropdownElement(
                subQuestionWrapper: subQuestionWrapper,
                onChanged: (newOption) {
                  subQuestionWrapper.toggleOption(newOption!.index);
                },
              ),
              TitleDescription(title: subQuestionWrapper.subQuestion.title,),
              sbh(10),
            ],
          ):Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: StaticDropdownElement(
                subQuestionWrapper: subQuestionWrapper,
                onChanged: (newOption) {
                  subQuestionWrapper.toggleOption(newOption!.index);
                },
              ), flex: 3,),
              Expanded(child: TitleDescription(title: subQuestionWrapper.subQuestion.title,), flex: 4,),
            ],
          );
        },

      ),
    );
  }
}

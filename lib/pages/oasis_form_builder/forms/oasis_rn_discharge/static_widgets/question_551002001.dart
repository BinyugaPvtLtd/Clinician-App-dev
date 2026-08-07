import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question551002001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

   Question551002001({super.key, required this.questionWrapper});

  final scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile?Container(
      width: 800,
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                _getTitleRow(true),
                _getDivider(),
                _getRow(questionWrapper.subQuestionWrappers[0], true),
                _getDivider(),
                _getRow(questionWrapper.subQuestionWrappers[1],true),
                _getDivider(),
                _getRow(questionWrapper.subQuestionWrappers[2], true),
                _getDivider(),
                _getRow(questionWrapper.subQuestionWrappers[3], true),
              ],
            ),
          ),
        ),
      ),
    ):Column(
      children: [
        _getTitleRow(false),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[0],false),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[1],false),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[2],false),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[3],false),
      ],
    );
  }

  Widget _getDivider() {
    return Divider();
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return Container(
      constraints: isMobile?BoxConstraints(maxWidth: 800):null,
      child: ChangeNotifierProvider.value(
        value: subQuestionWrapper ,
        child: Consumer<SubQuestionWrapper>(
          builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper, Widget? child) {

            final options = subQuestionWrapper.subQuestion.options;
            return Row(
              children: [
                Expanded(
                  child: TitleDescription(
                    title: subQuestionWrapper.subQuestion.title,
                  ),
                ),
                Expanded(child: _getRadioButton(subQuestionWrapper, options[0])),
                Expanded(child: _getRadioButton(subQuestionWrapper, options[1])),
                Expanded(child: _getRadioButton(subQuestionWrapper, options[2])),
                Expanded(child: _getRadioButton(subQuestionWrapper, options[3])),
                Expanded(child: _getRadioButton(subQuestionWrapper, options[4])),
              ],
            );
          },

        ),
      ),
    );
  }

  Widget _getRadioButton(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
    return Center(
      child: StaticRadioElement(
          subQueWrapper: subQuestionWrapper, optionIndex: option.index),
    );
  }

  Widget _getTitleRow(bool isMobile) {
    return Container(
      constraints: isMobile?BoxConstraints(maxWidth:800):null,
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Type of Assistance',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'No assistance needed - patient is independent or does not have needs in this area',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'Non-agency caregiver(s) currently provide assistance',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'Non-agency caregiver(s) need training/supportive services to provide assistance',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'Non-agency caregiver(s) are not likely to provide assistance OR it is unclear if they will provide assistance',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'Assistance needed, but no non-agency caregiver(s) available',
            style: FormBuilderTextStyle.bold10Style,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}

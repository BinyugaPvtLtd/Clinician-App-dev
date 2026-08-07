import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_question_model.dart';

class Question10019006 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10019006({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: questionWrapper.subQuestionWrappers[0],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile?0:35.w),
                    child: Column(
                      spacing:10,
                      children: [
                        _getRow(context, subQuestionWrapper, subQuestion, 1),
                        _getRow(context, subQuestionWrapper, subQuestion, 2),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        sbh(15),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: questionWrapper.subQuestionWrappers[1],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile?0:35.w),
                    child: Column(
                      spacing:10,
                      children: [
                        _getRow(context, subQuestionWrapper, subQuestion, 1),
                        _getRow(context, subQuestionWrapper, subQuestion, 2),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getRow(BuildContext context,SubQuestionWrapper subQuestionWrapper,StaticQuestionModel subQuestion, int optionIndex)
  {
    final isMobile = Responsive.isMobile(context);
    return isMobile?Column(
      children: [
        Row(
          children: [
            Expanded(child: _getLabel(subQuestion, optionIndex)),
            _getIconButton(context, subQuestionWrapper, optionIndex),
          ],
        ),
        _getTextField(subQuestionWrapper, optionIndex)
      ],
    ):Row(
      children: [
        Expanded(
          child:
          _getLabel(subQuestion, optionIndex),
        ),
        Expanded(
          flex: 2,
          child: _getTextField(subQuestionWrapper, optionIndex),
        ),
        _getIconButton(context, subQuestionWrapper, optionIndex),
      ],
    );
  }

  Widget _getLabel(StaticQuestionModel subQuestion, int optionIndex)
  {
    return Text(
      subQuestion.options[optionIndex].label,
      style: FormBuilderTextStyle.normal10style,
    );
  }

  Widget _getTextField( SubQuestionWrapper subQuestionWrapper, int optionIndex)
  {
    final subQuestion = subQuestionWrapper.subQuestion;
    return StaticTextFieldElement(
      option: subQuestion.options[optionIndex],
      subQuestion: subQuestion,
      onUpdate: (optionIndex, value) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, value);
      },
    );
  }

  Widget _getIconButton(BuildContext context, SubQuestionWrapper subQuestionWrapper, int optionIndex)
  {
    return IconButton(
      onPressed: () {
        PopupHandler.showPopup(
            context, 'TEXTFIELDPOPUP', (newValue) {
          subQuestionWrapper.updateTextFieldValue(
              optionIndex, newValue);
        });
      },
      icon: const Icon(Icons.edit_outlined),
      color: AppColors.primaryAppLightColor,
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

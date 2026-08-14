import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../../widgets/static/presentation/widgets/static_check_box_widget.dart';

class Question360611005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question360611005({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {

    final subWrapper1 = questionWrapper.subQuestionWrappers[0];
    final subWrapper2 = questionWrapper.subQuestionWrappers[1];
    final subWrapper3 = questionWrapper.subQuestionWrappers[2];
    return Column(
      children: [
        StaticCheckBoxWidget(subQuestionWrapper: subWrapper1),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subWrapper2,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0),
                  Padding(
                    padding: EdgeInsets.only(left: 35.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subQuestion.options[1].label,
                                style: FormBuilderTextStyle.normal10style,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StaticTextFieldElement(
                                option: subQuestion.options[1],
                                subQuestion: subQuestion,
                                onUpdate: (optionIndex, value) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      optionIndex, value);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                PopupHandler.showPopup(
                                    context, 'TEXTFIELDPOPUP', (newValue) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      1, newValue);
                                });
                              },
                              icon: const Icon(Icons.edit_outlined),
                              color: AppColors.primaryAppLightColor,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subQuestion.options[2].label,
                                style: FormBuilderTextStyle.normal10style,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StaticTextFieldElement(
                                option: subQuestion.options[2],
                                subQuestion: subQuestion,
                                onUpdate: (optionIndex, value) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      optionIndex, value);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                PopupHandler.showPopup(
                                    context, 'TEXTFIELDPOPUP', (newValue) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      subQuestion.options[2].index, newValue);
                                });
                              },
                              icon: const Icon(Icons.edit_outlined),
                              color: AppColors.primaryAppLightColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subWrapper3,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0),
                  Padding(
                    padding: EdgeInsets.only(left: 35.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subQuestion.options[1].label,
                                style: FormBuilderTextStyle.normal10style,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StaticTextFieldElement(
                                option: subQuestion.options[1],
                                subQuestion: subQuestion,
                                onUpdate: (optionIndex, value) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      optionIndex, value);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                PopupHandler.showPopup(
                                    context, 'TEXTFIELDPOPUP', (newValue) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      subQuestion.options[1].index, newValue);
                                });
                              },
                              icon: const Icon(Icons.edit_outlined),
                              color: AppColors.primaryAppLightColor,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subQuestion.options[2].label,
                                style: FormBuilderTextStyle.normal10style,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StaticTextFieldElement(
                                option: subQuestion.options[2],
                                subQuestion: subQuestion,
                                onUpdate: (optionIndex, value) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      optionIndex, value);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                PopupHandler.showPopup(
                                    context, 'TEXTFIELDPOPUP', (newValue) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      subQuestion.options[2].index, newValue);
                                });
                              },
                              icon: const Icon(Icons.edit_outlined),
                              color: AppColors.primaryAppLightColor,
                            )
                          ],
                        ),
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

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
    );
  }
}

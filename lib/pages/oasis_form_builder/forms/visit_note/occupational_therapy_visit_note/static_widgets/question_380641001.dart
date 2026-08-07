import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';

class Question380641001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question380641001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaticCheckBoxWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[0]),
        sbh(10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5,
              ),
              border: Border.all(color: AppColors.textFieldBorderColor)),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Test/Scale",
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
              Expanded(
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
              Expanded(
                child: Text(
                  "Interpretation/Comments",
                  textAlign: TextAlign.center,
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
            ],
          ),
        ),
        _getRow(context, questionWrapper.subQuestionWrappers[1],
            label: "Total Score  "),
        _getRow(context, questionWrapper.subQuestionWrappers[2],
            hint: "seconds"),
        _getRow(context, questionWrapper.subQuestionWrappers[3],
            label: "Total Score  "),
        _getRow(context, questionWrapper.subQuestionWrappers[4],
            label: "Total Score  "),
        _getRow(context, questionWrapper.subQuestionWrappers[5], hint: "  %"),
        _getRow2(context, questionWrapper.subQuestionWrappers[6]),
        _getRow2(context, questionWrapper.subQuestionWrappers[7]),
      ],
    );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,
      {String label = "", String hint = ""}) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              sbh(30),
              Row(
                spacing: isMobile ? 8 : 50.w,
                children: [
                  Expanded(
                    flex: isMobile ? 4 : 1,
                    child: Text(
                      subQuestion.title,
                      style: FormBuilderTextStyle.bold10Style.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryAppLightColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 7 : 1,
                    child: Row(
                      spacing: 10,
                      children: [
                        isMobile
                            ? label.isEmpty
                                ? sbw(0)
                                : Expanded(
                                    child: label.isEmpty
                                        ? sbw(0)
                                        : Text(
                                            label,
                                            style: FormBuilderTextStyle
                                                .normal10style,
                                            textAlign: TextAlign.end,
                                          ),
                                  )
                            : Expanded(
                                child: label.isEmpty
                                    ? sbw(0)
                                    : Text(
                                        label,
                                        style:
                                            FormBuilderTextStyle.normal10style,
                                        textAlign: TextAlign.end,
                                      ),
                              ),
                        Expanded(
                          flex: 2,
                          child: StaticTextFieldElement(
                            option: subQuestion.options.first,
                            subQuestion: subQuestion,
                            onUpdate: (optionIndex, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                          ),
                        ),
                       isMobile
                            ? hint.isEmpty
                                ? sbw(0)
                                : Expanded(
                                    child: hint.isEmpty
                                        ? sbw(0)
                                        : Text(
                                            hint,
                                            style: FormBuilderTextStyle
                                                .normal10style,
                                          ),
                                  ):     Expanded(
                          child: hint.isEmpty
                              ? sbw(0)
                              : Text(
                                  hint,
                                  style: FormBuilderTextStyle.normal10style,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                       flex: isMobile ? 6 : 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: StaticTextFieldElement(
                            option: subQuestion.options.last,
                            subQuestion: subQuestion,
                            onUpdate: (optionIndex, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            PopupHandler.showPopup(context, "TEXTFIELDPOPUP",
                                (newValue) {
                              subQuestionWrapper.updateTextFieldValue(
                                  1, newValue);
                            });
                          },
                          icon: const Icon(Icons.edit_outlined),
                          color: AppColors.primaryAppLightColor,
                          iconSize: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow2(BuildContext context, SubQuestionWrapper subQuestionWrapper) {
       final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              sbh(30),
              Row(
                 spacing: isMobile ? 8 : 50.w,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Other: ',
                          style: FormBuilderTextStyle.normal10style,
                        ),
                        Expanded(
                          child: StaticTextFieldElement(
                            option: subQuestion.options.first,
                            subQuestion: subQuestion,
                            onUpdate: (optionIndex, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StaticTextFieldElement(
                      option: subQuestion.options[1],
                      subQuestion: subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: StaticTextFieldElement(
                            option: subQuestion.options.last,
                            subQuestion: subQuestion,
                            onUpdate: (optionIndex, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            PopupHandler.showPopup(context, "TEXTFIELDPOPUP",
                                (newValue) {
                              subQuestionWrapper.updateTextFieldValue(
                                  1, newValue);
                            });
                          },
                          icon: const Icon(Icons.edit_outlined),
                          color: AppColors.primaryAppLightColor,
                          iconSize: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}

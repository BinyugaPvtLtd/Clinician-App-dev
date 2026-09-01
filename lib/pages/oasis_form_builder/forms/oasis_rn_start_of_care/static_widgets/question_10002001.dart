import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10002001_13 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10002001_13({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subQuestionWrapper.subQuestion.title.isNotEmpty)
          TitleDescription(
            code: subQuestionWrapper.subQuestion.code,
            title: subQuestionWrapper.subQuestion.title,
            flags: subQuestionWrapper.subQuestion.flags,
          ),
        HorizontalTextFields(
          subQuestionWrapper: subQuestionWrapper,
          option1Index: 0,
          option2Index: 1,
        ),
      ],
    );
  }
}

class HorizontalTextFields extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final int option1Index;
  final int option2Index;
  final double labelWidth;
  final double textfieldWidth;
  final double maxWidth;

  const HorizontalTextFields(
      {super.key,
      required this.subQuestionWrapper,
      required this.option1Index,
      required this.option2Index,
      this.labelWidth = 56,
      this.maxWidth = 500,
      this.textfieldWidth = 170});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Container(
            width: maxWidth,
            child: Row(
              spacing: 15,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _getLabel(subQuestionWrapper, option1Index),
                      sbw(8),
                      _getTextField(subQuestionWrapper, option1Index),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _getLabel(subQuestionWrapper, option2Index),
                      sbw(8),
                      _getTextField(subQuestionWrapper, option2Index),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getLabel(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final label = subQuestionWrapper.subQuestion.options[optionIndex].label;
    return Expanded(
      child: TitleDescription(
        title: label,
      ),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Expanded(
      flex: 2,
      // width: textfieldWidth,
      child: StaticTextFieldElement(
        option: option,
        subQuestion: subQuestionWrapper.subQuestion,
        onUpdate: (optionIndex, value) {
          subQuestionWrapper.updateTextFieldValue(optionIndex, value);
        },
      ),
    );
  }
}

class Question10002001_12 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10002001_12({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return Responsive.isMobile(context)
        ? Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescription(
                code: subQuestion.code,
                title: subQuestion.title,
              ),
              FlagOverlayWidget(flagList: subQuestion.flags),
              ChangeNotifierProvider.value(
                value: subQuestionWrapper,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    final subQuestion = subQuestionWrapper.subQuestion;
                    final option1 = subQuestion.options[0];
                    final option2 = subQuestion.options[1];
                    return Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaticDateFieldElement(
                            onDateChange: (newDate) {
                              option1.selected = false;
                              subQuestionWrapper.updateTextFieldValue(
                                  option2.index, newDate.toIso8601String());
                            },
                            initialDate: DateTime.tryParse(option2.value)),
                        SubQuestionCheckbox(
                          subQuestionWrapper: subQuestionWrapper,
                          optionIndex: option1.index,
                          isEnabled: true,
                          onChange: (value) {
                            option2.textEditingController?.clear();
                            option2.selected=false;
                            option2.value = "";
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                  code: subQuestion.code,
                  title: subQuestion.title,
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ChangeNotifierProvider.value(
                        value: subQuestionWrapper,
                        child: Consumer<SubQuestionWrapper>(
                          builder: (BuildContext context, subQuestionWrapper,
                              Widget? child) {
                            final subQuestion = subQuestionWrapper.subQuestion;
                            final option1 = subQuestion.options[0];
                            final option2 = subQuestion.options[1];
                            return Column(
                              spacing: 5.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: StaticDateFieldElement(
                                          onDateChange: (newDate) {
                                            option2.value =
                                                newDate.toIso8601String();
                                            option1.selected = false;
                                            subQuestionWrapper.forceNotify();
                                          },
                                          initialDate:
                                              DateTime.tryParse(option2.value)),
                                    ),
                                    Expanded(child: sbh(0))
                                  ],
                                ),
                                SubQuestionCheckbox(
                                  subQuestionWrapper: subQuestionWrapper,
                                  optionIndex: option1.index,
                                  isEnabled: true,
                                  onChange: (value) {
                                    option2.textEditingController?.clear();
                                    option2.value = "";
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    FlagOverlayWidget(flagList: subQuestion.flags)
                  ],
                ),
              )
            ],
          );
  }
}

class Question10002001_11 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10002001_11({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return Responsive.isMobile(context)
        ? Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescription(
                code: subQuestion.code,
                title: subQuestion.title,
              ),
              FlagOverlayWidget(flagList: subQuestion.flags),
              ChangeNotifierProvider.value(
                value: subQuestionWrapper,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    final subQuestion = subQuestionWrapper.subQuestion;
                    final option1 = subQuestion.options[0];
                    return StaticDateFieldElement(
                      onDateChange: (newDate) {
                        subQuestionWrapper.updateTextFieldValue(
                            option1.index, newDate.toIso8601String());
                      },
                      initialDate: DateTime.tryParse(option1.value),
                    );
                  },
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                  code: subQuestion.code,
                  title: subQuestion.title,
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ChangeNotifierProvider.value(
                        value: subQuestionWrapper,
                        child: Consumer<SubQuestionWrapper>(
                          builder: (BuildContext context, subQuestionWrapper,
                              Widget? child) {
                            final subQuestion = subQuestionWrapper.subQuestion;
                            final option1 = subQuestion.options[0];
                            return Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: StaticDateFieldElement(
                                    onDateChange: (newDate) {
                                      subQuestionWrapper.updateTextFieldValue(
                                          option1.index,
                                          newDate.toIso8601String());
                                    },
                                    initialDate:
                                        DateTime.tryParse(option1.value),
                                  ),
                                ),
                                Expanded(child: sbh(0))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    FlagOverlayWidget(flagList: subQuestion.flags)
                  ],
                ),
              )
            ],
          );
  }
}

class Question10002001_18 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10002001_18({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescription(
                code: subQuestion.code,
                title: subQuestion.title,
              ),
              ChangeNotifierProvider.value(
                value: subQuestionWrapper,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    final subQuestion = subQuestionWrapper.subQuestion;
                    final option1 = subQuestion.options[0];
                    final option2 = subQuestion.options[1];
                    return Column(
                      spacing: 10.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaticTextFieldElement(
                          onUpdate: (optionIndex, value) {
                            option2.selected=false;
                            subQuestionWrapper.updateTextFieldValue(
                                optionIndex, value);
                          },
                          option: option1,
                          subQuestion: subQuestion,
                        ),
                        SubQuestionCheckbox(
                          subQuestionWrapper: subQuestionWrapper,
                          optionIndex: option2.index,
                          onChange: (_) {
                            option1.textEditingController?.clear();
                          },
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                  code: subQuestion.code,
                  title: subQuestion.title,
                ),
              ),
              Expanded(
                flex: 5,
                child: ChangeNotifierProvider.value(
                  value: subQuestionWrapper,
                  child: Consumer<SubQuestionWrapper>(
                    builder: (BuildContext context, subQuestionWrapper,
                        Widget? child) {
                      final subQuestion = subQuestionWrapper.subQuestion;
                      final option1 = subQuestion.options[0];
                      final option2 = subQuestion.options[1];
                      return Column(
                        spacing: 10.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StaticTextFieldElement(
                            onUpdate: (optionIndex, value) {
                              option2.selected=false;
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                            option: option1,
                            subQuestion: subQuestion,
                          ),
                          SubQuestionCheckbox(
                            subQuestionWrapper: subQuestionWrapper,
                            optionIndex: option2.index,
                            onChange: (_) {
                              option1.textEditingController?.clear();
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          );
  }
}

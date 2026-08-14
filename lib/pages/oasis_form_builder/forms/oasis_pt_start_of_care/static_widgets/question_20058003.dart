import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_option_model.dart';

class Question20058003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question20058003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
            children: [
              _getSingleBoldTitle('Surfaces'),
              _getElement(questionWrapper.subQuestionWrappers[0], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[1], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[2], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[3], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[4], isMobile),
            ],
          )
        : Column(
            children: [
              _getTitle(),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[0], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[1], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[2], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[3], isMobile),
              _getDivider(),
              _getElement(questionWrapper.subQuestionWrappers[4], isMobile),
            ],
          );
  }

  Widget _getDivider() {
    return const Divider(
      thickness: 2,
    );
  }

  Widget _getElement(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          final options = subQuestion.options;
          final option1 = options.first;
          return isMobile
              ? Column(
                  children: [
                    Row(
                      spacing: 10.w,
                      children: [
                        Flexible(
                          child: _getSingleTitle(
                            subQuestion.title,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              _getCheckBox(subQuestionWrapper, option1, true)
                            ],
                          ),
                        ),
                      ],
                    ),
                    _getSingleTitle(
                      "Prior",
                    ),
                    _getTextField(subQuestionWrapper, options[1]),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getSingleTitle(
                                "Distance",
                              ),
                              _getTextField(subQuestionWrapper, options[2]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getSingleTitle(
                                "Assistive Device",
                              ),
                              _getTextField(subQuestionWrapper, options[3]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    sbh(10),
                    _getSingleTitle(
                      "Current",
                    ),
                    _getTextField(subQuestionWrapper, options[4]),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getSingleTitle(
                                "Distance",
                              ),
                              _getTextField(subQuestionWrapper, options[5]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getSingleTitle(
                                "Assistive Device",
                              ),
                              _getTextField(subQuestionWrapper, options[6]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  spacing: 10.h,
                  children: [
                    sbh(20),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          flex: 1,
                          child: _getSingleTitle(
                            subQuestion.title,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              _getCheckBox(subQuestionWrapper, option1, true)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: _getSingleBoldTitle(
                            "<b>Prior</b>",
                          ),
                        ),
                        Expanded(
                          child: _getTextField(subQuestionWrapper, options[1]),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: _getTextField(
                                    subQuestionWrapper, options[2]),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: _getTextField(subQuestionWrapper, options[3]),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: _getSingleBoldTitle(
                            "<b>Current</b>",
                          ),
                        ),
                        Expanded(
                          child: _getTextField(subQuestionWrapper, options[4]),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 100.w,
                                  child: _getTextField(
                                      subQuestionWrapper, options[5])),
                            ],
                          ),
                        ),
                        Expanded(
                          child: _getTextField(subQuestionWrapper, options[6]),
                        ),
                      ],
                    ),
                    sbh(5),
                  ],
                );
        },
      ),
    );
  }

  Widget _getTextField(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (optionIndex, value) {
        subQuestionWrapper.updateTextFieldValue(optionIndex, value);
      },
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool isEnabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: isEnabled,
    );
  }

  Widget _getTitle() {
    return Row(
      spacing: 10.w,
      children: [
        const Expanded(
          child: TitleDescription(
              title: "<div style='text-align:center'><b>Surfaces</b></div>"),
        ),
        const Expanded(
          child: TitleDescription(
              title: "<div style='text-align:center'><b>Assistance</b></div>"),
        ),
        const Expanded(
          child: TitleDescription(
              title: "<div style='text-align:center'><b>Distance</b></div>"),
        ),
        const Expanded(
          child: TitleDescription(
              title:
                  "<div style='text-align:center'><b>Assistive Device</b></div>"),
        ),
      ],
    );
  }

  Widget _getSingleBoldTitle(String title) {
    return TitleDescription(title: "<b>${title}</b>");
  }

  Widget _getSingleTitle(String title) {
    return TitleDescription(title: "${title}");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../constants/static_decoration.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_option_model.dart';

class Question470759003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question470759003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, value, Widget? child) {
          final subQuestionWrappers = questionWrapper.subQuestionWrappers;
          final options = subQuestionWrappers
              .map((wrapper) => wrapper.subQuestion.options.first)
              .toList();
          return isMobile
              ? Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckbox(
                        subQuestionWrappers[1], options[0], (value) {
                      subQuestionWrappers[0]
                          .clearTextFieldAt(options[0].index);
                      questionWrapper.forceNotify();
                    }),
                    _getLabelWidget(
                        subQuestionWrappers[0].subQuestion.title),
                    Row(
                      children: [
                        Expanded(
                          child: _getTextFieldWidget(
                            context,
                            subQuestionWrappers[0],
                            options[0],
                            (index, value) {
                              options[1].selected = false;
                              questionWrapper.forceNotify();
                            },
                          ),
                        ),
                      ],
                    ),

                    sbh(10),
                    _getCheckbox(
                      subQuestionWrappers[2],
                      options[0],
                          (_) {
                        questionWrapper.forceNotify();
                      },
                    ),
                    _getLabelWidget(
                        subQuestionWrappers[3].subQuestion.title),
                    _getTextFieldWidget(
                      context,
                      subQuestionWrappers[3],
                      options[3],
                          (index, value) {
                        questionWrapper.forceNotify();
                      },
                    ),
                  ],
                )
              : Column(
                  spacing: 10.h,
                  children: [
                    Row(
                      spacing: 15,
                      children: [
                        _getLabelWidget(
                            subQuestionWrappers[0].subQuestion.title),
                        Expanded(
                          flex: 6,
                          child: _getTextFieldWidget(
                              context, subQuestionWrappers[0], options[0],
                              (index, value) {
                            options[1].selected = false;
                            questionWrapper.forceNotify();
                          }),
                        ),
                        Expanded(
                          flex: 4,
                          child: _getCheckbox(
                              subQuestionWrappers[1], options[0], (value) {
                            subQuestionWrappers[0]
                                .clearTextFieldAt(options[0].index);
                            questionWrapper.forceNotify();
                          }),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 15,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _getCheckbox(
                            subQuestionWrappers[2],
                            options[0],
                            (_) {
                              questionWrapper.forceNotify();
                            },
                          ),
                        ),
                        _getLabelWidget(
                            subQuestionWrappers[3].subQuestion.title),
                        Expanded(
                          flex: 6,
                          child: _getTextFieldWidget(
                            context,
                            subQuestionWrappers[3],
                            options[3],
                            (index, value) {
                              questionWrapper.forceNotify();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                );
        },
      ),
    );
  }

  Widget _getCheckbox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, Function(bool value) onChange) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: true,
      onChange: onChange,
    );
  }

  Widget _getTextFieldWidget(
      BuildContext context,
      SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option,
      Function(int index, String newValue) onUpdate) {
    return Row(
      children: [
        Expanded(
          child: StaticTextFieldElement(
            option: option,
            subQuestion: subQuestionWrapper.subQuestion,
            onUpdate: (int index, String value) {
              subQuestionWrapper.updateTextFieldValue(option.index, value);
              onUpdate(index, value);
            },
          ),
        ),
        _getIconButton(context, subQuestionWrapper, option.index),
      ],
    );
  }

  Widget _getLabelWidget(String label) {
    return Text(
      label,
      style: FormBuilderTextStyle.normal10style,
    );
  }

  Widget _getIconButton(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return IconButton(
      onPressed: () {
        PopupHandler.showPopup(context, "TEXTFIELDPOPUP", (newValue) {
          subQuestionWrapper.updateTextFieldValue(optionIndex, newValue);
        });
      },
      icon: Icon(Icons.edit_outlined),
      color: AppColors.primaryAppLightColor,
    );
  }
}

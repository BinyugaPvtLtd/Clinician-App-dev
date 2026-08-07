import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../widgets/static/data/static_option_model.dart';

class Question30094001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question30094001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        ChangeNotifierProvider<QuestionWrapper>.value(
          value: questionWrapper,
          child: Consumer<QuestionWrapper>(
            builder: (BuildContext context, QuestionWrapper questionWrapper,
                Widget? child) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: isMobile ? 10 : 50.w,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _getTitle(isMobile),
                        _getRow(questionWrapper, 0, isMobile),
                        _getRow(questionWrapper, 2, isMobile),
                        _getRow(questionWrapper, 4, isMobile),
                        _getRow(questionWrapper, 6, isMobile),
                        _getRow(questionWrapper, 8, isMobile),
                        _getRow(questionWrapper, 10, isMobile),
                        _getRow(questionWrapper, 12, isMobile),
                        _getRow(questionWrapper, 14, isMobile),
                        _getRow(questionWrapper, 16, isMobile),
                        _getRow(questionWrapper, 18, isMobile),
                        _getRow(questionWrapper, 20, isMobile),
                        _getRow(questionWrapper, 22, isMobile),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _getTitle(isMobile),
                        _getRow(questionWrapper, 24, isMobile),
                        _getRow(questionWrapper, 26, isMobile),
                        _getRow(questionWrapper, 28, isMobile),
                        _getRow(questionWrapper, 30, isMobile),
                        _getRow(questionWrapper, 32, isMobile),
                        _getRow(questionWrapper, 34, isMobile),
                        _getRow(questionWrapper, 36, isMobile),
                        _getRow(questionWrapper, 38, isMobile),
                        _getRow(questionWrapper, 40, isMobile),
                        _getRow(questionWrapper, 42, isMobile),
                        _getRow(questionWrapper, 44, isMobile),
                        _getOtherRow(questionWrapper, 46, isMobile),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        sbh(20),
        StaticTextFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[49])
      ],
    );
  }

  Widget _getRow(QuestionWrapper questionWrapper, int index, bool isMobile) {
    final subQuestionWrapper = questionWrapper.subQuestionWrappers[index];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[index + 1];
    final subQuestion = subQuestionWrapper.subQuestion;
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbh(10),
              _getLabelWidget(subQuestion.title, isMobile),
              _getElement(
                  questionWrapper, subQuestionWrapper, "Prior", isMobile),
              Divider(),
              _getElement(
                  questionWrapper, subQuestionWrapper2, "Current", isMobile),
              sbh(10),
              Divider(
                thickness: 1.5,
              ),
            ],
          )
        : Column(
            children: [
              sbh(20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child: Divider(),
                        ),
                        Expanded(
                            child:
                                _getLabelWidget(subQuestion.title, isMobile)),
                        const SizedBox(
                          width: 20,
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        _getElement(questionWrapper, subQuestionWrapper,
                            "Prior", isMobile),
                        const Divider(),
                        _getElement(questionWrapper, subQuestionWrapper2,
                            "Current", isMobile),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
            ],
          );
  }

  Widget _getLabelWidget(String label, bool isMobile) {
    return Container(
      constraints: isMobile ? BoxConstraints(minHeight: 40) : null,
      child: Text(
        label,
        textAlign: isMobile ? TextAlign.left : TextAlign.center,
        style: FormBuilderTextStyle.bold10Style,
      ),
    );
  }

  Widget _getNormalLabelWidget(String label, bool isMobile) {
    return Text(
      label,
      textAlign: isMobile ? TextAlign.left : TextAlign.center,
      style: FormBuilderTextStyle.normal10style,
    );
  }

  Widget _getElement(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, String label, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final selectedOption = subQuestionWrapper.subQuestion.options
              .firstWhereOrNull((option) => option.selected);
          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getNormalLabelWidget(label, isMobile),
                    Row(
                      children: [
                        Expanded(child: _getDropdownWidget(subQuestionWrapper)),
                        SizedBox(
                          width: 30,
                          child: (selectedOption != null &&
                                  !subQuestionWrapper.subQuestion.title
                                      .contains("Wheelchair/Scooter use"))
                              ? InkWell(
                                  onTap: () {
                                    processCopyButtonTap(
                                        context,
                                        questionWrapper,
                                        subQuestionWrapper,
                                        label);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.copy,
                                      color: AppColors.primaryAppLightColor,
                                      size: 16,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        )
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: _getNormalLabelWidget(label, isMobile),
                    ),
                    Expanded(
                      flex: 10,
                      child: _getDropdownWidget(subQuestionWrapper),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (selectedOption != null &&
                              !subQuestionWrapper.subQuestion.title
                                  .contains("Wheelchair/Scooter use"))
                            IconButton(
                              onPressed: () {
                                processCopyButtonTap(context, questionWrapper,
                                    subQuestionWrapper, label);
                              },
                              icon: const Icon(Icons.copy),
                              iconSize: 18,
                              color: AppColors.primaryAppLightColor,
                            ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  void processCopyButtonTap(
      BuildContext context,
      QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper,
      String label) {
    showDialog(
      context: context,
      builder: (context) {
        return CopySelectionDialog(
          subQuestionWrappers: questionWrapper.subQuestionWrappers,
          option: subQuestionWrapper.subQuestion.options
              .firstWhereOrNull((option) => option.selected),
          onSave: (selectedSubWrappers, selectedOptionIndex) {
            for (var selectedSubWrapper in selectedSubWrappers) {
              if (selectedSubWrapper.subQuestion.title
                  .contains('Wheelchair/Scooter use')) {
                continue;
              }
              if (!selectedSubWrapper
                  .subQuestion.options[selectedOptionIndex].selected) {
                selectedSubWrapper.toggleOption(selectedOptionIndex);
              }
              // selectedSubWrapper.toggleOption(selectedOptionIndex);
            }
          },
          title: label,
          referenceSubQuestionWrapper: subQuestionWrapper,
        );
      },
    );
  }

  Widget _getDropdownWidget(SubQuestionWrapper subQuestionWrapper) {
    return StaticDropdownElement(
      subQuestionWrapper: subQuestionWrapper,
      onChanged: (newOption) {
        if (newOption != null) {
          subQuestionWrapper.toggleOption(newOption.index);
        }
      },
    );
  }

  Widget _getTitle(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: const EdgeInsets.all(10),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Function \nAssistance Level',
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Function',
                      style: FormBuilderTextStyle.bold14style
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      'Assistance Level',
                      style: FormBuilderTextStyle.bold14style
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _getOtherRow(
      QuestionWrapper questionWrapper, int index, bool isMobile) {
    final subQuestionWrapper = questionWrapper.subQuestionWrappers[index];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[index + 1];
    final subQuestionWrapper3 = questionWrapper.subQuestionWrappers[index + 2];
    final subQuestion = subQuestionWrapper.subQuestion;
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subQuestion.title,
                textAlign: TextAlign.left,
                style: FormBuilderTextStyle.bold10Style,
              ),
              sbh(5),
              Row(
                children: [
                  Expanded(
                    child: StaticTextFieldElement(
                        option: subQuestionWrapper3.subQuestion.options.first,
                        subQuestion: subQuestionWrapper3.subQuestion,
                        onUpdate: (optionIndex, newValue) {
                          subQuestionWrapper3.updateTextFieldValue(
                              optionIndex, newValue);
                        }),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              sbh(5),
              _getElement(
                  questionWrapper, subQuestionWrapper, "Prior", isMobile),
              Divider(),
              _getElement(
                  questionWrapper, subQuestionWrapper2, "Current", isMobile),
              Divider(
                thickness: 1.5,
              )
            ],
          )
        : Column(
            children: [
              sbh(20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child: Divider(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10.h,
                            children: [
                              _getLabelWidget(subQuestion.title, isMobile),
                              StaticTextFieldElement(
                                  option: subQuestionWrapper3
                                      .subQuestion.options.first,
                                  subQuestion: subQuestionWrapper3.subQuestion,
                                  onUpdate: (optionIndex, newValue) {
                                    subQuestionWrapper3.updateTextFieldValue(
                                        optionIndex, newValue);
                                  }),
                              Text(""),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        _getElement(questionWrapper, subQuestionWrapper,
                            "Prior", isMobile),
                        const Divider(),
                        _getElement(questionWrapper, subQuestionWrapper2,
                            "Current", isMobile),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
            ],
          );
  }
}

class CopySelectionDialog extends StatefulWidget {
  final List<SubQuestionWrapper> subQuestionWrappers;
  final Function(
          List<SubQuestionWrapper> selectedSubWrappers, int selectedOptionIndex)
      onSave;
  final String title;
  final StaticOptionModel? option;
  final SubQuestionWrapper referenceSubQuestionWrapper;

  const CopySelectionDialog(
      {super.key,
      required this.subQuestionWrappers,
      required this.onSave,
      required this.title,
      this.option,
      required this.referenceSubQuestionWrapper});

  @override
  State<CopySelectionDialog> createState() => _CopySelectionDialogState();
}

class _CopySelectionDialogState extends State<CopySelectionDialog> {
  List<SubQuestionWrapper> selectedSubQuestionWrappers = [];

  int selectedOptionIndex = -1;

  @override
  void initState() {
    selectedOptionIndex = widget.referenceSubQuestionWrapper.subQuestion.options
        .indexWhere((option) => option.selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final additionFactor = widget.title == "Prior" ? 0 : 1;
    return PopupTemplate(
        maxWidth: 500.w,
        headerWidget: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: FormBuilderTextStyle.normal10style,
                    ),
                    StaticDropdownElement(
                        subQuestionWrapper: widget.referenceSubQuestionWrapper,
                        onChanged: (newOption) {
                          selectedOptionIndex = newOption!.index;
                        }),
                    _getSelectClearAllRow(isMobile),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: 10,
                        children: [
                          Text(
                            widget.title,
                            style: FormBuilderTextStyle.normal10style,
                          ),
                          Expanded(
                            child: StaticDropdownElement(
                                subQuestionWrapper:
                                    widget.referenceSubQuestionWrapper,
                                onChanged: (newOption) {
                                  selectedOptionIndex = newOption!.index;
                                }),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: sbw(0)),
                    Expanded(
                      child: _getSelectClearAllRow(isMobile),
                    ),
                  ],
                ),
        ),
        body: [
          Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: isMobile ? 0 : 50.w,
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (0 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (1 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (2 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (3 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (4 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (5 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (6 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (7 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (8 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (9 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (10 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (11 * 2)]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (12 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (14 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (15 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (16 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (17 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (18 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (19 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (20 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (21 * 2)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (22 * 2)]),
                ],
              ),
            ],
          ),
          sbh(isMobile ? 20 : 40)
        ],
        bottomButtons: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            PrimaryButton(
              onTap: () => Navigator.pop(context),
              label: 'Cancel',
              borderRadius: 10,
              // width: 120.w,
              // height: 35.h,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              buttonColor: Colors.white,
              labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 30,
            ),
            PrimaryButton(
              onTap: () {
                if (selectedOptionIndex != -1) {
                  widget.onSave(
                      selectedSubQuestionWrappers, selectedOptionIndex);
                }
                Navigator.pop(context);
              },
              label: 'Save',
              borderRadius: 10,
              // height: 35.h,
              // width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
        title: '');
  }

  Widget _getSelectClearAllRow(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            selectedSubQuestionWrappers.clear();
            selectedSubQuestionWrappers
                .addAll(widget.subQuestionWrappers.where((subWrapper) {
              final index = widget.subQuestionWrappers.indexOf(subWrapper);
              return widget.title == "Prior"
                  ? index % 2 == 0 && index < 48
                  : index % 2 != 0 && index < 48;
            }));
            setState(() {});
          },
          child: Text(
            "Select All",
            style: FormBuilderTextStyle.normal10style.copyWith(
              color: AppColors.primaryAppLightColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            selectedSubQuestionWrappers.clear();
            setState(() {});
          },
          child: Text(
            "Clear All",
            style: FormBuilderTextStyle.normal10style.copyWith(
              color: AppColors.redColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper) {
    return DynamicCheckboxElement(
      label: subQuestionWrapper.subQuestion.title,
      value: "",
      selected: selectedSubQuestionWrappers.contains(subQuestionWrapper),
      onTap: (_, __) {
        if (selectedSubQuestionWrappers.contains(subQuestionWrapper)) {
          selectedSubQuestionWrappers.remove(subQuestionWrapper);
        } else {
          selectedSubQuestionWrappers.add(subQuestionWrapper);
        }
        setState(() {});
      },
      index: 0,
    );
  }
}

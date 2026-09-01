import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';


import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../ui_components/buttons/primary_button.dart';


class Question20058002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question20058002({super.key, required this.questionWrapper});

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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _getTitle(isMobile),
                        _getRow(questionWrapper, 8, isMobile),
                        _getRow(questionWrapper, 10, isMobile),
                        _getRow(questionWrapper, 12, isMobile),
                        _getRow(questionWrapper, 14, isMobile),
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
            subQuestionWrapper: questionWrapper.subQuestionWrappers[16])
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
          subQuestionWrappers: questionWrapper.subQuestionWrappers
              .sublist(0, questionWrapper.subQuestionWrappers.length - 1),
          referenceSubQuestionWrapper: subQuestionWrapper,
          onSave: (selectedSubWrappers, selectedOptionIndex) {
            for (var selectedSubWrapper in selectedSubWrappers) {
              if(!selectedSubWrapper.subQuestion.options[selectedOptionIndex].selected)
                {
                  selectedSubWrapper.toggleOption(selectedOptionIndex);
                }
            }
          },
          title: label,
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
}

class CopySelectionDialog extends StatefulWidget {
  final List<SubQuestionWrapper> subQuestionWrappers;
  final Function(
          List<SubQuestionWrapper> selectedSubWrappers, int selectedOptionIndex)
      onSave;
  final String title;
  final SubQuestionWrapper referenceSubQuestionWrapper;

  const CopySelectionDialog(
      {super.key,
      required this.subQuestionWrappers,
      required this.onSave,
      required this.title,
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
    final additionFactor = widget.title == "Prior" ? 0 : 1;
    return PopupTemplate(
      maxWidth: 400.w,
      body: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 50.w,
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ],
        ),
      ],
      bottomButtons: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          PrimaryButton(
            onTap: () => Navigator.pop(context),
            label: 'Cancel',
            borderRadius: 5,
            // width: 120.w,
            // height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            buttonColor: Colors.white,
            labelStyle: FormBuilderTextStyle.normal12style
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 30,
          ),
          PrimaryButton(
            onTap: () {
              if (selectedOptionIndex != -1) {
                widget.onSave(selectedSubQuestionWrappers, selectedOptionIndex);
              }
              Navigator.pop(context);
            },
            label: 'Save',
            borderRadius: 5,
            // height: 35.h,
            // width: 120.w,
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            labelStyle: FormBuilderTextStyle.normal12style
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
      title: "",
      headerWidget: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250),
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
                                  widget.subQuestionWrappers.first,
                              onChanged: (newOption) {
                                selectedOptionIndex = newOption!.index;
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        selectedSubQuestionWrappers.clear();
                        selectedSubQuestionWrappers.addAll(
                            widget.subQuestionWrappers.where((subWrapper) {
                          final index =
                              widget.subQuestionWrappers.indexOf(subWrapper);
                          return widget.title == "Prior"
                              ? index % 2 == 0
                              : index % 2 != 0;
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
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
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

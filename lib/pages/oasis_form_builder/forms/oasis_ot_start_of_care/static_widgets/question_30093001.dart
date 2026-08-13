import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../ui_components/buttons/primary_button.dart';

class Question30093001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question30093001({super.key, required this.questionWrapper});

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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTitle(context, "Upper Body Site", isMobile),
                  _getSubTitle(isMobile),
                  _getRow(questionWrapper, 0, isMobile),
                  _getRow(questionWrapper, 3, isMobile),
                  _getRow(questionWrapper, 6, isMobile),
                  _getRow(questionWrapper, 9, isMobile),
                  _getRow(questionWrapper, 12, isMobile),
                  _getRow(questionWrapper, 15, isMobile),
                  _getRow(questionWrapper, 18, isMobile),
                  _getRow(questionWrapper, 21, isMobile),
                  _getRow(questionWrapper, 24, isMobile),
                  _getRow(questionWrapper, 27, isMobile),
                  _getRow(questionWrapper, 30, isMobile),
                  _getRow(questionWrapper, 33, isMobile),
                  _getRow(questionWrapper, 36, isMobile),
                  _getRow(questionWrapper, 39, isMobile),
                  _getRow(questionWrapper, 42, isMobile),
                  _getRow(questionWrapper, 45, isMobile),
                  _getRow(questionWrapper, 48, isMobile),
                  _getRow(questionWrapper, 51, isMobile),
                  _getRow(questionWrapper, 54, isMobile),
                  _getRow(questionWrapper, 57, isMobile),
                  _getRow(questionWrapper, 60, isMobile),
                  _getRow(questionWrapper, 63, isMobile),
                  _getRow(questionWrapper, 66, isMobile),
                  _getRow(questionWrapper, 69, isMobile),
                  sbh(30),
                  _getTitle(context, "Lower Body Site", isMobile),
                  _getSubTitle(isMobile),
                  _getRow(questionWrapper, 72, isMobile),
                  _getRow(questionWrapper, 75, isMobile),
                  _getRow(questionWrapper, 78, isMobile),
                  _getRow(questionWrapper, 81, isMobile),
                  _getRow(questionWrapper, 84, isMobile),
                  _getRow(questionWrapper, 87, isMobile),
                  _getRow(questionWrapper, 90, isMobile),
                  _getRow(questionWrapper, 93, isMobile),
                  _getRow(questionWrapper, 96, isMobile),
                  _getRow(questionWrapper, 99, isMobile),
                  _getRow(questionWrapper, 102, isMobile),
                  _getRow(questionWrapper, 105, isMobile),
                  _getRow(questionWrapper, 108, isMobile),
                  _getRow(questionWrapper, 111, isMobile),
                ],
              );
            },
          ),
        ),
        sbh(20),
        Row(
          children: [
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[114],
              ),
            ),
            if (!isMobile)
              Expanded(
                child: sbw(0),
              ),
          ],
        )
      ],
    );
  }

  Widget _getRow(QuestionWrapper questionWrapper, int index, bool isMobile) {
    final subQuestionWrapper = questionWrapper.subQuestionWrappers[index];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[index + 1];
    final subQuestionWrapper3 = questionWrapper.subQuestionWrappers[index + 2];
    final subQuestion = subQuestionWrapper.subQuestion;
    return Column(
      children: [
        sbh(5),
        Row(
          spacing: isMobile ? 5 : 20.w,
          children: [
            if (!isMobile)
              Expanded(
                child: TitleDescription(
                  title: subQuestion.title,
                ),
              ),
            Expanded(
              flex: 3,
              child: Row(
                spacing: isMobile ? 0 : 10.w,
                children: [
                  Expanded(
                    child: _getElement(
                        questionWrapper, subQuestionWrapper, "R", isMobile),
                  ),
                  Expanded(
                    child: _getElement(
                        questionWrapper, subQuestionWrapper2, "L", isMobile),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: _getTextFieldRow(subQuestionWrapper3, isMobile),
            ),
          ],
        ),
        const Divider(
          color: AppColors.textFieldBorderColor,
        ),
      ],
    );
  }

  Widget _getTextFieldRow(
      SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Row(
            spacing: isMobile ? 5 : 40.w,
            children: [
              Expanded(
                child: StaticTextFieldElement(
                  option: options.first,
                  subQuestion: subQuestionWrapper.subQuestion,
                  onUpdate: (optionIndex, value) {
                    subQuestionWrapper.updateTextFieldValue(optionIndex, value);
                  },
                ),
              ),
              Expanded(
                child: StaticTextFieldElement(
                  option: options.last,
                  subQuestion: subQuestionWrapper.subQuestion,
                  onUpdate: (optionIndex, value) {
                    subQuestionWrapper.updateTextFieldValue(optionIndex, value);
                  },
                ),
              ),
            ],
          );
        },
      ),
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
          return Row(
            children: [
              Expanded(
                child: StaticDropdownElement(
                  subQuestionWrapper: subQuestionWrapper,
                  onChanged: (newOption) {
                    if (newOption != null) {
                      subQuestionWrapper.setOption(newOption.index);
                    }
                  },
                ),
              ),
              selectedOption != null
                  ? isMobile
                      ? InkWell(
                          onTap: () {
                            processCopyIconTap(
                                context, subQuestionWrapper, label);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.copy,
                              color: AppColors.primaryAppLightColor,
                              size: 15,
                            ),
                          ),
                        )
                      : IconButton(
                          padding: isMobile ? EdgeInsets.all(0) : null,
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            processCopyIconTap(
                                context, subQuestionWrapper, label);
                          },
                          icon: const Icon(Icons.copy),
                          iconSize: 18,
                          color: AppColors.primaryAppLightColor,
                        )
                  : SizedBox(
                      width: isMobile ? 25 : 40,
                    ),
            ],
          );
        },
      ),
    );
  }

  void processCopyIconTap(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, String label) {
    showDialog(
      context: context,
      builder: (context) {
        return CopySelectionDialog(
          subQuestionWrappers: questionWrapper.subQuestionWrappers,
          referenceSubQuestionWrapper: subQuestionWrapper,
          onSave: (selectedSubWrappers, selectedOptionIndex) {
            for (var selectedSubWrapper in selectedSubWrappers) {
              selectedSubWrapper.setOption(selectedOptionIndex);
            }
          },
          title: label,
        );
      },
    );
  }

  Widget _getTitle(BuildContext context, String title, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        spacing: 20.w,
        children: [
          Expanded(
            flex: isMobile ? 2 : 1,
            child: Text(
              title,
              style: FormBuilderTextStyle.bold14style
                  .copyWith(fontSize: isMobile ? 14 : 18),
            ),
          ),
          Expanded(
            flex: isMobile ? 1 : 3,
            child: InkWell(
              onTap: () {
                PopupHandler.showPopup(
                    context, "MusculoskeletalStrength", (_) {});
              },
              child: Center(
                child: Text(
                  'STRENGTH',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      fontSize: isMobile ? 14 : 18,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryAppLightColor),
                ),
              ),
            ),
          ),
          Expanded(
            flex: isMobile ? 1 : 3,
            child: InkWell(
              onTap: () {
                PopupHandler.showPopup(
                    context,
                    title.toLowerCase().contains("upper body")
                        ? "MusculoskeletalROMUpperBody"
                        : "MusculoskeletalROMLowerBody",
                    (_) {});
              },
              child: Center(
                child: Text(
                  'ROM',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      fontSize: isMobile ? 14 : 18,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryAppLightColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSubTitle(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
          border: isMobile
              ? Border(
                  bottom: BorderSide(
                      width: 1.5, color: AppColors.textFieldBorderColor))
              : null),
      padding: const EdgeInsets.all(10),
      child: Row(
        spacing: 20.w,
        children: [
          if (!isMobile)
            Expanded(
              flex: 1,
              child: sbw(10),
            ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'R',
                    style: isMobile
                        ? FormBuilderTextStyle.bold10Style
                        : FormBuilderTextStyle.bold14style,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'L',
                    style: isMobile
                        ? FormBuilderTextStyle.bold10Style
                        : FormBuilderTextStyle.bold14style,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'R',
                    style: isMobile
                        ? FormBuilderTextStyle.bold10Style
                        : FormBuilderTextStyle.bold14style,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'L',
                    style: isMobile
                        ? FormBuilderTextStyle.bold10Style
                        : FormBuilderTextStyle.bold14style,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
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
    final isMobile = Responsive.isMobile(context);
    final additionFactor = widget.title == "R" ? 0 : 1;
    return PopupTemplate(
        maxWidth: 400.w,
        headerWidget: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        selectedSubQuestionWrappers.clear();
                        selectedSubQuestionWrappers.addAll(
                            widget.subQuestionWrappers.where((subWrapper) {
                          final index =
                              widget.subQuestionWrappers.indexOf(subWrapper);
                          return widget.title == "R"
                              ? index % 3 == 0 && index != 114
                              : (index - 1) % 3 == 0 && index != 114;
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
              ),
            ],
          ),
        ),
        body: [
          Row(
            children: [
              Text(
                "Upper Body Site",
                style: FormBuilderTextStyle.bold10Style.copyWith(fontSize: 18),
              ),
            ],
          ),
          Flex(
            direction: !isMobile ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: isMobile ? 0 : 50.w,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (0 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (1 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (2 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (3 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (4 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (5 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (6 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (7 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (8 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (9 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (10 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (11 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (12 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (14 * 3)]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (15 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (16 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (17 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (18 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (19 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (20 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (21 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (22 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (23 * 3)]),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Lower Body Site",
                style: FormBuilderTextStyle.bold10Style.copyWith(fontSize: 18),
              ),
            ],
          ),
          Flex(
            direction: !isMobile ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: isMobile ? 0 : 50.w,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (24 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (25 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (26 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (27 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (28 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (29 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (30 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (31 * 3)]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (32 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (33 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (34 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (35 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (36 * 3)]),
                  _getCheckBox(
                      widget.subQuestionWrappers[additionFactor + (37 * 3)]),
                ],
              ),
            ],
          )
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
                  widget.onSave(
                      selectedSubQuestionWrappers, selectedOptionIndex);
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
        title: '');
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        width: 600.w,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryAppLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
            sbh(isMobile ? 20 : 40)
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

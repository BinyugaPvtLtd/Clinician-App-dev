import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/common_divider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/enums.dart';
import '../../../constants/responsive.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';

class Question30083005 extends StatelessWidget {
  const Question30083005({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customHeight(10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: isMobile?null:Border.all(color: AppColors.greyColor),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                              flex:4,
                                child: Text(
                              'Area',
                              textAlign: TextAlign.center,
                              style: FormBuilderTextStyle.normal10style.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                            Expanded(
                                flex:5,
                                child: Text(
                              'Rating',
                              textAlign: TextAlign.center,
                              style: FormBuilderTextStyle.normal10style.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ],
                        )),
                   const Spacer()
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: questionWrapper.subQuestionWrappers.length,
                separatorBuilder: (context, index) => const CommonDivider(),
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                      value: questionWrapper.subQuestionWrappers[index],
                      child: Consumer<SubQuestionWrapper>(
                        builder: (BuildContext context,
                            SubQuestionWrapper subQuestionWrapper,
                            Widget? child) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: StaticDropdownWidget(
                                  forceScrollAxis: isMobile,
                                  subQuestionWrapper: questionWrapper
                                      .subQuestionWrappers[index],
                                ),
                              ),
                              Expanded(
                                child: subQuestionWrapper.subQuestion.options
                                        .where((option) => option.selected)
                                        .isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CopyCognitiveAssessmentValueDialog(
                                                    referenceSubQuestionWrapper:
                                                        subQuestionWrapper,
                                                    questionWrapper:
                                                        questionWrapper);
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.copy_rounded,
                                          color: AppColors.primaryAppLightColor,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class CopyCognitiveAssessmentValueDialog extends StatefulWidget {
  final QuestionWrapper questionWrapper;
  final SubQuestionWrapper referenceSubQuestionWrapper;

  const CopyCognitiveAssessmentValueDialog(
      {super.key,
      required this.referenceSubQuestionWrapper,
      required this.questionWrapper});

  @override
  State<CopyCognitiveAssessmentValueDialog> createState() =>
      _CopyCognitiveAssessmentValueDialogState();
}

class _CopyCognitiveAssessmentValueDialogState
    extends State<CopyCognitiveAssessmentValueDialog> {
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        width: 600.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryAppLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            spacing: 10,
                            children: [
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  selectedSubQuestionWrappers.clear();
                                  selectedSubQuestionWrappers.addAll(widget
                                      .questionWrapper.subQuestionWrappers);
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
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.questionWrapper.subQuestionWrappers
                              .map((subQuestionWrapper) =>
                                  _getCheckBox(subQuestionWrapper))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                PrimaryButton(
                  onTap: () => Navigator.pop(context),
                  label: 'Cancel',
                  borderRadius: 12.r,
                  width: 120.w,
                  height: 35.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  buttonColor: Colors.white,
                  labelStyle: FormBuilderTextStyle.normal12style
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                customWidth(21.w),
                PrimaryButton(
                  onTap: () {
                    processSave();
                    Navigator.pop(context);
                  },
                  label: 'Save',
                  borderRadius: 12.r,
                  height: 35.h,
                  width: 120.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  labelStyle: FormBuilderTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
            sbh(40)
          ],
        ),
      ),
    );
  }

  void processSave() {
    if (selectedOptionIndex == -1) {
      return;
    }
    for (final subWrapper in selectedSubQuestionWrappers) {
      subWrapper.setOption(selectedOptionIndex);
    }
  }

  bool isAllSubQuestionSelected(QuestionWrapper questionWrapper) {
    bool selected = true;
    for (final subWrapper in questionWrapper.subQuestionWrappers.where(
        (subWrapper) => subWrapper.subQuestion.type == AnswerType.dropdown)) {
      if (!selectedSubQuestionWrappers.contains(subWrapper)) {
        selected = false;
        break;
      }
    }
    return selected;
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

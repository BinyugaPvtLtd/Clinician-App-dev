import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../generate_options.dart';

class Question530953006 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question530953006({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
     
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical:Responsive.isDesktop(context)? 0: 20),
          child: PrimaryButton(
            width: 150.w,
            label: 'Exercise Flowsheet',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ExerciseFlowsheetDialog(
                    questionWrapper: questionWrapper,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class ExerciseFlowsheetDialog extends StatefulWidget {
  final QuestionWrapper questionWrapper;

  const ExerciseFlowsheetDialog({super.key, required this.questionWrapper});

  @override
  State<ExerciseFlowsheetDialog> createState() =>
      _ExerciseFlowsheetDialogState();
}

class _ExerciseFlowsheetDialogState extends State<ExerciseFlowsheetDialog> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: EdgeInsets.all(40.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Container(
        width: width,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          spacing: 20.h,
          children: [
            PrimaryButton(
              label: 'Print/Email Flowsheet',
              width: 150.w,
            ),
            _getTitleRow(),
            Expanded(
                child: ListView(
              children: [
                ...widget.questionWrapper.subQuestionWrappers.map(
                  (subQuestionWrapper) => ChangeNotifierProvider.value(
                    value: subQuestionWrapper,
                    child: Consumer<SubQuestionWrapper>(
                      builder: (BuildContext context,
                          SubQuestionWrapper subQuestionWrapper,
                          Widget? child) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: _getDataRow(subQuestionWrapper),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
            PrimaryButton(
              label: 'Add New Row',
              width: 120.w,
              onTap: () {
                widget.questionWrapper.subQuestionWrappers.add(
                  SubQuestionWrapper(
                    subQuestion: StaticQuestionModel.fromJson(
                      {
                        "question_id": 1,
                        "type": "TEXTFIELD",
                        "options": generateOptions(
                          [
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                          ],
                        )
                      },
                    ),
                  ),
                );
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTitleRow() {
    return Row(
      spacing: 10.w,
      children: [
        _getTitleElement("Exercise Name"),
        _getTitleElement("Start Date"),
        _getTitleElement("Discontinued Date"),
        _getTitleElement("Sets"),
        _getTitleElement("Reps"),
        _getTitleElement("Frequency"),
        _getTitleElement("Help"),
        _getTitleElement("Comments"),
      ],
    );
  }

  Widget _getTitleElement(String title) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(minWidth: 150.w, minHeight: 60.h),
        decoration: BoxDecoration(
          color: AppColors.primaryAppLightColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: FormBuilderTextStyle.bold10Style
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getDataRow(SubQuestionWrapper subQuestionWrapper) {
    return Row(
      spacing: 10.w,
      children: [
        _getDataElementBorder(_getTextField(subQuestionWrapper, 0)),
        _getDataElementBorder(_getDateField(subQuestionWrapper, 1)),
        _getDataElementBorder(_getDateField(subQuestionWrapper, 2)),
        _getDataElementBorder(_getTextField(subQuestionWrapper, 3)),
        _getDataElementBorder(_getTextField(subQuestionWrapper, 4)),
        _getDataElementBorder(_getTextField(subQuestionWrapper, 5)),
        _getDataElementBorder(_getCheckBox(subQuestionWrapper, 6)),
        _getDataElementBorder(_getTextField(subQuestionWrapper, 7)),
      ],
    );
  }

  Widget _getDataElementBorder(Widget child) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(minWidth: 150.w, minHeight: 60.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border:
                Border.all(color: AppColors.primaryAppLightColor, width: 1.w)),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: child,
      ),
    );
  }

  Widget _getDateField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(option.value),
          firstDate: DateTime(1000),
          lastDate: DateTime(5000),
        );
        if (date != null) {
          subQuestionWrapper.updateTextFieldValue(
              optionIndex, date.toIso8601String());
        }
      },
      child: Row(
        children: [
          Expanded(
            child: AbsorbPointer(
              absorbing: true,
              child: TextFormField(
                key: UniqueKey(),
                initialValue: DateTime.tryParse(option.value) == null
                    ? null
                    : DateFormat('MM-dd-yyyy')
                        .format(DateTime.tryParse(option.value)!),
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintStyle: FormBuilderTextStyle.normal10style.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintGreyColor),
                  hintText: "MM-DD-YYYY",
                ),
                style: FormBuilderTextStyle.bold10Style,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Icon(
            Icons.calendar_month,
            color: AppColors.textGreyColor,
          ),
        ],
      ),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Center(
      child: TextField(
        controller: option.textEditingController,
        onSubmitted: (value) {
          subQuestionWrapper.updateTextFieldValue(optionIndex, value);
        },
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
          subQuestionWrapper.updateTextFieldValue(
              optionIndex, option.textEditingController!.text.trim());
        },
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          hintStyle: FormBuilderTextStyle.normal10style.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintGreyColor),
          hintText: "Enter Text",
          enabled: true,
        ),
        textAlign: TextAlign.center,
        style: FormBuilderTextStyle.bold10Style,
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
    );
  }
}

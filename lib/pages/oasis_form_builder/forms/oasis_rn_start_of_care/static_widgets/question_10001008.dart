import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_button_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_upload_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question10001008 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10001008({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 20.h,
      children: [
        TitleDescription(
          title: subQuestionWrappers[0].subQuestion.description,
        ),
        Row(
          children: [
            Expanded(
                flex: Responsive.isMobile(context) ? 2 : 1,
                child: StaticButtonWidget(
                    subQuestionWrapper: subQuestionWrappers[1])),
            Responsive.isMobile(context)
                ? Container()
                : Expanded(
                    child: sbh(0),
                  ),
          ],
        ),
        StaticUploadWidget(subQuestionWrapper: subQuestionWrappers[2]),
        TitleDescription(
          title: subQuestionWrappers[3].subQuestion.description,
        ),
        TitleDescription(
          title: subQuestionWrappers[4].subQuestion.description,
        ),
        StaticUploadWidget(subQuestionWrapper: subQuestionWrappers[5]),
        Row(
          children: [
            Expanded(
                child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[6])),
            Responsive.isMobile(context)
                ? Container()
                : Expanded(
                    child: sbh(0),
                  ),
          ],
        ),
        Responsive.isMobile(context)
            ? Column(
                spacing: 20,
                children: [
                  StaticDropdownWidget(
                    subQuestionWrapper: subQuestionWrappers[7],
                  ),
                  StaticDateTimeFieldElement(
                    subQuestionWrapper: subQuestionWrappers[8],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: StaticDropdownWidget(
                      subQuestionWrapper: subQuestionWrappers[7],
                    ),
                  ),
                  Expanded(
                    child: StaticDateTimeFieldElement(
                      subQuestionWrapper: subQuestionWrappers[8],
                    ),
                  ),
                ],
              ),
        Row(
          children: [
            Expanded(
                child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[9])),
            Responsive.isMobile(context)
                ? Container()
                : Expanded(
                    child: sbh(0),
                  ),
          ],
        ),
      ],
    );
  }
}

class StaticDateTimeFieldElement extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const StaticDateTimeFieldElement(
      {super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescription(title: subQuestionWrapper.subQuestion.title),
              ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context,
                      SubQuestionWrapper subQuestionWrapper, Widget? child) {
                    final option = subQuestionWrapper.subQuestion.options.first;
                    DateTime? oldDate = DateTime.tryParse(option.value);
                    print(oldDate);
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.textFieldBorderColor, width: 1),
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                      padding:  EdgeInsets.symmetric(horizontal: 5, vertical: Responsive.isMobile(context) ? 5 : 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.tryParse(option.value),
                                  firstDate: DateTime(1000),
                                  lastDate: DateTime(5000),
                                );
                                if (date != null) {
                                  if (oldDate == null) {
                                    subQuestionWrapper.updateTextFieldValue(
                                        option.index, date.toIso8601String());
                                  } else {
                                    oldDate = oldDate!.copyWith(
                                      day: date.day,
                                      month: date.month,
                                      year: date.year,
                                    );
                                    subQuestionWrapper.updateTextFieldValue(
                                        option.index,
                                        oldDate!.toIso8601String());
                                  }
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AbsorbPointer(
                                      absorbing: true,
                                      child: TextFormField(
                                        key: UniqueKey(),
                                        initialValue: oldDate == null
                                            ? null
                                            : DateFormat('MM-dd-yyyy')
                                                .format(oldDate),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                          hintStyle: FormBuilderTextStyle
                                              .normal10style
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.hintGreyColor),
                                          hintText: "MM-DD-YYYY",
                                        ),
                                        style:
                                            FormBuilderTextStyle.normal10style,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month,
                                    color: AppColors.textGreyColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final timeOfDay = await showTimePicker(
                                  context: context,
                                  initialTime: oldDate == null
                                      ? TimeOfDay.now()
                                      : TimeOfDay.fromDateTime(oldDate!),
                                );
                                if (timeOfDay != null) {
                                  if (oldDate == null) {
                                    oldDate = DateTime.now().copyWith(
                                      hour: timeOfDay.hour,
                                      minute: timeOfDay.minute,
                                    );
                                    subQuestionWrapper.updateTextFieldValue(
                                        option.index,
                                        oldDate!.toIso8601String());
                                  } else {
                                    oldDate = oldDate!.copyWith(
                                      hour: timeOfDay.hour,
                                      minute: timeOfDay.minute,
                                    );
                                    subQuestionWrapper.updateTextFieldValue(
                                        option.index,
                                        oldDate!.toIso8601String());
                                  }
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AbsorbPointer(
                                      absorbing: true,
                                      child: TextFormField(
                                        key: UniqueKey(),
                                        initialValue: oldDate == null
                                            ? null
                                            : DateFormat('hh:mm:ss a')
                                                .format(oldDate!),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                          hintStyle: FormBuilderTextStyle
                                              .normal10style
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.hintGreyColor),
                                          hintText: "HH:MM:SS AM/PM",
                                        ),
                                        style:
                                            FormBuilderTextStyle.normal10style,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.timer_outlined,
                                    color: AppColors.textGreyColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                    title: subQuestionWrapper.subQuestion.title),
              ),
              Expanded(
                flex: 5,
                child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                  value: subQuestionWrapper,
                  child: Consumer<SubQuestionWrapper>(
                    builder: (BuildContext context,
                        SubQuestionWrapper subQuestionWrapper, Widget? child) {
                      final option =
                          subQuestionWrapper.subQuestion.options.first;
                      DateTime? oldDate = DateTime.tryParse(option.value);
                      print(oldDate);
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.textFieldBorderColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.tryParse(option.value),
                                    firstDate: DateTime(1000),
                                    lastDate: DateTime(5000),
                                  );
                                  if (date != null) {
                                    if (oldDate == null) {
                                      subQuestionWrapper.updateTextFieldValue(
                                          option.index, date.toIso8601String());
                                    } else {
                                      oldDate = oldDate!.copyWith(
                                        day: date.day,
                                        month: date.month,
                                        year: date.year,
                                      );
                                      subQuestionWrapper.updateTextFieldValue(
                                          option.index,
                                          oldDate!.toIso8601String());
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: TextFormField(
                                          key: UniqueKey(),
                                          initialValue: oldDate == null
                                              ? null
                                              : DateFormat('MM-dd-yyyy')
                                                  .format(oldDate),
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            hintStyle: FormBuilderTextStyle
                                                .normal10style
                                                .copyWith(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .hintGreyColor),
                                            hintText: "MM-DD-YYYY",
                                          ),
                                          style: FormBuilderTextStyle
                                              .normal10style,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.textGreyColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final timeOfDay = await showTimePicker(
                                    context: context,
                                    initialTime: oldDate == null
                                        ? TimeOfDay.now()
                                        : TimeOfDay.fromDateTime(oldDate!),
                                  );
                                  if (timeOfDay != null) {
                                    if (oldDate == null) {
                                      oldDate = DateTime.now().copyWith(
                                        hour: timeOfDay.hour,
                                        minute: timeOfDay.minute,
                                      );
                                      subQuestionWrapper.updateTextFieldValue(
                                          option.index,
                                          oldDate!.toIso8601String());
                                    } else {
                                      oldDate = oldDate!.copyWith(
                                        hour: timeOfDay.hour,
                                        minute: timeOfDay.minute,
                                      );
                                      subQuestionWrapper.updateTextFieldValue(
                                          option.index,
                                          oldDate!.toIso8601String());
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: TextFormField(
                                          key: UniqueKey(),
                                          initialValue: oldDate == null
                                              ? null
                                              : DateFormat('hh:mm:ss a')
                                                  .format(oldDate!),
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            hintStyle: FormBuilderTextStyle
                                                .normal10style
                                                .copyWith(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .hintGreyColor),
                                            hintText: "HH:MM:SS AM/PM",
                                          ),
                                          style: FormBuilderTextStyle
                                              .normal10style,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.timer_outlined,
                                      color: AppColors.textGreyColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
  }
}

class TimeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    StringBuffer formatted = StringBuffer();

    for (int i = 0; i < digitsOnly.length && i < 6; i++) {
      formatted.write(digitsOnly[i]);
      if (i == 1 || i == 3) {
        formatted.write(':');
      }
    }

    final newText = formatted.toString();
    final selectionIndex = newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

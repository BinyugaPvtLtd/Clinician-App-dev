import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_card_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../generate_options.dart';

class Question741137003 extends StatefulWidget {
  final QuestionWrapper questionWrapper;

  const Question741137003({super.key, required this.questionWrapper});

  @override
  State<Question741137003> createState() => _Question741137003State();
}

class _Question741137003State extends State<Question741137003> {
  TextEditingController allergyNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = widget.questionWrapper.subQuestionWrappers;
    return Responsive(
        tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            ChangeNotifierProvider<QuestionWrapper>.value(
              value: widget.questionWrapper,
              child: Consumer<QuestionWrapper>(
                builder: (BuildContext context, QuestionWrapper questionWrapper,
                    Widget? child) {
                  return AppCardWidget(
                    margin: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    children: [
                      Row(
                        spacing: 30.w,
                        children: List.generate(3, (index) {
                          final List<String> titles = [
                            "Allergies",
                            "Start Effective Date",
                            "Discontinued Date",
                          ];
                          return Expanded(
                            child: Text(
                              titles[index],
                              style: FormBuilderTextStyle.bold10Style,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }),
                      ),
                      Divider(
                        height: 30.h,
                      ),
                      ...questionWrapper.subQuestionWrappers
                          .sublist(4)
                          .map((subQuestionWrapper) {
                        return Column(
                          children: [
                            Row(
                              spacing: 30.w,
                              children: [
                                Expanded(
                                  child: _getTextField(
                                    subQuestionWrapper,
                                    0,
                                  ),
                                ),
                                Expanded(
                                  child: _getDateField(
                                    subQuestionWrapper,
                                    1,
                                  ),
                                ),
                                Expanded(
                                  child: _getDateField(
                                    subQuestionWrapper,
                                    2,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 30.h,
                            ),
                          ],
                        );
                      }),
                      Row(
                        spacing: 15.w,
                        children: [
                          Text(
                            'Add',
                            style: FormBuilderTextStyle.normal10style,
                          ),
                          SizedBox(
                            width: 90.w,
                            child: _getRawTextField(allergyNumberController),
                          ),
                          Text(
                            'Allergy(s)',
                            style: FormBuilderTextStyle.normal10style,
                          ),
                          SizedBox(
                            width: 70.w,
                            child: PrimaryButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.w),
                              borderRadius: 12.r,
                              label: 'Add',
                              onTap: () {
                                int rowsToAdd = int.tryParse(
                                        allergyNumberController.text.trim()) ??
                                    1;
                                allergyNumberController.clear();
                                for (int i = 0; i < rowsToAdd; i++) {
                                  questionWrapper.subQuestionWrappers.add(
                                    SubQuestionWrapper(
                                      subQuestion: StaticQuestionModel.fromJson(
                                        {
                                          "question_id": questionWrapper
                                              .subQuestionWrappers.length,
                                          "type": "TEXTFIELD",
                                          "options":
                                              generateOptions(["", "", ""]),
                                        },
                                      ),
                                    ),
                                  );
                                }
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
            ),
            Divider(
              height: 2.h,
              thickness: 2,
              color: AppColors.dividerColor,
            ),
            AppCardWidget(
              backgroundColor: Colors.white,
              margin: EdgeInsets.zero,
              childrenSpacing: 10,
              children: [
                StaticDropdownWidget(
                    subQuestionWrapper: subQuestionWrappers[0]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[1]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[2]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[3]),
              ],
            ),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.w,
          children: [
            Expanded(
              child: ChangeNotifierProvider<QuestionWrapper>.value(
                value: widget.questionWrapper,
                child: Consumer<QuestionWrapper>(
                  builder: (BuildContext context,
                      QuestionWrapper questionWrapper, Widget? child) {
                    return AppCardWidget(
                      margin: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      children: [
                        Row(
                          spacing: 30.w,
                          children: List.generate(3, (index) {
                            final List<String> titles = [
                              "Allergies",
                              "Start Effective Date",
                              "Discontinued Date",
                            ];
                            return Expanded(
                              child: Text(
                                titles[index],
                                style: FormBuilderTextStyle.bold10Style,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }),
                        ),
                        Divider(
                          height: 30.h,
                        ),
                        ...questionWrapper.subQuestionWrappers
                            .sublist(4)
                            .map((subQuestionWrapper) {
                          return Column(
                            children: [
                              Row(
                                spacing: 30.w,
                                children: [
                                  Expanded(
                                    child: _getTextField(
                                      subQuestionWrapper,
                                      0,
                                    ),
                                  ),
                                  Expanded(
                                    child: _getDateField(
                                      subQuestionWrapper,
                                      1,
                                    ),
                                  ),
                                  Expanded(
                                    child: _getDateField(
                                      subQuestionWrapper,
                                      2,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30.h,
                              ),
                            ],
                          );
                        }),
                        Row(
                          spacing: 15.w,
                          children: [
                            Text(
                              'Add',
                              style: FormBuilderTextStyle.normal10style,
                            ),
                            SizedBox(
                              width: 90.w,
                              child: _getRawTextField(allergyNumberController),
                            ),
                            Text(
                              'Allergy(s)',
                              style: FormBuilderTextStyle.normal10style,
                            ),
                            SizedBox(
                              width: 70.w,
                              child: PrimaryButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 8.w),
                                borderRadius: 12.r,
                                label: 'Add',
                                onTap: () {
                                  int rowsToAdd = int.tryParse(
                                          allergyNumberController.text
                                              .trim()) ??
                                      1;
                                  allergyNumberController.clear();
                                  for (int i = 0; i < rowsToAdd; i++) {
                                    questionWrapper.subQuestionWrappers.add(
                                      SubQuestionWrapper(
                                        subQuestion:
                                            StaticQuestionModel.fromJson(
                                          {
                                            "question_id": questionWrapper
                                                .subQuestionWrappers.length,
                                            "type": "TEXTFIELD",
                                            "options":
                                                generateOptions(["", "", ""]),
                                          },
                                        ),
                                      ),
                                    );
                                  }
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
              ),
            ),
            Expanded(
                child: AppCardWidget(
              backgroundColor: Colors.white,
              margin: EdgeInsets.zero,
              childrenSpacing: 10,
              children: [
                StaticDropdownWidget(
                    subQuestionWrapper: subQuestionWrappers[0]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[1]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[2]),
                StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[3]),
              ],
            )),
          ],
        ));
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          final option = subQuestionWrapper.subQuestion.options[optionIndex];
          return StaticTextFieldElement(
            option: option,
            subQuestion: subQuestionWrapper.subQuestion,
            onUpdate: (optionIndex, value) {
              subQuestionWrapper.updateTextFieldValue(optionIndex, value);
            },
          );
        },
      ),
    );
  }

  Widget _getDateField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return StaticDateFieldElement(
              onDateChange: (DateTime newDateTime) {
                subQuestionWrapper.updateTextFieldValue(
                    optionIndex, newDateTime.toIso8601String());
              },
              initialDate: DateTime.tryParse(
                  subQuestionWrapper.subQuestion.options[optionIndex].value));
        },
      ),
    );
  }

  Widget _getRawTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        // floatingLabelStyle: floatingLabelStyle,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 0)),
        fillColor: Colors.white,
        filled: true,
        hintStyle: FormBuilderTextStyle.normal10style.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.hintGreyColor),
        hintText: "Enter Text",
        enabled: true,
      ),
      style: FormBuilderTextStyle.normal10style,
    );
  }
}

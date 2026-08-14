import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question20059001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question20059001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5,),
              border: Border.all(color:AppColors.textFieldBorderColor)
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical:8.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Test/Scale",
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
              Expanded(
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
              Expanded(
                child: Text(
                  "Interpretation/Comments",
                  textAlign: TextAlign.center,
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
            ],
          ),
        ),
        _getRow(context, questionWrapper.subQuestionWrappers[0],
            hint: ["seconds"]),
        _getRow(context, questionWrapper.subQuestionWrappers[1],
            hint: ["/28"]),
        _getRow(context, questionWrapper.subQuestionWrappers[2],
            label: ["Total Score"]),
        _getRow(context, questionWrapper.subQuestionWrappers[3],
            label: ["Total Score"], hint: ["/56"]),
        _getRow(context, questionWrapper.subQuestionWrappers[4], label: [
          "Position # 1",
          "Position # 2",
          "Position # 3",
          "Position # 4",
        ], hint: [
          "/30",
          "/30",
          "/30",
          "/30",
        ]),
        _getRow(context, questionWrapper.subQuestionWrappers[5],
            hint: ["inches"]),
        _getRow(context, questionWrapper.subQuestionWrappers[6], hint: ["%"]),
        _getRow(context, questionWrapper.subQuestionWrappers[7], hint: ["24"]),
        _getRow(context, questionWrapper.subQuestionWrappers[8], label: [
          "2 Minute",
          "6 Minute",
          "PRE Rating Borg:",
          "Dyspnea",
        ], hint: [
          "ft",
          "ft",
          "/20",
          "/10",
        ]),
        _getRow2(
          context,
          questionWrapper.subQuestionWrappers[9],
        ),
        _getRow2(context, questionWrapper.subQuestionWrappers[10]),
      ],
    );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,
      {List<String> label = const [], List<String> hint = const []}) {

    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              sbh(isMobile?15:30),
              Row(
                spacing: isMobile ? 8 : 50.w,
                children: [
                  Expanded(
                    flex: isMobile ? 4 : 1,
                    child: Text(
                      subQuestion.title,
                      style: FormBuilderTextStyle.bold10Style.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryAppLightColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 7 : 1,
                    child: Column(
                      spacing: 10.h,
                      children: [
                        ...subQuestion.options
                            .sublist(0, subQuestion.options.length - 1)
                            .map(
                              (option)  {
                                
                                return Row(
                                spacing: isMobile?5:15.w,
                                children: [
                                  isMobile
                                      ? label.isEmpty
                                      ? sbw(0)
                                      : Expanded(
                                    child: label.isEmpty
                                        ? sbw(0)
                                        : Text(
                                      label[option.index],
                                      style: FormBuilderTextStyle
                                          .normal10style,
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                      : Expanded(
                                    child: label.isEmpty
                                        ? sbw(0)
                                        : Text(
                                      label[option.index],
                                      style:
                                      FormBuilderTextStyle.normal10style,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: label.isEmpty
                                  //       ? sbw(0)
                                  //       : Text(
                                  //           label[option.index],
                                  //           style: FormBuilderTextStyle.bold10Style,
                                  //           textAlign: TextAlign.end,
                                  //         ),
                                  // ),
                                  Expanded(
                                    flex: 2,
                                    child: StaticTextFieldElement(
                                      option: option,
                                      subQuestion: subQuestion,
                                      onUpdate: (optionIndex, value) {
                                        subQuestionWrapper.updateTextFieldValue(
                                            optionIndex, value);
                                      },
                                    ),
                                  ),

                                  isMobile
                                      ? hint.isEmpty
                                      ? sbw(0)
                                      : Expanded(
                                    child: hint.isEmpty
                                        ? sbw(0)
                                        : Text(
                                      hint[option.index],
                                      style: FormBuilderTextStyle
                                          .normal10style,
                                    ),
                                  )
                                      : Expanded(
                                    child: hint.isEmpty
                                        ? sbw(0)
                                        : Text(
                                      hint[option.index],
                                      style:
                                      FormBuilderTextStyle.normal10style,
                                    ),
                                  ),
                                  /*Expanded(
                                    child: hint.isEmpty
                                        ? sbw(0)
                                        : Text(
                                            hint[option.index],
                                            style: FormBuilderTextStyle.bold10Style,
                                          ),
                                  ),*/
                                ],
                              );
                           } ),
                      ],
                    ),
                  ),
                  Expanded(

                    flex: isMobile ? 5 : 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: StaticTextFieldElement(
                            option: subQuestion.options.last,
                            subQuestion: subQuestion,
                            onUpdate: (optionIndex, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  optionIndex, value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            PopupHandler.showPopup(context, "TEXTFIELDPOPUP",
                                (newValue) {
                              subQuestionWrapper.updateTextFieldValue(
                                  1, newValue);
                            });
                          },
                          icon: const Icon(Icons.edit_outlined),
                          color: AppColors.primaryAppLightColor,
                          iconSize: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow2(BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              if(!isMobile)sbh(30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing:isMobile?10: 50.w,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.h,
                      children: [
                        Text(
                          'Other: ',
                          style: FormBuilderTextStyle.bold10Style,
                        ),
                        StaticTextFieldElement(
                          option: subQuestion.options.first,
                          subQuestion: subQuestion,
                          onUpdate: (optionIndex, value) {
                            subQuestionWrapper.updateTextFieldValue(
                                optionIndex, value);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StaticTextFieldElement(
                      option: subQuestion.options[1],
                      subQuestion: subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    ),
                  ),
                  Expanded(
                    child: StaticTextFieldElement(
                      option: subQuestion.options.last,
                      subQuestion: subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}

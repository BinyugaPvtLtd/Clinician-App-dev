import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/form_builder_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/dynamic_question.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../ui_components/overlays/local_notification_manager.dart';
import '../../../widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';

import '../../../widgets/static/presentation/widgets/static_check_box_widget.dart';
import '../../../widgets/static/presentation/widgets/static_dropdown_widget.dart';
import '../../../widgets/static/presentation/widgets/static_info_widget.dart';
import '../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class StaticFunctionalAssessment extends StatefulWidget {
  final int subFormId;
  final int formId;
  final int patientFormID;
  final String formTitle;
  final String templateName;

  StaticFunctionalAssessment({
    super.key,
    required this.subFormId,
    required this.formId,
    this.patientFormID = -1,
    this.formTitle = "",
    this.templateName = "",
  });

  @override
  State<StaticFunctionalAssessment> createState() =>
      _StaticFunctionalAssessmentState();
}

class _StaticFunctionalAssessmentState
    extends State<StaticFunctionalAssessment> {


  int columns = 2;
  List<Widget> wideWidgets = [];
  List<Widget> comprehensiveQtn = [];
  List<Widget> nonComprehensiveQtn = [];
  late Future<int> _formFuture;

  @override
  void initState() {
    super.initState();
    _formFuture = widget.patientFormID == -1
        ? getForm2(context, patientId: widget.subFormId, formId: widget.formId)
        : getForm(context,
        patientFormID: widget.patientFormID, patientId: widget.subFormId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _formFuture,
          builder: (context, snap) {
            print(snap.connectionState);
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading Questions...'));
              /* return const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );*/
            }
            if (snap.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.h,
                      children: [
                        Text(
                          widget.templateName,
                          style: FormBuilderTextStyle.bold14style.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.formTitle,
                          style: FormBuilderTextStyle.bold14style
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ...wideWidgets,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            comprehensiveQtn.isNotEmpty
                                ? Expanded(
                                child: Column(
                                  children: comprehensiveQtn,
                                ))
                                : const SizedBox(
                              width: 1,
                            ),
                            nonComprehensiveQtn.isNotEmpty
                                ? Expanded(
                                child: Column(
                                  children: nonComprehensiveQtn,
                                ))
                                : const SizedBox(
                              width: 1,
                            )
                          ],
                        ),

                        Container(
                          height: 200,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: AppColors.primaryAppColor,
                                          width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  padding:  EdgeInsets.symmetric(
                                      horizontal:Responsive.isMobile(context)?40 :70, vertical:Responsive.isMobile(context)?15 : 10),

                                  child: Text(
                                    "Cancel",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        color: AppColors.primaryAppColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                onTap: () async {
                                  final overlay = OverlayEntry(
                                      builder: (BuildContext context) {
                                        return Positioned.fill(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(),
                                          ),
                                        );
                                      });
                                  Overlay.of(context).insert(overlay);
                                  final formProvider =
                                  Provider.of<FormBuilderProvider>(context,
                                      listen: false);

                                  // For Uploading Signatures If Any
                                  // await uploadAllImages(context,
                                  //     formProvider.uploadTypeQuestions);
                                  await FormBuilderManager().savePatientForm(
                                    context,
                                    patientFormID: widget.patientFormID,
                                    formData: {
                                      "questions": formProvider.toJson()
                                    },
                                  ).then((result) {
                                    if (result) {
                                      // formProvider.uploadTypeQuestions.forEach(
                                      //     (questionWrapper) =>
                                      //         questionWrapper.forceNotify());
                                      LocalNotificationManager
                                          .showSuccessNotification(
                                          context, 'Saved!',
                                          subtitle:
                                          'Form has been saved successfully!');
                                    } else {
                                      LocalNotificationManager
                                          .showErrorNotification(
                                          context, 'Not Saved!',
                                          subtitle:
                                          'Form has not been saved. Please try again!');
                                    }
                                  });
                                  overlay.remove();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryAppColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  padding:  EdgeInsets.symmetric(
                                      horizontal:Responsive.isMobile(context)?40 :70, vertical:Responsive.isMobile(context)?15 : 10),
                                  child: Text(
                                    "Save",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }

            if (snap.hasError) {
              return Center(child: Text("Error : ${snap.error}"));
            } else {
              return const Center(child: Text("Error"));
            }
          }),
    );
  }

  Future<int> getForm2(BuildContext context,
      {required int patientId, required int formId}) async {
    // List<ChartQuestionDataModel> response = await FormBuilderManager()
    //     .getPatientFormByID(context, patientId: patientId);
    List<QuestionDataModel> response = await FormBuilderManager()
        .getDummyDataPatientFormByID(context,
        patientId: patientId, formId: formId);
    columns = await FormBuilderManager()
        .getColumns(patientId: patientId, formId: formId);
    final formProvider =
    Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    wideWidgets.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          } else {
            nonComprehensiveQtn.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          }
        } else {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              _buildStaticWidget(wrapper, formProvider),
            );
          } else {
            nonComprehensiveQtn.add(
              _buildStaticWidget(wrapper, formProvider),
            );
          }
        }

        //Initializing text editing controllers when there is text field or text area
        if (wrapper.question.answerType == AnswerType.textArea ||
            wrapper.question.answerType == AnswerType.textBox) {
          for (int i = 0; i < wrapper.question.options!.length; i++) {
            wrapper.question.options![i].textEditingController =
                TextEditingController();
          }
        }
        formProvider.addQuestion(wrapper.question);
      } catch (e) {
        print("In conversion error");
        print(e);
      }
    }
    return 1;
  }

  Future<int> getForm(BuildContext context, {
    required int patientFormID,
    required int patientId,
  }) async {
    // List<ChartQuestionDataModel> response = await FormBuilderManager()
    //     .getPatientFormByID(context, patientId: patientId);
    log("Patient Form ID: ${patientFormID}");
    final result = await FormBuilderManager()
        .getPatientFormByPatientFormID(context, patientFormId: patientFormID, subFormId: patientId);
    final List<QuestionDataModel> response = (result['questions'] as List).cast<QuestionDataModel>();

    final formProvider =
    Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    wideWidgets.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          } else {
            nonComprehensiveQtn.add(DynamicQuestion(
              questionWrapper: wrapper,
            ));
          }
        } else {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              _buildStaticWidget(wrapper, formProvider),
            );
          } else {
            nonComprehensiveQtn.add(
              _buildStaticWidget(wrapper, formProvider),
            );
          }
        }

        //Initializing text editing controllers when there is text field or text area
        if (wrapper.question.answerType == AnswerType.textArea ||
            wrapper.question.answerType == AnswerType.textBox) {
          for (int i = 0; i < wrapper.question.options!.length; i++) {
            wrapper.question.options![i].textEditingController =
                TextEditingController();
          }
        }
        formProvider.addQuestion(wrapper.question);
      } catch (e) {
        print("In conversion error");
        print(e);
      }
    }
    return 1;
  }

  _buildStaticWidget(QuestionWrapper questionWrapper,
      FormBuilderProvider formProvider) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        ChangeNotifierProvider<QuestionWrapper>.value(
          value: questionWrapper,
          child: Consumer<QuestionWrapper>(
            builder: (BuildContext context, QuestionWrapper questionWrapper,
                Widget? child) {
              List<Widget> widgets = [];
              for (int i = 0; i <
                  questionWrapper.subQuestionWrappers.length; i++) {
                widgets.add(getSubQuestionWidgetByType(
                    questionWrapper.subQuestionWrappers[i], formProvider));
              }
              return Padding(
                padding: isMobile?EdgeInsets.zero:EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                child: Material(
                  borderRadius:
                  isDesktop ? BorderRadius.all(Radius.circular(12.r)) : null,
                  elevation: !isDesktop ? 0 : 4,
                  child: Selector<QuestionWrapper, bool>(
                    builder: (BuildContext context, bool isAnswered,
                        Widget? child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: isAnswered ? AppColors.cardBackGColor : Colors
                              .white,
                          borderRadius: isDesktop
                              ? BorderRadius.all(Radius.circular(12.r))
                              : null,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: child,
                      );
                    },
                    selector:
                        (BuildContext context, QuestionWrapper questionWrapper) =>
                    questionWrapper.isAnswered,
                    child: Column(
                        children: [...widgets]
                    ),
                  ),
                ),
              );
            },
          ),
        ),


        if(isMobile)
          Divider(thickness: 2, color: AppColors.greyColor, height: 35,)

      ],
    );
  }

  Widget getSubQuestionWidgetByType(SubQuestionWrapper subQuestionWrapper,
      FormBuilderProvider formBuilderProvider) {
    final subQuestion = subQuestionWrapper.subQuestion;
    Widget content;
    switch (subQuestion.type) {
      case AnswerType.info:
        content = StaticInfoWidget(subQuestion: subQuestion);
        break;
      case AnswerType.textBox:
        content = StaticTextFieldWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.checkbox:
        content = StaticCheckBoxWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;

      case AnswerType.dropdown:
        content = FunctionalAssessmentDropdownWidget(
          subQuestionWrapper: subQuestionWrapper,
          formBuilderProvider: formBuilderProvider,
        );
        break;

      case AnswerType.divider:
        content = const Divider();
        break;
      default:
        content = Text(
            'Unknown question type:${subQuestionWrapper.subQuestion.type}');
    }
    return content;
  }
}

class FunctionalAssessmentDropdownWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final FormBuilderProvider formBuilderProvider;

  const FunctionalAssessmentDropdownWidget({
    super.key,
    required this.subQuestionWrapper,
    required this.formBuilderProvider,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final selectedOption = subQuestionWrapper.subQuestion.options
              .firstWhereOrNull((option) => option.selected);
          return isMobile
              ? Column(
            children: [
              sbh(10),
              Html(
                data: "<b>${subQuestionWrapper.subQuestion.title}</b>",
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
              Row(
                children: [
                  Expanded(
                    child: StaticDropdownElement(
                      subQuestionWrapper: subQuestionWrapper,
                      onChanged: (newOption) {
                        if (newOption == null) {
                          return;
                        }
                        subQuestionWrapper.setOption(newOption.index);
                      },
                    ),
                  ),
                  selectedOption != null
                      ? InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            CopySelectionDialog(
                                referenceSubQuestionWrapper:
                                subQuestionWrapper,
                                formProvider: formBuilderProvider),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.copy,
                        color: AppColors.primaryAppLightColor,
                        size: 15,
                      ),
                    ),
                  )
                      : sbw(22),
                ],
              )
            ],
          )
              : Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Html(
                        data:
                        "<b>${subQuestionWrapper.subQuestion.title}</b>",
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: StaticDropdownElement(
                        subQuestionWrapper: subQuestionWrapper,
                        onChanged: (newOption) {
                          if (newOption == null) {
                            return;
                          }
                          subQuestionWrapper.setOption(newOption.index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              selectedOption != null
                  ? IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        CopySelectionDialog(
                            referenceSubQuestionWrapper:
                            subQuestionWrapper,
                            formProvider: formBuilderProvider),
                  );
                },
                icon: const Icon(Icons.copy),
                color: AppColors.primaryAppLightColor,
              )
                  : sbw(25)
            ],
          );
        },
      ),
    );
  }
}

class CopySelectionDialog extends StatefulWidget {
  final FormBuilderProvider formProvider;
  final SubQuestionWrapper referenceSubQuestionWrapper;

  const CopySelectionDialog({super.key,
    required this.referenceSubQuestionWrapper,
    required this.formProvider});

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
    return PopupTemplate(
        maxWidth: 600.w,
        maxHeight: 600.h,
        headerWidget: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5, right: 8),
              child: Row(
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            selectedSubQuestionWrappers.clear();
                            for (var questionWrapper
                            in widget.formProvider.wrapperQuestions) {
                              selectedSubQuestionWrappers.addAll(questionWrapper
                                  .subQuestionWrappers
                                  .where((subWrapper) =>
                              subWrapper.subQuestion.type ==
                                  AnswerType.dropdown));
                            }
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
            const Divider(),
          ],
        ),
        body: [
          isMobile
              ? Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[0]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[1]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[2]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[3]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[4]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[5]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[6]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[7]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[8]),
              _getCheckBoxForQuestion(
                  widget.formProvider.wrapperQuestions[9]),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 50.w,
            children: [
              Expanded(
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[0]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[1]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[2]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[3]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[4]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[5]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[6]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[7]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[8]),
                    _getCheckBoxForQuestion(
                        widget.formProvider.wrapperQuestions[9]),
                  ],
                ),
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
              borderRadius: 10,
              // width: 120.w,
              // height: 35.h,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              buttonColor: Colors.white,
              labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 30,
            ),
            PrimaryButton(
              onTap: () {
                processSave();
                Navigator.pop(context);
              },
              label: 'Save',
              borderRadius: 10,
              // height: 35.h,
              // width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
        title: "");
  }

  void processSave() {
    if (selectedOptionIndex == -1) {
      return;
    }
    for (final subWrapper in selectedSubQuestionWrappers) {
      subWrapper.setOption(selectedOptionIndex);
    }
  }

  Widget _getCheckBoxForQuestion(QuestionWrapper questionWrapper) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getQuestionCheckBox(questionWrapper),
        ...questionWrapper.subQuestionWrappers
            .where((subWrapper) =>
        subWrapper.subQuestion.type == AnswerType.dropdown)
            .map(
              (subWrapper) => _getCheckBox(subWrapper),
        ),
      ],
    );
  }

  bool isAllSubQuestionSelected(QuestionWrapper questionWrapper) {
    bool selected = true;
    for (final subWrapper in questionWrapper.subQuestionWrappers.where(
            (subWrapper) =>
        subWrapper.subQuestion.type == AnswerType.dropdown)) {
      if (!selectedSubQuestionWrappers.contains(subWrapper)) {
        selected = false;
        break;
      }
    }
    return selected;
  }

  Widget _getQuestionCheckBox(QuestionWrapper questionWrapper) {
    return DynamicCheckboxElement(
      label: questionWrapper.subQuestionWrappers.first.subQuestion.title ,
      value: "",
      selected: isAllSubQuestionSelected(questionWrapper),
      onTap: (_, __) {
        if (isAllSubQuestionSelected(questionWrapper)) {
          for (final subWrapper in questionWrapper.subQuestionWrappers) {
            selectedSubQuestionWrappers.remove(subWrapper);
          }
        } else {
          selectedSubQuestionWrappers.addAll(questionWrapper.subQuestionWrappers
              .where((subWrapper) =>
          subWrapper.subQuestion.type == AnswerType.dropdown));
        }
        setState(() {});
      },
      index: 0,
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

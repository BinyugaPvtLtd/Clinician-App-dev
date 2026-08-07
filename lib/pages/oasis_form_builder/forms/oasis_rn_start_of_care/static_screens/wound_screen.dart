import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/generate_options.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10019007.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/form_builder_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_card_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/dynamic_question.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/static_question_box.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/responsive.dart';
import '../../../oasis_form_builder.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../ui_components/overlays/local_notification_manager.dart';
import '../../../widgets/static/data/static_question_model.dart';
import '../../../widgets/static/presentation/widgets/static_check_box_widget.dart';
import '../../../widgets/static/presentation/widgets/static_dropdown_widget.dart';
import '../../../widgets/static/presentation/widgets/static_info_widget.dart';
import '../../../widgets/static/presentation/widgets/static_radio_widget.dart';
import '../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class WoundScreen extends StatefulWidget {
  final int subFormId;
  final int formId;
  final int patientFormID;
  final String formTitle;
  final String templateName;

  const WoundScreen({
    super.key,
    required this.subFormId,
    required this.formId,
    this.patientFormID = -1,
    this.formTitle = "",
    this.templateName = "",
  });

  @override
  State<WoundScreen> createState() => _WoundScreenState();
}

class _WoundScreenState extends State<WoundScreen> {
  final String title = "Integumentary / Wound Care";
  String templateName = "";

  List<Widget> comprehensiveQtn = [];
  List<Widget> wounds = [];
  List<Widget> nonComprehensiveQtn = [];

  late Future<int> _formFuture;

  @override
  void initState() {
    super.initState();
    _formFuture = widget.patientFormID == -1
        ? getForm2(context, patientId: widget.subFormId)
        : getForm(context, patientFormID: widget.patientFormID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _formFuture,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading Questions...'));
          }
          if (snap.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      Text(
                        templateName,
                        style: FormBuilderTextStyle.bold14style.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        title,
                        style: FormBuilderTextStyle.bold14style
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Responsive(
                        tablet: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...comprehensiveQtn,
                            ...wounds,
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: _getActionButton(
                                  "Add New Wound", _addNewWound),
                            ),
                            ...nonComprehensiveQtn,
                          ],
                        ),
                        desktop: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            comprehensiveQtn.isNotEmpty
                                ? Expanded(
                                    child: Column(
                                    children: [
                                      ...comprehensiveQtn,
                                      ...wounds,
                                      _getActionButton(
                                          "Add New Wound", _addNewWound),
                                    ],
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
                                await uploadAllImages(context,
                                    formProvider.uploadTypeQuestions,
                                    deletedImageUrls: formProvider
                                        .consumeDeletedImageUrlsQueue());
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
        });
  }

  Future<int> getForm(BuildContext context,
      {required int patientFormID}) async {
    final result = await FormBuilderManager()
        .getPatientFormByPatientFormID(context, patientFormId: patientFormID, subFormId: widget.subFormId);
    final List<QuestionDataModel> response = (result['questions'] as List).cast<QuestionDataModel>();

    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    initialQuestionLength = formProvider.wrapperQuestions.length;
    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.title != null &&
            wrapper.question.title!.contains("Wound#")) {
          wounds.add(_buildWoundWidget(wrapper, formProvider));
        } else if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(DynamicQuestion(
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
              StaticQuestionBox(
                 templetName: templateName,
                questionWrapper: wrapper,
              ),
            );
          } else {
            nonComprehensiveQtn.add(
              StaticQuestionBox(
                 templetName: templateName,
                questionWrapper: wrapper,
              ),
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

        //So that we can manage upload image and delete image functionality.
        if (wrapper.question.answerType == AnswerType.upload ||
            wrapper.question.subQuestions.any(
                  (element) => element.type == AnswerType.addWoundImage,
            )) {
          formProvider.addUploadTypeWrapper(wrapper);
        }
        formProvider.addQuestion(wrapper.question);
      } catch (e) {
        print("In conversion error");
        print(e);
      }
    }
    return 1;
  }

  Future<int> getForm2(BuildContext context, {required int patientId}) async {
    List<QuestionDataModel> response = await FormBuilderManager()
        .getDummyDataPatientFormByID(
            formId: widget.formId, context, patientId: patientId);
    templateName = await FormBuilderManager()
        .getFormTemplateName(patientId: patientId, formId: widget.formId);
    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    initialQuestionLength = formProvider.wrapperQuestions.length;
    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.title != null &&
            wrapper.question.title!.contains("Wound#")) {
          wounds.add(_buildWoundWidget(wrapper, formProvider));
        } else if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(DynamicQuestion(
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
              StaticQuestionBox(
                 templetName: templateName,
                questionWrapper: wrapper,
              ),
            );
          } else {
            nonComprehensiveQtn.add(
              StaticQuestionBox(
                 templetName: templateName,
                questionWrapper: wrapper,
              ),
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

        //So that we can manage upload image and delete image functionality.
        if (wrapper.question.answerType == AnswerType.upload ||
            wrapper.question.subQuestions.any(
                  (element) => element.type == AnswerType.addWoundImage,
            )) {
          formProvider.addUploadTypeWrapper(wrapper);
        }
        formProvider.addQuestion(wrapper.question);
      } catch (e) {
        print("In conversion error");
        print(e);
      }
    }
    return 1;
  }

  _buildWoundWidget(
      QuestionWrapper questionWrapper, FormBuilderProvider formProvider) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          List<Widget> woundWidgets = [];
          for (int i = 0; i < questionWrapper.subQuestionWrappers.length; i++) {
            if (questionWrapper.subQuestionWrappers[i].subQuestion.type ==
                AnswerType.foamStatic) {
              woundWidgets.add(
                FoamStaticWidget(
                  questionWrapper: questionWrapper,
                  subQuestionWrapperIndex: i,
                ),
              );
              i++;
            } else {
              woundWidgets.add(getSubQuestionWidgetByType(
                  questionWrapper.subQuestionWrappers[i]));
            }
          }
          return AppCardWidget(
            childrenSpacing: 10,
            backgroundColor: questionWrapper.isAnswered?AppColors.cardBackGColor:Colors.white,
            children: [
              TitleDescription(
                title: questionWrapper.question.title,
              ),
              ...woundWidgets,
              _getActionButton(
                'Add NPWT',
                () {
                  questionWrapper.addSubQuestionWrappers(
                    _addNPWT(questionWrapper),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getSubQuestionWidgetByType(SubQuestionWrapper subQuestionWrapper) {
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
        content = StaticDropdownWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.radio:
        content = StaticRadioWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.addWoundImage:
        content = AddWoundImageWidget(subQuestionWrapper: subQuestionWrapper);
        break;
      case AnswerType.divider:
        content = Divider();
        break;
      default:
        log('TYPE:-> ${subQuestionWrapper.subQuestion.type}/${subQuestionWrapper.subQuestion.id}');
        content = Text(
            'Unknown question type:${subQuestionWrapper.subQuestion.type}');
    }
    return content;
  }

  int initialQuestionLength = 0;

  Widget _getActionButton(String buttonTitle, onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: BoxConstraints(minWidth: 150),
        decoration: BoxDecoration(
            color: AppColors.primaryAppLightColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(25))
            ]),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: FormBuilderTextStyle.bold14style
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  List<SubQuestionWrapper> _addNPWT(QuestionWrapper questionWrapper) {
    final index = questionWrapper.subQuestionWrappers.length;
    final subQuestionsJSON = [
      {"question_id": index, "type": "DIVIDER", "options": []},
      {
        "question_id": index + 1,
        "type": "INFO",
        "description": "NPWT",
        "options": []
      },
      {
        "question_id": index + 2,
        "title": "Type:",
        "type": "TEXTFIELD",
        "scroll_axis": "HORIZONTAL",
        "options": generateOptions([""]),
      },
      {
        "question_id": index + 3,
        "type": "FOAMSTATIC",
        "options": generateOptions(["Foam"])
      },
      {
        "question_id": index + 4,
        "type": "RADIO",
        "group_options": true,
        "options_alignment": "HORIZONTAL",
        "options": generateOptions(["Black", "White", "Other"])
      },
      {
        "question_id": index + 5,
        "title": "# Pieces:",
        "type": "TEXTFIELD",
        "scroll_axis": "HORIZONTAL",
        "options": generateOptions([""]),
      },
      {
        "question_id": index + 6,
        "title": "Non- Adherent Dressing:",
        "type": "TEXTFIELD",
        "scroll_axis": "HORIZONTAL",
        "options": generateOptions([""]),
      },
      {
        "question_id": index + 7,
        "title": "Pressure",
        "type": "TEXTFIELD",
        "scroll_axis": "HORIZONTAL",
        "options": generateOptions([""], hints: ["mmHG"]),
      },
      {
        "question_id": index + 8,
        "type": "RADIO",
        "options_alignment": "HORIZONTAL",
        "options": generateOptions(["Continuous", "Intermittent"]),
      },
      {
        "question_id": index + 9,
        "options_alignment": "HORIZONTAL",
        "type": "CHECKBOX",
        "options": generateOptions([
          "Canister Change",
        ]),
      },
      {
        "question_id": index + 10,
        "type": "CHECKBOX",
        "title": "Periwound Protection:",
        "options_alignment": "HORIZONTAL",
        "options": generateOptions([
          "Transparent dressing",
          "Barier Film",
          "Other",
        ], textFieldPopup: [
          2
        ]),
      },
    ];

    return subQuestionsJSON
        .map(
          (json) => SubQuestionWrapper(
            subQuestion: StaticQuestionModel.fromJson(json),
          ),
        )
        .toList();
  }

  void _addNewWound() {
    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    // final woundData = formProvider.wrapperQuestions
    //     .firstWhere((wrapper) => wrapper.question.title!.contains("Wound#"));
    //
    final wrapper = QuestionWrapper(
        question: QuestionDataModel.fromJson({
      'question_type_id': formProvider.wrapperQuestions.first.question.id +
          (formProvider.wrapperQuestions.length),
      "type": "MIX",
      "question_type": "COMPREHENSIVE",
      "dynamic_type": false,
      "options_alignment": "HORIZONTAL",
      "answer_id": 0,
      "title": "<b>Wound#${wounds.length + 1}</b>",
      "questions": [
        {
          "question_id": 1,
          "type": "ADDWOUNDIMAGE",
          "title": "<b>Uploaded</b>",
          "scroll_axis": "HORIZONTAL",
          "options": []
        },
        {
          "question_id": 2,
          "type": "TEXTFIELD",
          "title": "Location:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": [
            {
              "index": 0,
              "value": "",
            }
          ]
        },
        {
          "question_id": 3,
          "type": "DROPDOWN",
          "title": "Type:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(9, (index) {
            final list = [
              "Skin Lesion",
              "Skin Tear",
              "Pressure Ulcer/Injury",
              "Surgical Wound",
              "Diabetic Ulcer",
              "Venous Ulcer",
              "Arterial Ulcer",
              "Trauma Wound",
              "Other",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 4,
          "type": "DROPDOWN",
          "title": "Wound Status:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(2, (index) {
            final list = [
              "Open",
              "Closed",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 5,
          "type": "DROPDOWN",
          "title": "Stage:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(7, (index) {
            final list = [
              "Healed/ Resurfaced Pressure",
              "Stage 1 Pressure Injury",
              "Stage 2 Pressure Ulcer/ Injury",
              "Stage 3 Pressure Ulcer/ Injury",
              "Stage 4 Pressure Ulcer/ Injury",
              "Unstageable Pressure Ulcer/ Injury",
              "Deep Tissue Injury",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 6,
          "type": "TEXTFIELD",
          "options": [
            {
              "index": 0,
              "label": "Length:",
              "hint": "cm",
              "value": "",
            },
            {
              "index": 1,
              "label": "Width:",
              "hint": "cm",
              "value": "",
            },
            {
              "index": 2,
              "label": "Sq. cm:",
              "hint": "cm",
              "value": "",
            },
            {
              "index": 3,
              "label": "Depth:",
              "hint": "cm",
              "value": "",
            },
            {
              "index": 4,
              "label": "Undermining",
              "value": "",
            },
            {
              "index": 5,
              "label": "Tunneling",
              "value": "",
            },
          ]
        },
        {
          "question_id": 7,
          "type": "CHECKBOX",
          "options_alignment": "HORIZONTAL",
          "title": "Periwound Skin",
          "options": List.generate(10, (index) {
            final list = [
              "Normal ",
              "Pale",
              "Maceration",
              "Excoriation",
              "Red",
              "Purple",
              "Warm",
              "Edema",
              "Cool",
              "Other",
            ];
            return {
              "index": index,
              "label": list[index],
              "value": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 8,
          "type": "DROPDOWN",
          "title": "Wound Bed Color:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(7, (index) {
            final list = [
              "Closed/ resurface",
              "White",
              "Gray",
              "Pink",
              "Red",
              "Tan",
              "Black",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 9,
          "type": "CHECKBOX",
          "options_alignment": "HORIZONTAL",
          "title": "Wound Bed Tissue:",
          "options": List.generate(8, (index) {
            final list = [
              "Bloody",
              "Granular",
              "Sloughing",
              "Weeping",
              "Necrotic",
              "Healthy",
              "Eschar",
              "Other",
            ];
            return {
              "index": index,
              "label": list[index],
              "value": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 10,
          "type": "DROPDOWN",
          "title": "Drainage Type:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(6, (index) {
            final list = [
              "None",
              "Bloody",
              "Serosanguineous",
              "Serous",
              "purulent",
              "Other:",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 11,
          "type": "DROPDOWN",
          "title": "Drainage Amount:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(5, (index) {
            final list = [
              "None",
              "Scant",
              "Small",
              "Moderate",
              "Large",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 12,
          "type": "DROPDOWN",
          "title": "Drainage Odor:",
          "group_options": true,
          "scroll_axis": "HORIZONTAL",
          "options": List.generate(4, (index) {
            final list = [
              "None",
              "Sweet",
              "Foul",
              "Other",
            ];
            return {
              "index": index,
              "label": list[index],
              "selected": false,
            };
          }),
        },
        {
          "question_id": 13,
          "type": "CHECKBOX",
          "options": [
            {
              "index": 0,
              "value": "",
              "label": "Patient Tolerated Wound Care Well",
              "selected": false,
            },
          ]
        },
      ]
    }));

    setState(() {
      wounds.add(_buildWoundWidget(wrapper, formProvider));
    });

    formProvider.addWrapper(wrapper);

    //Finding the drag and drop question
    final questionWrapper = formProvider.wrapperQuestions.firstWhereOrNull(
        (qWrapper) =>
            qWrapper.question.title != null &&
            qWrapper.question.title!.contains('Drag and drop a label'));
    if (questionWrapper == null) {
      return;
    }
    final subQuestionWrapper = questionWrapper.subQuestionWrappers[0];
    subQuestionWrapper.subQuestion.options.add(
      StaticOptionModel(
          index: subQuestionWrapper.subQuestion.options.length,
          label: subQuestionWrapper.subQuestion.options.length.toString(),
          value: "",
          selected: false,
          questionAnswerType:
              questionWrapper.question.answerType ?? AnswerType.none),
    );

    subQuestionWrapper.forceNotify();
  }
}

class FoamStaticWidget extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  final int subQuestionWrapperIndex;

  const FoamStaticWidget(
      {super.key,
      required this.questionWrapper,
      required this.subQuestionWrapperIndex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          return Row(
            children: [
              Expanded(
                child: StaticCheckBoxWidget(
                    subQuestionWrapper: questionWrapper
                        .subQuestionWrappers[subQuestionWrapperIndex]),
              ),
              Expanded(
                child: StaticRadioWidget(
                    subQuestionWrapper: questionWrapper
                        .subQuestionWrappers[subQuestionWrapperIndex + 1]),
              ),
            ],
          );
        },
      ),
    );
  }
}

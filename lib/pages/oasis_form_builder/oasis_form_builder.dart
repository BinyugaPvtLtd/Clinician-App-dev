import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/form_builder_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/patient_form_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/local_notification_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/dynamic_question.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/form_submission_popup.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/static_question_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/ui/const_sucess_popup.dart';
import 'constants/app_text_style.dart';
import 'constants/enums.dart';
import 'constants/responsive.dart';
import 'forms/oasis_rn_start_of_care/static_screens/wound_screen.dart';
import 'forms/oasis_st_start_of_care/static_screens/static_functional_assessment.dart';
import 'model/patient_form_model.dart';

class OasisFormBuilder extends StatefulWidget {
  final int subFormId;
  final int formId;
  final int patientFormID;
  String formTitle;
  String templateName;
  String userRole;
  String formStatus;
  String lastFormFillByAssist;
  int visitId;
  final ValueChanged<int>? onOrderAdded;
  final ValueChanged<int>? onFormChange;

  OasisFormBuilder({
    super.key,
    required this.subFormId,
    required this.formId,
    this.patientFormID = -1,
    this.visitId = 0,
    this.formTitle = "",
    this.templateName = "",
    this.userRole = "",
    this.formStatus = "",
    this.onOrderAdded,
    this.onFormChange,
    this.lastFormFillByAssist = "Clinitian",
  });


  @override
  State<OasisFormBuilder> createState() => _OasisFormBuilderState();
}

class _OasisFormBuilderState extends State<OasisFormBuilder> {
  int columns = 2;

  List<Widget> wideWidgets = [];

  List<Widget> comprehensiveQtn = [];

  List<Widget> nonComprehensiveQtn = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<SideDrawerItem> sideDrawerItems = [];

  int initialDrawerIndex = 0;

  Future<int>? _formFuture;
  List<Map<String, dynamic>> _pendingComments = [];
  Map<int, List<Map<String, dynamic>>> _preloadedCommentsByQuestion = {};

  void _reloadForm() {
    if (!mounted) return;
    setState(() {
      _formFuture = null;
      _pendingComments = [];
      _preloadedCommentsByQuestion = {};
    });
  }

  @override
  void didUpdateWidget(covariant OasisFormBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.subFormId != widget.subFormId ||
        oldWidget.patientFormID != widget.patientFormID ||
        oldWidget.formId != widget.formId) {
      _formFuture = null;
      _pendingComments = [];
      _preloadedCommentsByQuestion = {};
    }
  }

  List<Map<String, dynamic>> _buildQuestionsWithComments(
      List<Map<String, dynamic>> questions) {
    final pendingByQuestion = <int, List<Map<String, dynamic>>>{};
    for (final c in _pendingComments) {
      final qId = c['question_id'] as int;
      final entry = Map<String, dynamic>.from(c)..remove('question_id');
      pendingByQuestion.putIfAbsent(qId, () => []).add(entry);
    }
    return questions.map((q) {
      final copy = Map<String, dynamic>.from(q);
      final qId = q['question_type_id'] as int?;
      if (qId == null) return copy;
      final existing = _preloadedCommentsByQuestion[qId] ?? [];
      final newComments = pendingByQuestion[qId] ?? [];
      if (existing.isNotEmpty || newComments.isNotEmpty) {
        copy['comments'] = [...existing, ...newComments];
      }
      return copy;
    }).toList();
  }


  Color? _unresolvedColor(QuestionDataModel question) {
    final hasUnresolved = question.preloadedComments
        .any((c) => c['resolution_status'] == false);
    return hasUnresolved ? Colors.red.withValues(alpha: 0.08) : null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    _formFuture ??= widget.patientFormID == -1
        ? getForm2(context, formID: widget.formId, subFormID: widget.subFormId)
        : getForm(context, patientFormID: widget.patientFormID, subFormId: widget.subFormId);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: FutureBuilder(
          future: _formFuture,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text(
                'Loading Questions...',
                style: FormBuilderTextStyle.normal10style,
              ));
            }
            if (snap.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.userRole == "DME" || widget.userRole == "Clinical Manager" ?
                      const Offstage() :
                widget.userRole == "QA" ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 20,
                    children: [
                      IntrinsicWidth(
                        child: PrimaryButton(
                        height: 35.h,
                        onTap: () async {
                          final outerContext = context;
                          final formProvider = Provider.of<FormBuilderProvider>(
                              outerContext, listen: false);
                          await showDialog(
                            context: outerContext,
                            builder: (context) =>
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return
                                      FormSubmissionPopup(
                                        btnText: "Confirm",
                                        text: "Are you sure you want to send this form for correction?",
                                          title: "Confirmation",
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                          onDelete: () async {
                                            // Save form data before sending for correction
                                            await uploadAllImages(outerContext,
                                                formProvider.uploadTypeQuestions,
                                                deletedImageUrls: formProvider
                                                    .consumeDeletedImageUrlsQueue());
                                            if (!outerContext.mounted) return;
                                            await FormBuilderManager().savePatientForm(
                                              outerContext,
                                              patientFormID: widget.patientFormID,
                                              formData: {
                                                "subFormDataId": widget.subFormId,
                                                "data": {
                                                  "questions": _buildQuestionsWithComments(
                                                      formProvider.toJson()),
                                                }
                                              },
                                            );
                                            if (!context.mounted) return;
                                            final response = await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: 'SENT_FOR_CORRECTION'
                                            );
                                            if (response.statusCode == 200 || response.statusCode == 201) {
                                              Navigator.pop(context, true);
                                              showSucessDialog(
                                                  context: context,
                                                  message: 'Form Status Updated Successfully.',
                                                  title: 'Successfully');
                                              // Future.delayed(const Duration(milliseconds: 600));
                                              // Navigator.pop(context);
                                              // pass true so parent can refresh
                                            } else {
                                              showDocErrorDialog(context: context,
                                                  message: 'Something went wrong!',
                                                  title: 'Error');
                                            }
                                          }
                                      );
                                  },
                                ),
                          );

                        },
                        label: "Send For Correction",
                        buttonColor: AppColors.primaryAppColor,
                        borderRadius: 20.r,
                        padding: EdgeInsets.zero,
                        labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                          fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      IntrinsicWidth(
                        child: PrimaryButton(
                        height: 35.h,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return
                                      FormSubmissionPopup(
                                         text: "Are you sure you want to approve this form?",
                                          title: "Approve",
                                          btnText: "Approve",
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                          onDelete: () async {
                                            final response = await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: 'QA_APPROVED'
                                            );
                                            if (response.statusCode == 200 || response.statusCode == 201) {
                                              Navigator.pop(context, true);
                                              showSucessDialog(
                                                  context: context,
                                                  message: 'Form Approved Successfully.',
                                                  title: 'Successfully');
                                              // pass true so parent can refresh
                                            } else {
                                              showDocErrorDialog(context: context,
                                                  message: 'Something went wrong!',
                                                  title: 'Error');
                                            }
                                          }
                                      );
                                  },
                                ),
                          );

                        },
                        label: "Approve",
                        buttonColor: AppColors.primaryAppColor,
                        borderRadius: 20.r,
                        padding: EdgeInsets.zero,
                        labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                          fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ) : widget.userRole == "Coder" ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 20,
                    children: [
                      IntrinsicWidth(
                        child: PrimaryButton(
                        height: 35.h,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return
                                      ConfirmOasisFormPopup(
                                          text: "You're about to mark this form as F2F Needed.\nDo you want to continue?",
                                          title: "F2F Needed",
                                          btnText: "Mark & Close",
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                          onDelete: () async {
                                            final response = await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: 'F2F_NEEDED',
                                                isFaceToFace: true
                                            );
                                            if (response.statusCode == 200 || response.statusCode == 201) {
                                              Navigator.pop(context, true);
                                              showSucessDialog(
                                                  context: context,
                                                  message: 'F2f Added Successfully.',
                                                  title: 'Successfully');
                                              // pass true so parent can refresh
                                            } else {
                                              showDocErrorDialog(context: context,
                                                  message: 'Something went wrong!',
                                                  title: 'Error');
                                            }
                                          },
                                        btnText2: "Mark & Stay",
                                        onClickBtn2: () async{
                                          final response = await FormBuilderManager().patchPatientForm(
                                              context,
                                              patientFormID: widget.patientFormID,
                                              formData: 'F2F_NEEDED',
                                            isFaceToFace: true
                                          );
                                          if (response.statusCode == 200 || response.statusCode == 201) {
                                            Navigator.pop(context, true);
                                            showSucessDialog(
                                                context: context,
                                                message: 'F2f Added Successfully.',
                                                title: 'Successfully');
                                            // pass true so parent can refresh
                                          } else {
                                            showDocErrorDialog(context: context,
                                                message: 'Something went wrong!',
                                                title: 'Error');
                                          }
                                        },
                                      );
                                  },
                                ),
                          );
                        },
                        label: "F2F Needed",
                        buttonColor: AppColors.primaryAppColor,
                        borderRadius: 20.r,
                        padding: EdgeInsets.zero,
                        labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                          fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        ),
                      ),

                      IntrinsicWidth(
                        child: PrimaryButton(
                        height: 48.h,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return
                                      FormSubmissionPopup(
                                          btnText: "Confirm",
                                          text: "Are you sure you want to send this form for correction?",
                                          title: "Confirmation",
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                          onDelete: () async {
                                            final response = await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: 'CODER_SENT_FOR_CORRECTION'
                                            );
                                            if (response.statusCode == 200 || response.statusCode == 201) {
                                              Navigator.pop(context, true);
                                              showSucessDialog(
                                                  context: context,
                                                  message: 'Form Status Updated Successfully.',
                                                  title: 'Successfully');
                                              Future.delayed(const Duration(milliseconds: 600));
                                              Navigator.pop(context);
                                              // pass true so parent can refresh
                                            } else {
                                              showDocErrorDialog(context: context,
                                                  message: 'Something went wrong!',
                                                  title: 'Error');
                                            }
                                          }
                                      );
                                  },
                                ),
                          );
                        },
                        label: "Send For Correction",
                        buttonColor: AppColors.primaryAppColor,
                        borderRadius: 20.r,
                        padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMobile(context)
                                  ? 40.w
                                  : 30.w,
                              vertical: Responsive.isMobile(context)
                                  ? 15.h
                                  : 10.h),
                        labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        ),
                      ),
                      IntrinsicWidth(
                        child: PrimaryButton(
                        height: 48.h,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return
                                      FormSubmissionPopup(
                                          text: "Are you sure you want to approve this form?",
                                          title: "Approve",
                                          btnText: "Approve",
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                          onDelete: () async {
                                            final response = await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: 'COMPLETED'
                                            );
                                            if (response.statusCode == 200 || response.statusCode == 201) {
                                              Navigator.pop(context, true);
                                              showSucessDialog(
                                                  context: context,
                                                  message: 'Form Approved Successfully.',
                                                  title: 'Successfully');
                                              // pass true so parent can refresh
                                            } else {
                                              showDocErrorDialog(context: context,
                                                  message: 'Something went wrong!',
                                                  title: 'Error');
                                            }
                                          }
                                      );
                                  },
                                ),
                          );
                        },
                        label: "Approve",
                        buttonColor: AppColors.primaryAppColor,
                        borderRadius: 20.r,
                        padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMobile(context)
                                  ? 40.w
                                  : 30.w,
                              vertical: Responsive.isMobile(context)
                                  ? 15.h
                                  : 10.h),
                        labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ):Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 20,
                      children: [
                        // IntrinsicWidth(
                        //   child: PrimaryButton(
                        //     height: 30.h,
                        //   onTap: () async {
                        //     await showDialog(
                        //       context: context,
                        //       builder: (context) =>
                        //           StatefulBuilder(
                        //             builder: (BuildContext context, void Function(void Function()) setState) {
                        //               return
                        //                 FormSubmissionPopup(
                        //                     text: "Are you sure you want to Add Physician order?",
                        //                     title: "Add Physician order",
                        //                     btnText: "Confirm",
                        //                     onCancel: () {
                        //                       Navigator.pop(context);
                        //                     },
                        //                     onDelete: () async {
                        //                      var responseAddOrder = await FormBuilderManager().patchAssignPhysicianOrderForm(
                        //                           context,
                        //                           patientFormID: widget.patientFormID,
                        //                       );
                        //                      if(responseAddOrder.success == true){
                        //                        final result = await getPatientFormByPatientID(
                        //                          context,
                        //                          patientFormId: widget.patientFormID,
                        //                        );
                        //                        // Reload this form's questions
                        //                        _reloadForm();
                        //
                        //                        // Notify parent (OasisFormMapper) to rebuild sidebar
                        //                        widget.onOrderAdded?.call(widget.patientFormID);
                        //                        Navigator.pop(context);
                        //                      }
                        //                     }
                        //                 );
                        //             },
                        //           ),
                        //     );
                        //   },
                        //     width: 90.w,
                        //   label: "Add Order",
                        //   buttonColor: AppColors.primaryAppColor,
                        //     borderRadius: 6.r,
                        //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        //   labelStyle: Theme.of(context)
                        //           .textTheme
                        //           .bodyMedium!
                        //           .copyWith(
                        //     fontSize: 13.sp,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        IntrinsicWidth(
                          child: PrimaryButton(
                            height: 30.h,
                            width: 90.w,
                          onTap: () async {
                            final outerContext = context;
                            final formProvider = Provider.of<FormBuilderProvider>(
                                outerContext, listen: false);
                            await showDialog(
                              context: outerContext,
                              builder: (context) =>
                                  StatefulBuilder(
                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                      return
                                        FormSubmissionPopup(
                                            text: widget.lastFormFillByAssist == "assistant"?
                                            "Are you sure you want to approve this form?":
                                            "Are you sure you want to submit this form?",
                                            title: widget.lastFormFillByAssist == "assistant"?
                                            "Review Form":
                                            "Submit Form",
                                            btnText: widget.lastFormFillByAssist == "assistant" ?
                                            "Review":
                                            "Submit",
                                            onCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onDelete: () async {
                                              // Save form data before submitting
                                              // ─── Main submit logic ───────────────────────────────────────────────────────

                                              await uploadAllImages(
                                                outerContext,
                                                formProvider.uploadTypeQuestions,
                                                deletedImageUrls: formProvider.consumeDeletedImageUrlsQueue(),
                                              );

                                              if (!outerContext.mounted) return;

                                              await FormBuilderManager().savePatientForm(
                                                outerContext,
                                                patientFormID: widget.patientFormID,
                                                formData: {
                                                  "subFormDataId": widget.subFormId,
                                                  "data": {
                                                    "questions": _buildQuestionsWithComments(formProvider.toJson()),
                                                  }
                                                },
                                              );

                                              if (!outerContext.mounted) return;

                                              final bool isAssistantReview = widget.lastFormFillByAssist == "assistant";

                                              final response = isAssistantReview
                                                  ? await FormBuilderManager().patchIsAssistantFormReview(
                                                context: context,
                                                visitId: widget.visitId,
                                                patientFormId: widget.patientFormID,
                                              )
                                                  : await FormBuilderManager().patchPatientForm(
                                                context,
                                                patientFormID: widget.patientFormID,
                                                formData: widget.formStatus == "needs_correction"
                                                    ? "CORRECTED"
                                                    : "SUBMITTED_BY_CLINICIAN",
                                              );

                                              if (!context.mounted) return;

                                              if (response.statusCode == 200 || response.statusCode == 201) {
                                                // Close the current form screen
                                                Navigator.pop(context, true);

                                                if (!context.mounted) return;

                                                if (isAssistantReview) {
                                                  // ── Assistant review: just show success ──
                                                  showDialog(
                                                    context: context,
                                                    builder: (dialogContext) => FormChangePopup(
                                                      title: 'Supervisory Note',
                                                      text: 'Do you want to fill out the Supervisory Note for this visit?',
                                                      btnText: "Yes",
                                                      onCancel: () {
                                                        // User dismissed — dialog closes on its own
                                                      },
                                                      onDelete: () {
                                                        // Close the follow-up dialog

                                                        Navigator.pop(dialogContext); // ← close only the dialog, NOT the form screen

                                                        // Trigger reload and navigate to next form
                                                        _reloadForm();
                                                        widget.onFormChange?.call(response.supervisoryNoteFormID!);

                                                        if (!context.mounted) return;

                                                        // Show success after navigation
                                                        showSucessDialog(
                                                            context: context,
                                                            message: 'Form Submitted Successfully.',
                                                            title: 'Successfully');

                                                      },
                                                    ),
                                                  );
                                                  // showDialog(
                                                  //   context: context,
                                                  //   builder: (ctx) => AddSuccessPopup(
                                                  //     message: 'Form Approved Successfully',
                                                  //   ),
                                                  // );
                                                } else {
                                                  // ── Clinician submission ──
                                                  final bool hasNextForm =
                                                      response.nextPatientFormId != null && response.nextPatientFormId != 0;
                                                  if (!hasNextForm) {
                                                    // No follow-up form — just show success
                                                    showSucessDialog(
                                                        context: context,
                                                        message: 'Form Submitted Successfully.',
                                                        title: 'Successfully');
                                                  } else {
                                                    // Determine follow-up dialog content based on form ID
                                                    final bool isReassessmentForm =
                                                        response.nextFormName == "Reassessment" ||
                                                        response.nextFormName == "Follow Up";
                                                    if(isReassessmentForm){
                                                      showDialog(
                                                        context: context,
                                                        builder: (dialogContext) => FormChangePopup(
                                                          title: response.nextFormName == "Reassessment"
                                                              ? 'Reassessment'
                                                              : 'Discipline Follow-Up Visit Note',
                                                          text: response.nextFormName == "Reassessment"
                                                              ? 'Would you like to complete the Reassessment Form?'
                                                              : 'Do you want to fill out the Discipline Follow-Up Visit Note (PT/OT/ST) for this visit?',
                                                          btnText: "Yes",
                                                          onCancel: () {
                                                            // User dismissed — dialog closes on its own
                                                          },
                                                          onDelete: () {
                                                            // Close the follow-up dialog
                                                            Navigator.pop(dialogContext); // ← close only the dialog, NOT the form screen

                                                            // Trigger reload and navigate to next form
                                                            _reloadForm();
                                                            widget.onFormChange?.call(response.nextPatientFormId!);

                                                            if (!context.mounted) return;

                                                            // Show success after navigation
                                                            showSucessDialog(
                                                                context: context,
                                                                message: 'Form Submitted Successfully.',
                                                                title: 'Successfully');
                                                          },
                                                        ),
                                                      );
                                                    }
                                                    // else {
                                                    //   final visitData = await getVisitDataUsingVisitId(
                                                    //     context: context,
                                                    //     visitId: visit.visitId,
                                                    //   );
                                                    //
                                                    //   if (visitData.isLastEpisode == true) {
                                                    //     if (!mounted) return;
                                                    //     showDialog(
                                                    //       context: context,
                                                    //       builder: (_) => DischargeVisitTypePopup(
                                                    //         visitData: visitData,
                                                    //         onNevigate: () {
                                                    //           showDialog(
                                                    //             context: context,
                                                    //             builder: (_) => ViewStartVisit(
                                                    //               visitData: visitData,
                                                    //               onRefresh: () {},
                                                    //             ),
                                                    //           );
                                                    //         },
                                                    //       ),
                                                    //     );
                                                    //   } else {
                                                    //     // Trigger reload and navigate to next form
                                                    //     _reloadForm();
                                                    //     widget.onFormChange?.call(response.nextPatientFormId!);
                                                    //   }
                                                    // }
                                                  }
                                                }
                                              } else {
                                                // ── Error response ──
                                                showDocErrorDialog(context: context,
                                                    message: 'Something went wrong!',
                                                    title: 'Error');
                                              }
                                            }
                                        );
                                    },
                                  ),
                            );
                          },
                          label: widget.lastFormFillByAssist == "assistant" ?
                              "Review":
                              "Submit",
                          buttonColor: AppColors.primaryAppColor,
                            borderRadius: 6.r,
                            padding: EdgeInsets.zero,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                            fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        IntrinsicWidth(
                          child: PrimaryButton(
                            width: 90.w,
                            height: 30.h,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) =>
                                  StatefulBuilder(
                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                      return
                                        FormSubmissionPopup(
                                            text: "Are you sure you want to restart this visit?\nAll data will be lost",
                                            title: "Restart Visit",
                                            btnText: "Restart",
                                            onCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onDelete: () async {
                                              final response = await FormBuilderManager().patchPatientFormRestart(
                                                  context,
                                                  widget.patientFormID,
                                              );
                                              if (response.statusCode == 200 || response.statusCode == 201) {
                                                Navigator.pop(context);
                                                showSucessDialog(
                                                    context: context,
                                                    message: 'Restart visit Successfully.',
                                                    title: 'Successfully');
                                                // Reload this form's questions
                                                _reloadForm();

                                                // Notify parent (OasisFormMapper) to rebuild sidebar
                                                widget.onOrderAdded?.call(widget.patientFormID);
                                                // pass true so parent can refresh
                                              } else {
                                                showDocErrorDialog(context: context,
                                                    message: 'Something went wrong!',
                                                    title: 'Error');
                                              }
                                            }
                                        );
                                    },
                                  ),
                            );
                          },
                          label: "Restart",
                          buttonColor: AppColors.primaryAppColor,
                            borderRadius: 6.r,
                            padding: EdgeInsets.zero,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                            fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              ...wideWidgets,
                        Responsive(
                          tablet: Column(
                            children: [
                              ...comprehensiveQtn,
                              ...nonComprehensiveQtn,
                            ],
                          ),
                          desktop: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              comprehensiveQtn.isNotEmpty
                                  ? Expanded(
                                      child: Column(
                                        children: comprehensiveQtn,
                                      ),
                                    )
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
                                    ),
                            ],
                          ),
                        ),
                              widget.userRole == "DME" || widget.userRole == "Clinical Manager" ?
                              Offstage() :
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Responsive.isMobile(context)
                                          ? 40
                                          : 70,
                                      vertical: Responsive.isMobile(context)
                                          ? 15
                                          : 10),
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
                                  final formProvider =
                                      Provider.of<FormBuilderProvider>(context,
                                          listen: false);

                                  // Validate frequency selection for evaluation forms
                                  const freqQuestionIds = {310564008, 320581009, 330594009, 300547007, 100313008, 110348008, 120383008, 130416008, 470773008, 480808008, 490843008, 500876008};
                                  bool freqInvalid = false;
                                  outer:
                                  for (final wrapper in formProvider.wrapperQuestions) {
                                    if (freqQuestionIds.contains(wrapper.question.id)) {
                                      for (final sub in wrapper.subQuestionWrappers) {
                                        final val = sub.subQuestion.options.isNotEmpty
                                            ? sub.subQuestion.options.first.value
                                            : '';
                                        final dates = val.split(',').where((s) => s.trim().isNotEmpty).toList();
                                        if (dates.isNotEmpty && dates.length < 2) {
                                          freqInvalid = true;
                                          break outer;
                                        }
                                      }
                                    }
                                  }
                                  if (freqInvalid) {
                                    // await showDialog(
                                    //   context: context,
                                    //   builder: (ctx) => const AddErrorPopup(
                                    //     message: 'Please select more than one visit in date calendar',
                                    //   ),
                                    // );
                                    return;
                                  }

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

                                  // For Uploading Signatures If Any
                                  await uploadAllImages(context,
                                      formProvider.uploadTypeQuestions,
                                      deletedImageUrls: formProvider
                                          .consumeDeletedImageUrlsQueue());
                                  await FormBuilderManager().savePatientForm(
                                    context,
                                    patientFormID: widget.patientFormID,
                                    formData: {
                                      "subFormDataId": widget.subFormId,
                                      "data": {
                                        "questions": _buildQuestionsWithComments(formProvider.toJson()),
                                      }
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Responsive.isMobile(context)
                                          ? 40
                                          : 70,
                                      vertical: Responsive.isMobile(context)
                                          ? 15
                                          : 10),
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

  SideDrawerItem _buildSidebarItem(PatientForm form, PatientSubForm subForm) {
    //Return Static Screens Here With Their Case. [Case is Subform ID]
    switch (subForm.subFormID) {
      case 19:
      case 164:
      case 300:
      case 539:
      case 701:
      case 760:
      case 892:
      case 998:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: WoundScreen(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
          ),
          commentCount: subForm.commentCount
        );
      case 129:
      case 271:
      case 407:
      case 591:
      case 659:
      case 867:
      case 972:
      case 1082:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: StaticFunctionalAssessment(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
          ),
          commentCount: subForm.commentCount
        );
      default:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: OasisFormBuilder(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
            userRole: widget.userRole,
          ),
          commentCount: subForm.commentCount
        );
    }
  }

  Future<int> getForm(
    BuildContext context, {
    required int patientFormID,
        required int subFormId
  }) async
  {
    final result = await FormBuilderManager()
        .getPatientFormByPatientFormID(context, patientFormId: patientFormID, subFormId: subFormId);
    final List<QuestionDataModel> response = (result['questions'] as List).cast<QuestionDataModel>();
    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    wideWidgets.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    _preloadedCommentsByQuestion = {
      for (final w in formProvider.wrapperQuestions)
        if (w.question.preloadedComments.isNotEmpty)
          w.question.id: w.question.preloadedComments,
    };

    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          } else {
            nonComprehensiveQtn.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          }
        } else {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              StaticQuestionBox(
                questionWrapper: wrapper,
                templetName: widget.templateName,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(
              StaticQuestionBox(
                templetName: widget.templateName,
                questionWrapper: wrapper,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          } else {
            nonComprehensiveQtn.add(
              StaticQuestionBox(
                templetName: widget.templateName,
                questionWrapper: wrapper,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          }
        }

        //Initializing text editing controllers when there is text field or text area
        if (wrapper.question.answerType == AnswerType.textArea ||
            wrapper.question.answerType == AnswerType.textBox) {
          for (int i = 0; i < wrapper.question.options!.length; i++) {
            wrapper.question.options![i].textEditingController =
                TextEditingController(
                    text: wrapper.question.options![i].value);
          }
        }
        //To get list of upload widgets so that we can handle image upload and delete functionality
        if (wrapper.question.answerType == AnswerType.upload ||
            wrapper.question.subQuestions.any(
              (element) => element.type == AnswerType.upload,
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

  Future<int> getForm2(BuildContext context,
      {required int formID, required int subFormID}) async {
    // List<ChartQuestionDataModel> response = await FormBuilderManager()
    //     .getPatientFormByID(context, patientId: patientId);
    List<QuestionDataModel> response =
        await FormBuilderManager().getDummyDataPatientFormByID(
      context,
      patientId: subFormID,
      formId: formID,
    );

    columns = await FormBuilderManager()
        .getColumns(patientId: subFormID, formId: formID);
    widget.formTitle = await FormBuilderManager()
        .getFormTitle(patientId: subFormID, formId: formID);
    widget.templateName = await FormBuilderManager()
        .getFormTemplateName(patientId: subFormID, formId: formID);
    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    comprehensiveQtn.clear();
    nonComprehensiveQtn.clear();
    wideWidgets.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();

    _preloadedCommentsByQuestion = {
      for (final w in formProvider.wrapperQuestions)
        if (w.question.preloadedComments.isNotEmpty)
          w.question.id: w.question.preloadedComments,
    };

    for (var wrapper in formProvider.wrapperQuestions) {
      try {
        if (wrapper.question.dynamicType!) {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          } else {
            nonComprehensiveQtn.add(
              DynamicQuestion(questionWrapper: wrapper, highlightColor: _unresolvedColor(wrapper.question)),
            );
          }
        } else {
          if (wrapper.question.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(
              StaticQuestionBox(
                templetName: widget.templateName,
                questionWrapper: wrapper,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          } else if (wrapper.question.questionType == QuestionType.both) {
            wideWidgets.add(
              StaticQuestionBox(
                templetName: widget.templateName,
                questionWrapper: wrapper,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          } else {
            nonComprehensiveQtn.add(
              StaticQuestionBox(
                templetName: widget.templateName,
                questionWrapper: wrapper,
                highlightColor: _unresolvedColor(wrapper.question),
              ),
            );
          }
        }

        //Initializing text editing controllers when there is text field or text area
        if (wrapper.question.answerType == AnswerType.textArea ||
            wrapper.question.answerType == AnswerType.textBox) {
          for (int i = 0; i < wrapper.question.options!.length; i++) {
            wrapper.question.options![i].textEditingController =
                TextEditingController(
                    text: wrapper.question.options![i].value);
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
}

Future<void> uploadAllImages(BuildContext context, List<QuestionWrapper> questions,
    {List<String> deletedImageUrls = const []}) async {
  for (var qWrapper in questions) {
    // Upload images in main question options
    await _uploadOptions(context, qWrapper.question.options);

    // Upload images inside all sub-questions (recursively)
    await Future.wait(
      qWrapper.subQuestionWrappers.map(
        (subQWrapper) => _uploadSubQuestion(context, subQWrapper),
      ),
    );
  }

  final formBuilderManager = FormBuilderManager();
  for (final url in deletedImageUrls) {
    if (url.trim().isEmpty) continue;
    await formBuilderManager.deleteFiles(context, url: url);
  }
}

Future<void> _uploadSubQuestion(
    BuildContext context, SubQuestionWrapper subQWrapper) async {
  // Upload this sub-question's options
  await _uploadOptions(context, subQWrapper.subQuestion.options);
}

Future<void> _uploadOptions(
    BuildContext context, List<dynamic>? options) async {
  if (options == null) return;
  final formBuilderManager = FormBuilderManager();
  for (var option in options) {
    if (option.image != null) {
      final formData = FormData.fromMap({
        'file': MultipartFile(
          option.image!.openRead(),
          await option.image!.length(),
          filename: 'signature.png',
        ),
      });

      //TODO Don't upload if image is in deleted state
      final url =
          await formBuilderManager.uploadFiles(context, formData: formData);
      if (url?.isNotEmpty ?? false) {
        option.value = url ?? "";
      }
    }
  }

}

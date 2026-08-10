import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/request/widget/start_visit_preview_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/const_sucess_popup.dart';
import '../../../model/request/patient_schedule_model.dart';
import '../../oasis_form_builder/model/chart_patient_referral_data_model.dart';
import '../../oasis_form_builder/model/patient_form_model.dart';
import '../../oasis_form_builder/oasis_form_mapper.dart';
import '../../oasis_form_builder/services/api/managers/form_builder_manager.dart';
import '../../oasis_form_builder/services/api/managers/patient_form_manager.dart';
import '../../oasis_form_builder/side_drawer/side_drawer_provider.dart';
import '../../oasis_form_builder/widgets/popup/pending_forms_popup.dart';
import 'miss_visit_popup.dart';

class StartOrMissVisitDialogWidget extends StatefulWidget {
  final int visitId;
  final String? visitType;
  final int chartNo;
  final int patientId;
  final VisitScheduleItem visitData;
  // final VisitData visitData;
  const StartOrMissVisitDialogWidget({super.key, required this.visitId, this.visitType, required this.chartNo, required this.patientId, required this.visitData,});

  @override
  State<StartOrMissVisitDialogWidget> createState() => _StartOrMissVisitDialogWidgetState();
}

class _StartOrMissVisitDialogWidgetState extends State<StartOrMissVisitDialogWidget> {
  bool _isStartingVisit = false;
  bool _isMissingVisit = false;

  Future<void> _handleStartVisit() async {
    setState(() => _isStartingVisit = true);

    final result = await FormBuilderManager().patchStartVisit(
        context: context,
        visitId: widget.visitId,
        onWay: true,
        // visitTypeData: widget.visitType == null ? "" : widget.visitType!,
        // isLastVisit: widget.visitData.isSecoundLastEpisodeVisit == true ? true : false
    );

    if (!mounted) return;

    if (result.success) {
      // if(result.episodeEndDecision == true){
      //   showDialog(
      //     context: context,
      //     builder: (_) => DischargeVisitTypePopup(
      //         visitData: widget.visitData,
      //       onNevigate:()=> _onTap(
      //       patientFormId: result.ptFormId!,
      //       ptId: result.ptId!,
      //       chartNo: widget.visitData.patient.ptChartNo,
      //     ),),
      //   );
      //
      // }else{
      //
      // }
      _onTap(
        patientFormId: result.ptFormId!,
        ptId: result.ptId!,
        chartNo: widget.chartNo,
      );

    } else {
      setState(() => _isStartingVisit = false);
      showDocErrorDialog(context: context,
          message: result.message,
          title: 'Error');
    }
  }

  Future<void> _handleMissVisit() async {
    setState(() => _isMissingVisit = true);
    Navigator.pop(context);
    await Get.dialog(MissVisitFormPopup(
      visitId: widget.visitId,
      ptId: widget.patientId,
      lastFormFillByAssist: "Clinical",
    ));
  }

  Future<void> _onTap({
    required int patientFormId,
    required int ptId,
    required int chartNo,
  }) async {
    try {
      final result = await getPatientFormByPatientID(
        context,
        patientFormId: patientFormId,
      );
      // String userRole = await TokenManager.getUserStatus();

      if (!mounted) return;

      // ✅ Guard: bail out if result or critical data is null
      if (result == null) {
        setState(() => _isStartingVisit = false);
        debugPrint('_onTap: result is null — aborting navigation');
        // _showErrorSnackbar('Could not load patient form. Please try again.');
        return;
      }

      print('patinet DOB ${result.referralData.patientDob }');
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SideDrawerProvider>(
            create: (_) => SideDrawerProvider(),
            child: OasisFormMapper(
            form: PatientForm(
              formID: result.formId,
              formName: result.formName,
              fillStatus: result.status,
              subForms: result.subForms
                  .map((e) => PatientSubForm(
                  formID: result.formId,
                  subFormID: e.id,
                  subFormName: e.subFormName,
                  patientFormID: result.patientFormId,
                  fillStatus: e.isFilled,
                  commentCount: e.comment_count
              ))
                  .toList(),
            ),
            subForm: PatientSubForm(
              formID: result.formId,
              subFormID: result.subForms.isNotEmpty ? result.subForms.first.id : 0,
              subFormName: result.subForms.isNotEmpty ? result.subForms.first.subFormName : '',
              patientFormID: result.patientFormId,
              commentCount: result.subForms.isNotEmpty ? result.subForms.first.comment_count : 0,
              fillStatus: result.subForms.isNotEmpty ? result.subForms.first.isFilled : false,
            ),
            patient: ChartPatientReferral(
              patientId: ptId,
              firstName: result.referralData.patientFirstname,
              lastName: result.referralData.patientLastname,
              contactNumber: result.referralData.patientPhone,
              address: result.referralData.patientAddress,
              imageUrl: result.referralData.patientImageUrl,
              gender: Gender(genderID: 1, genderName: 'Male'),
              dateOfBirth: DateTime.tryParse(result.referralData.patientDob ?? '') ?? DateTime.now(),
              chartNo: result.referralData.patientChartNo,
              episodes: [],
            ),
            appBarString: 'EMR - Clinical',
            userRole: 'Clinical',
            ),
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint('_onTap error: $e\n$stack');
      // if (mounted) setState(() => _isStartingVisit = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: ColoredBox(
        color: Colors.white30,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: (Get.width / 1.3).w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Visit',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppAsset.closeSvgIcon),
                      ),
                    ],
                  ),
                  customHeight(18.h),
                  Text(
                    'Do you want to start this visit\nor mark it as missed?',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal12style.copyWith(
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                  customHeight(13.h),
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isMissingVisit
                            ? SizedBox(
                                width: 80.w,
                                height: 40.h,
                                child: Center(
                                  child: SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.rejectionRedColor,
                                    ),
                                  ),
                                ),
                              )
                            : PrimaryOutlinedButton(
                                width: 90.w,
                                height: 40.h,
                                text: 'Miss Visit',
                                radius: 6.r,
                                borderWidth: 1.r,
                                onPressed:
                                    _isStartingVisit ? null : _handleMissVisit,
                                textStyle: AppTextStyle.normal10style.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.rejectionRedColor,
                                ),
                              ),
                        customWidth(6.w),
                        _isStartingVisit
                            ? SizedBox(
                                width: 80.w,
                                height: 40.h,
                                child: Center(
                                  child: SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.primaryAppColor,
                                    ),
                                  ),
                                ),
                              )
                            : PrimaryButton(
                                width: 90.w,
                                height: 40.h,
                                label: 'Start Visit',
                                borderRadius: 6.r,
                                onTap: _isMissingVisit
                                    ? null
                                    : () {
                                        final visitData = widget.visitData;
                                        if (visitData
                                            .pendingAssistantFormIds
                                            .isNotEmpty) {
                                          Get.dialog(
                                            PendingReviewFormPopup(
                                              visitId: widget.visitId,
                                              patientId: widget.patientId,
                                              visitData: visitData,
                                              isLastEpisode: visitData
                                                  .isSecondLastEpisodeVisit,
                                              onNevigate: () {
                                                _handleStartVisit();
                                              },
                                            ),
                                          );
                                        } else if (visitData
                                                .episodeTriggerType ==
                                            "CALENDAR") {
                                          if (visitData.remainingVisitsCount >
                                              2) {
                                            Get.dialog(
                                              RecertFormDialog(
                                                visitId: widget.visitId,
                                                visitData: visitData,
                                                onNevigate: () {
                                                  _handleStartVisit();
                                                },
                                              ),
                                            );
                                          } else {
                                            Get.dialog(
                                              DischargeVisitTypePopup(
                                                visitData: visitData,
                                                onNevigate: () {
                                                  _handleStartVisit();
                                                },
                                              ),
                                            );
                                          }
                                        } else if (visitData
                                                .isSecondLastEpisodeVisit ||
                                            visitData.episodeTriggerType ==
                                                "POSITION") {
                                          Get.dialog(
                                            DischargeVisitTypePopup(
                                              visitData: visitData,
                                              onNevigate: () {
                                                _handleStartVisit();
                                              },
                                            ),
                                          );
                                        } else {
                                          _handleStartVisit();
                                        }
                                      },
                                padding: EdgeInsets.zero,
                                labelStyle: AppTextStyle.normal10style.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  ),
                  customHeight(12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

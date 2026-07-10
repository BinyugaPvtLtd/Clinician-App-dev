import 'package:clinician_app/controller/visit_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/timesheet_controller.dart';
import '../../core/ui/const_sucess_popup.dart';
import '../../model/timesheet/timesheet_model.dart';
import '../../utils/validator.dart';
import '../auth/widget/error_dailog.dart';
import '../calender_section/widget/calender_date_pick_dialog_widget.dart';

class EditVisitPage extends StatefulWidget {
  final TimeSheetAllData item;
  final String visitStatus;
  const EditVisitPage({super.key, required this.item, required this.visitStatus});

  @override
  State<EditVisitPage> createState() => _EditVisitPageState();
}

class _EditVisitPageState extends State<EditVisitPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TimeSheetController editVisitController;
  late final VisitController visitController;

  final TextEditingController visitDateController = TextEditingController();
  final TextEditingController visitStartTimeController = TextEditingController();
  final TextEditingController visitEndTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editVisitController = Get.find<TimeSheetController>();
    visitController = Get.find<VisitController>();

    final fromDate = DateTime.parse(widget.item.visiteDateTimeFrom);
    final toDate = DateTime.parse(widget.item.visitDateTimeTo);

    // Pre-fill fields from item
    visitDateController.text =
        "${fromDate.year}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}";
    visitStartTimeController.text =
    "${fromDate.hour.toString().padLeft(2, '0')}:${fromDate.minute.toString().padLeft(2, '0')}";
    visitEndTimeController.text =
    "${toDate.hour.toString().padLeft(2, '0')}:${toDate.minute.toString().padLeft(2, '0')}";
    visitController.status.value = widget.item.status;

    // Pre-select dropdowns
    editVisitController.selectedRecordName.value = widget.item.recordTypeName ?? '';
    editVisitController.selectedRecordTypeId.value = widget.item.recordTypeId ?? 0;

    print('@@@EditVisit [INIT] timesheetId: ${widget.item.dataId}');
    print('@@@EditVisit [INIT] visitDate: ${visitDateController.text}');
    print('@@@EditVisit [INIT] startTime: ${visitStartTimeController.text}');
    print('@@@EditVisit [INIT] endTime: ${visitEndTimeController.text}');
    print('@@@EditVisit [INIT] status: ${visitController.status.value}');
    print('@@@EditVisit [INIT] recordName: ${editVisitController.selectedRecordName.value}');
    print('@@@EditVisit [INIT] recordTypeId: ${editVisitController.selectedRecordTypeId.value}');
  }

  void _clearAndClose() {
    // editVisitController.selectedRecordTypeId.value = 0;
    // editVisitController.selectedRecordName.value = '';
    // editVisitController.selectedMasterVisitId.value = 0;
    // editVisitController.selectedMasterVisitName.value = '';
    // visitDateController.clear();
    // visitStartTimeController.clear();
    // visitEndTimeController.clear();
    // visitController.status.value = '';
    Get.back();
  }

  @override
  void dispose() {
    visitDateController.dispose();
    visitStartTimeController.dispose();
    visitEndTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "Edit",
              onTap: _clearAndClose,
            ),
            customHeight(10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            
                        // ── Record Type (read-only, pre-filled from visitStatus) ──
                        Text("Record Type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        Container(
                          width: double.infinity,
                          height: 44.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderGrey),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.visitStatus,
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                        ),
                        customHeight(18.h),
            
                        // ── Visit Type ──
                        /// TODO visit type commented as per client requirement
                        // Text("Visit Type", style: AppTextStyle.bold14style),
                        // customHeight(4.h),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: Obx(() => PrimaryDropDown(
                        //     validator: (_) => Validators.validateRequired(
                        //         editVisitController.selectedMasterVisitName.value, 'Visit Type'),
                        //     contentPadding: EdgeInsets.zero,
                        //     filled: false,
                        //     value: editVisitController.selectedMasterVisitName.value.isEmpty
                        //         ? null
                        //         : editVisitController.selectedMasterVisitName.value,
                        //     buttonStyleData: ButtonStyleData(
                        //       width: 120.w,
                        //       height: 44.h,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: AppColors.borderGrey),
                        //         borderRadius: BorderRadius.circular(6),
                        //       ),
                        //     ),
                        //     hintText: "Select visit type",
                        //     items: editVisitController.visitMaster.map((item) {
                        //       return DropdownMenuItem<String>(
                        //         value: item.typeOfVisit,
                        //         child: Padding(
                        //           padding: EdgeInsets.all(8.h),
                        //           child: Text(item.typeOfVisit,
                        //               style: AppTextStyle.normal12style.copyWith(
                        //                 fontWeight: FontWeight.w400,
                        //                 color: AppColors.defaultTxtGrey,
                        //               )),
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (value) {
                        //       for (var a in editVisitController.visitMaster) {
                        //         if (a.typeOfVisit == value) {
                        //           editVisitController.selectedMasterVisitName.value = value ?? '';
                        //           editVisitController.selectedMasterVisitId.value = a.visitMasterId;
                        //         }
                        //       }
                        //       print('@@@EditVisit [DROPDOWN] typeOfVisit: ${editVisitController.selectedMasterVisitName.value}, visitMasterId: ${editVisitController.selectedMasterVisitId.value}');
                        //     },
                        //   )),
                        // ),
                        // customHeight(18.h),
            
                        // ── Visit Date ──

                        Text("Visit Date", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          controller: visitDateController,
                          validator: (value) =>
                              Validators.validateRequired(value!, 'Visit Date'),
                          onTap: () async {
                            final String? selectedDate =
                            await Get.dialog(CalenderDatePickDialogWidget());
                            if (selectedDate != null) {
                              visitDateController.text = selectedDate;
                              print('@@@EditVisit [DROPDOWN] visitDate: ${visitDateController.text}');
                            }
                          },
                          suffixIcon: Icon(Icons.calendar_month_rounded),
                        ),
                        customHeight(18.h),
            
                        // ── Start Time ──
                        Text("Start Time", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          onTap: () async {
                            await editVisitController.selectStartTime(
                                context, visitStartTimeController);
                            print('@@@EditVisit [DROPDOWN] startTime: ${visitStartTimeController.text}');
                          },
                          validator: (value) =>
                              Validators.validateRequired(value!, 'Start Time'),
                          controller: visitStartTimeController,
                          suffixIcon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                        customHeight(18.h),
            
                        // ── End Time ──
                        Text("End Time", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          onTap: () async {
                            await editVisitController.selectEndTime(
                                context, visitEndTimeController);
                            print('@@@EditVisit [DROPDOWN] endTime: ${visitEndTimeController.text}');
                          },
                          validator: (value) =>
                              Validators.validateRequired(value!, 'End Time'),
                          controller: visitEndTimeController,
                          suffixIcon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                        customHeight(18.h),
            
                        // ── In Zone Toggle ──
                        // Text("In Zone", style: AppTextStyle.bold14style),
                        // customHeight(4.h),
                        // Obx(() => Row(
                        //   children: [
                        //     Switch(
                        //       value: inZone.value,
                        //       onChanged: (val) {
                        //         inZone.value = val;
                        //         print('@@@EditVisit [DROPDOWN] inZone: ${inZone.value}');
                        //       },
                        //       activeColor: AppColors.primaryAppColor,
                        //     ),
                        //     customWidth(8.w),
                        //     Text(
                        //       inZone.value ? "In Zone" : "Out of Zone",
                        //       style: AppTextStyle.normal12style.copyWith(
                        //         color: AppColors.defaultTxtGrey,
                        //       ),
                        //     ),
                        //   ],
                        // )),
                        // customHeight(18.h),
            
                        // ── Status ──
                        Text("Status", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: Obx(() => PrimaryDropDown(
                            validator: (_) => Validators.validateRequired(
                                visitController.status.value, 'Status'),
                            value: visitController.status.value.isEmpty
                                ? null
                                : visitController.status.value,
                            hintText: 'Select status',
                            buttonStyleData: ButtonStyleData(
                              width: 120.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            filled: false,
                            items: ['Completed', 'Ongoing'].map((s) {
                              return DropdownMenuItem(
                                value: s,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(s,
                                      style: AppTextStyle.normal12style.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.defaultTxtGrey,
                                      )),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              visitController.status.value = value ?? '';
                              print('@@@EditVisit [DROPDOWN] status: ${visitController.status.value}');
                            },
                          )),
                        ),
                        customHeight(48.h),
            
                        // ── Buttons ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryOutlinedButton(
                              text: "Cancel",
                              onPressed: _clearAndClose,
                              fillColor: Colors.white,
                              textStyle: AppTextStyle.bold14style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryAppColor,
                              ),
                              borderWidth: 1.5,
                              width: 110.w,
                              radius: 6,
                              height: 30.h,
                            ),
                            customWidth(15.w),
                            Obx(() => editVisitController.isVisitSaveLoading.value
                                ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.h),
                              child: CircularProgressIndicator(
                                color: AppColors.primaryAppColor,
                              ),
                            )
                                :PrimaryOutlinedButton(
                              text: "Update",
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final startParts = visitStartTimeController.text.split(':');
                                  final endParts = visitEndTimeController.text.split(':');
                                  final startMinutes = int.parse(startParts[0]) * 60 + int.parse(startParts[1]);
                                  final endMinutes = int.parse(endParts[0]) * 60 + int.parse(endParts[1]);
            
                                  if (endMinutes <= startMinutes) {
                                    showErrorDialog(
                                      context: context,
                                      subtitle: 'End time must be after start time',
                                      title: 'Error',
                                    );
                                    return;
                                  }

            
                                  final response = await editVisitController.patchEditVisitData(
                                    timesheetId: widget.item.dataId,
                                    data: {
                                      // "pt_id": addVisitController.selectedPatientId.value,
                                      "recordTypeId": editVisitController.selectedRecordTypeId.value,
                                      // "visitMasterId": addVisitController.selectedMasterVisitId.value,
                                      "visitDate": visitDateController.text,
                                      "startTime": visitStartTimeController.text,
                                      "endTime": visitEndTimeController.text,
                                      "status": visitController.status.value,
                                      // "location": locationController.text
                                    },
                                    // recordTypeId: editVisitController.selectedRecordTypeId.value,
                                    // visitMasterId: editVisitController.selectedMasterVisitId.value,
                                    // visitDate: visitDateController.text,
                                    // startTime: visitStartTimeController.text,
                                    // endTime: visitEndTimeController.text,
                                    // status: visitController.status.value,
                                    // inZone: inZone.value,
                                  );
            
                                  print('@@@EditVisit [PATCH RESPONSE] success: ${response.success}, statusCode: ${response.statusCode}, message: ${response.message}');
            
                                  if (response.success) {
                                    await editVisitController.fetchTimeSheetRecord();
                                    // editVisitController.updateLocalVisitRecord(
                                    //   visitId: widget.item.visitId,
                                    //   recordTypeId: editVisitController.selectedRecordTypeId.value,
                                    //   recordTypeName: editVisitController.selectedRecordName.value,
                                    //   visitMasterId: editVisitController.selectedMasterVisitId.value,
                                    //   visitMasterName: editVisitController.selectedMasterVisitName.value,
                                    //   visitDate: visitDateController.text,
                                    //   startTime: visitStartTimeController.text,
                                    //   endTime: visitEndTimeController.text,
                                    //   status: visitController.status.value,
                                    //   inZone: inZone.value,
                                    // );
                                    _clearAndClose();
                                    showSucessDialog(
                                      context: context,
                                      message: 'Visit updated successfully',
                                      title: 'Successfully',
                                    );
                                  } else {
                                    showErrorDialog(
                                      context: context,
                                      subtitle: response.message,
                                      title: 'Error',
                                    );
                                  }
                                }
                              },
                              fillColor: AppColors.primaryAppColor,
                              textStyle: AppTextStyle.normal14style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              borderWidth: 1.5,
                              width: 110.w,
                              radius: 6,
                              height: 30.h,
                            ),
                            ),
                          ],
                        ),
                        customHeight(48.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
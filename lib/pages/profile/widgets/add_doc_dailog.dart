import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/update_documents_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../../core/ui/primary_dropdown.dart';
import '../../calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'upload_capture_option.dart';

void showAddDocumentDialog(BuildContext context,int empId) {
  UpdateDocumentsController docCtrl = Get.put(UpdateDocumentsController());
  TextEditingController expDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Manual validation state for the two dropdowns — independent of
  // Form/FormField internals, so it works regardless of how
  // PrimaryDropDown is implemented under the hood.
  final RxnString docDropdownError = RxnString(null);
  final RxnString subDocDropdownError = RxnString(null);
  docCtrl.clearAll();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              width: 400,
              height: 570,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add New Document",
                      style: AppTextStyle.normal16style.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Obx(() => docCtrl.fileName.isEmpty
                              ? uploadCaptureOption(
                            isRedValidation: docCtrl.fileNameValidation.value.isEmpty ? false : true,
                            label2: docCtrl.fileNameValidation.value.isEmpty
                                ? "Upload document"
                                : docCtrl.fileNameValidation.value,
                            icon: AppAsset.upload,
                            label: "Upload here",
                            onTap: () async {
                              await docCtrl.pickPdf();
                              // ✅ Clear this dropdown/upload validation
                              // once a document has actually been selected.
                              if (docCtrl.fileName.value.isNotEmpty) {
                                docCtrl.fileNameValidation.value = '';
                              }
                            },
                          )
                              : uploadCaptureOption(
                            isRedValidation: false,
                            label2: docCtrl.fileName.value,
                            icon: AppAsset.upload,
                            label: "Upload here",
                            onTap: () async {
                              await docCtrl.pickPdf();
                              if (docCtrl.fileName.value.isNotEmpty) {
                                docCtrl.fileNameValidation.value = '';
                              }
                            },
                          )),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryDropDown(
                              // No Form validator here — error is fully
                              // manual via docDropdownError below, so it
                              // clears reliably the instant a value is picked.
                              validator: (value) => null,
                              contentPadding: EdgeInsets.zero,
                              filled: false,
                              value: docCtrl.selectedMasterMetaDocName.value,
                              buttonStyleData: ButtonStyleData(
                                width: 120.w,
                                height: 44.h,
                                // Zeroed out because the hint already carries
                                // its own EdgeInsets.all(8.h) (see
                                // primary_dropdown.dart) — adding padding here
                                // too would double-inset the hint relative to
                                // the selected value below.
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.borderGrey),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              hintText: docCtrl.docMetaList.isEmpty
                                  ? "No document found"
                                  : "Select document",
                              // Fixed, static list (Acknowledgements,
                              // Compensation, Health Record) — names are short
                              // and known ahead of time, so a single-line row
                              // is always enough here.
                              itemHeight: 44.h,
                              selectedItemBuilder: (context) =>
                                  docCtrl.docMetaList.map((item) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      // Mirrors the hint's own EdgeInsets.all(8.h)
                                      // so the selected value lines up with
                                      // where the placeholder text sat.
                                      child: Padding(
                                        padding: EdgeInsets.all(8.h),
                                        child: Text(
                                          item.documentName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.normal12style
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              items: docCtrl.docMetaList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.documentName ?? '',
                                  child: Padding(
                                    padding: EdgeInsets.all(8.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item.documentName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.normal12style
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.defaultTxtGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null && value.isNotEmpty) {
                                  for (var a in docCtrl.docMetaList) {
                                    if (a.documentName == value) {
                                      docCtrl.selectedSubDocId.value = 0;
                                      docCtrl.selectedSubDocName.value = '';
                                      docCtrl.docSubList.clear();
                                      docCtrl.selectedMasterMetaDocName.value = value;
                                      docCtrl.selectedMasterMetaDocId.value = a.employeeDocumentTypeMetaDataId ?? 0;
                                      docCtrl.fetchSubDocList(docMetaId:  a.employeeDocumentTypeMetaDataId );
                                    }
                                  }
                                  // ✅ Clear this field's error immediately —
                                  // this is a plain Rx write, not dependent
                                  // on any FormFieldState lookup.
                                  docDropdownError.value = null;
                                }
                              },
                            ),
                            if (docDropdownError.value != null) ...[
                              SizedBox(height: 6.h),
                              Text(
                                docDropdownError.value!,
                                style: AppTextStyle.normal12style.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        final bool hasLongSubDocName = docCtrl.docSubList.any(
                                (item) => item.documentName.length > 30);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryDropDown(
                              validator: (value) => null,
                              contentPadding: EdgeInsets.zero,
                              filled: false,
                              value: docCtrl.selectedSubDocName.value,
                              buttonStyleData: ButtonStyleData(
                                width: 120.w,
                                height: 44.h,
                                // Zeroed out because the hint already carries
                                // its own EdgeInsets.all(8.h) (see
                                // primary_dropdown.dart) — adding padding here
                                // too would double-inset the hint relative to
                                // the selected value below.
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.borderGrey),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              hintText: docCtrl.docMetaList.isEmpty
                                  ? "No document found"
                                  : (docCtrl.docSubList.isEmpty
                                  ? "No sub document found"
                                  : "Select sub document"),
                              itemHeight: hasLongSubDocName ? 60.h : 44.h,
                              // Same reasoning as the master-document dropdown:
                              // keep the closed button single-line even when
                              // the open menu wraps long sub-document names.
                              selectedItemBuilder: (context) =>
                                  docCtrl.docSubList.map((item) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      // Mirrors the hint's own EdgeInsets.all(8.h)
                                      // so the selected value lines up with
                                      // where the placeholder text sat.
                                      child: Padding(
                                        padding: EdgeInsets.all(8.h),
                                        child: Text(
                                          item.documentName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.normal12style
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              items: docCtrl.docSubList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.documentName ?? '',
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 3.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item.documentName,
                                        maxLines: hasLongSubDocName ? 2 : 1,
                                        overflow: TextOverflow.clip,
                                        style: AppTextStyle.normal12style
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.defaultTxtGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                for (var a in docCtrl.docSubList) {
                                  if (a.documentName == value) {
                                    docCtrl.selectedSubDocName.value = value ?? '';
                                    docCtrl.selectedSubDocId.value = a.employeeDocumentTypeSetupId ?? 0;
                                    docCtrl.isExpDateShown.value = a.expiry_type == "Issuer Expiry" ? true: false;
                                  }
                                }
                                if (value != null && value.isNotEmpty) {
                                  // ✅ Clear this field's error immediately.
                                  subDocDropdownError.value = null;
                                }
                              },
                            ),
                            if (subDocDropdownError.value != null) ...[
                              SizedBox(height: 6.h),
                              Text(
                                subDocDropdownError.value!,
                                style: AppTextStyle.normal12style.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: 15.h),
                    // Expiry Date Field
                    Obx(()=>  docCtrl.isExpDateShown.value ? Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Expiry date of document",
                        style: AppTextStyle.bold12style.copyWith(
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ) : SizedBox.shrink()),
                    SizedBox(height: 8),

                    Obx(()=> docCtrl.isExpDateShown.value ? PrimaryTextField(
                      readonly: true,
                      controller: expDateController,
                      hintStyle: AppTextStyle.regular12style.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.defaultTxtGrey,
                      ),
                      onTap: () async{
                        FocusScope.of(Get.context!).unfocus();
                        final String? selectedDate =
                        await Get.dialog(CalenderDatePickDialogWidget());

                        if (selectedDate != null) {
                          expDateController.text = selectedDate;

                          final DateTime datePicked = DateFormat("yyyy-MM-dd").parse(selectedDate);
                          // Build UTC midnight directly from the picked
                          // Y/M/D — parsing gives local midnight, and
                          // .toUtc() on that shifts the calendar day back
                          // by one whenever the device is ahead of UTC.
                          docCtrl.expiryIsoDate.value = DateTime.utc(
                            datePicked.year,
                            datePicked.month,
                            datePicked.day,
                          ).toIso8601String();
                        }
                      },
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ) : SizedBox.shrink()),
                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Log Out Button
                        Expanded(
                          child: PrimaryOutlinedButton(
                            width: 100.w,
                            height: 30.h,
                            text: "Cancel",
                            borderWidth: 1.5,
                            radius: 6,
                            textStyle: AppTextStyle.normal12style.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryAppColor,
                            ),
                            buttonColor: AppColors.primaryAppColor,
                            onPressed: () {
                              docCtrl.clearAll();
                              docCtrl.docSubList.clear();
                              docCtrl.selectedSubDocName.value = '';
                              docCtrl.selectedSubDocId.value = 0;
                              docDropdownError.value = null;
                              subDocDropdownError.value = null;
                              Get.back();
                            },
                          ),
                        ),
                        customWidth(12.w),
                        // Cancel Button
                        Expanded(
                          child:Obx(() => docCtrl.isDocumentSaveLoading.value ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryAppColor,
                            ),
                          ): PrimaryButton(
                            onTap: () async{
                              // Manual validation for the two dropdowns.
                              docDropdownError.value =
                              docCtrl.selectedMasterMetaDocName.value.trim().isEmpty
                                  ? 'Document is required'
                                  : null;
                              subDocDropdownError.value =
                              docCtrl.selectedSubDocName.value.trim().isEmpty
                                  ? 'Sub document is required'
                                  : null;

                              final bool isFormValid = _formKey.currentState!.validate();
                              final bool isDropdownValid = docDropdownError.value == null &&
                                  subDocDropdownError.value == null;

                              if (isFormValid && isDropdownValid){
                                if(docCtrl.fileNameValidation.value.isNotEmpty || docCtrl.fileNameValidation.value == "File too large"){
                                  var uploadResponse = await docCtrl.postUploadDocumentBase64Data(
                                      docMetaId: docCtrl.selectedMasterMetaDocId.value,
                                      docTypeSetupId: docCtrl.selectedSubDocId.value,
                                      empId: empId,
                                      base64File: docCtrl.selectedPdfFile.value!,
                                      documentName: docCtrl.fileName.value,
                                      expiryDate: expDateController.text.isEmpty ? null : docCtrl.expiryIsoDate.value);
                                  if(uploadResponse.statusCode == 200 || uploadResponse.statusCode ==201){
                                    Get.back();
                                    docCtrl.clearAll();
                                    docCtrl.fetchDocListDetails(empId: empId, approveOnly: 'no', searchText: 'all');
                                    showSucessDialog( context: context,
                                        message: 'Document uploaded successfully.',
                                        title: 'Successfully');
                                  }else{
                                    Get.back();
                                    docCtrl.clearAll();
                                    showDocErrorDialog(context: context,
                                        message: uploadResponse.message,
                                        title: 'Error');
                                  }
                                }else{
                                  docCtrl.fileNameValidation.value = 'Please upload document';
                                  print('Validation failed');
                                }
                              }else{
                                if (docCtrl.fileName.value.isEmpty) {
                                  docCtrl.fileNameValidation.value = 'Please upload document';
                                }
                                print('Validation failed');
                              }
                            },
                            width: 100.w,
                            height: 30.h,
                            padding: EdgeInsets.zero,
                            borderRadius: 6,
                            label: "Save",
                            labelStyle: AppTextStyle.normal12style.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
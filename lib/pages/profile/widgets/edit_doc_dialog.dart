import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/update_documents_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../../model/request/request_data_model.dart';
import '../../calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'upload_capture_option.dart';

/// Edit an existing employee document. Select Document / Select Sub Document
/// are shown read-only (prefilled from the record being edited) — only the
/// uploaded file and the expiry date can be changed here.
void showEditDocumentDialog(
    BuildContext context, {
      required int employeeDocumentId,
      required int empId,
    }) async {
  UpdateDocumentsController docCtrl = Get.put(UpdateDocumentsController());
  docCtrl.clearAll();
  docCtrl.docSubList.clear();
  docCtrl.prefillData.value = null;

  // Owns the Save button's spinner for the whole save operation. Kept
  // separate from docCtrl.isDocumentSaveLoading, which each individual API
  // call flips back to false in its own `finally` block — relying on it
  // here would flicker the spinner off between the file-upload PATCH and
  // the follow-up metadata PATCH when both run in the same save.
  final RxBool isSaving = false.obs;

  // Blocking loader while the existing document is fetched — swapped out
  // for the real edit form once prefill data is ready.
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: CircularProgressIndicator(color: AppColors.primaryAppColor),
    ),
  );

  final prefill = await docCtrl.fetchPrefillDocument(
    employeeDocumentId: employeeDocumentId,
  );

  if (!context.mounted) return;
  Get.back(); // close the loader

  if (prefill == null) {
    showDocErrorDialog(
      context: context,
      message: 'Failed to load document',
      title: 'Error',
    );
    return;
  }

  // Resolve the read-only "Select document" label against the fixed static
  // list, falling back to whatever the backend labelled it as.
  final matchedMeta = UpdateDocumentsController.staticDocMetaList
      .firstWhereOrNull((m) => m.employeeDocumentTypeMetaDataId == prefill.empDocMetaDataId);
  final String masterDocLabel = matchedMeta?.documentName ??
      (prefill.documentType.isNotEmpty ? prefill.documentType : '--');

  await docCtrl.fetchSubDocList(docMetaId: prefill.empDocMetaDataId);

  // Resolve the read-only "Select sub document" label the same way.
  final matchedSub = docCtrl.docSubList.firstWhereOrNull(
          (s) => s.employeeDocumentTypeSetupId == prefill.empDocSetupId);
  final String subDocLabel =
      matchedSub?.documentName ?? (prefill.documentType.isNotEmpty ? prefill.documentType : '--');
  // Whether an issuer-expiry date applies — inferred from the matched sub
  // document type; defaults to true (shown) since this dialog only opens
  // for documents that already carry an expiry date.
  final bool showExpiry =
      matchedSub != null ? matchedSub.expiry_type == "Issuer Expiry" : true;

  // Prefill the upload widget with the existing file's name (the prefill
  // API's DocumentName field) — tapping it still lets the user pick a
  // replacement.
  docCtrl.fileName.value = prefill.documentName;

  final TextEditingController expDateController = TextEditingController();
  if (prefill.expiry.isNotEmpty) {
    try {
      final dt = DateTime.parse(prefill.expiry);
      expDateController.text = DateFormat('yyyy-MM-dd').format(dt);
      docCtrl.expiryIsoDate.value = dt.toUtc().toIso8601String();
    } catch (_) {
      // Leave expiry blank if the backend value can't be parsed.
    }
  }

  if (!context.mounted) return;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Edit Document",
                    style: AppTextStyle.normal16style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(() => uploadCaptureOption(
                          isRedValidation: docCtrl.fileNameValidation.value.isNotEmpty,
                          label2: docCtrl.fileNameValidation.value.isNotEmpty
                              ? docCtrl.fileNameValidation.value
                              : (docCtrl.fileName.value.isEmpty
                              ? "Upload document"
                              : docCtrl.fileName.value),
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

                  // Select Document — read-only, prefilled
                  _readOnlyField(label: masterDocLabel),
                  SizedBox(height: 15.h),

                  // Select Sub Document — read-only, prefilled
                  _readOnlyField(label: subDocLabel),
                  SizedBox(height: 15.h),

                  if (showExpiry) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Expiry date of document",
                        style: AppTextStyle.bold12style.copyWith(
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    PrimaryTextField(
                      readonly: true,
                      controller: expDateController,
                      hintStyle: AppTextStyle.regular12style.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.defaultTxtGrey,
                      ),
                      onTap: () async {
                        FocusScope.of(Get.context!).unfocus();
                        final String? selectedDate =
                        await Get.dialog(CalenderDatePickDialogWidget());

                        if (selectedDate != null) {
                          expDateController.text = selectedDate;
                          final DateTime datePicked =
                          DateFormat("yyyy-MM-dd").parse(selectedDate);
                          // Build UTC midnight directly from the picked
                          // Y/M/D — parsing gives local midnight, and
                          // .toUtc() on that shifts the calendar day back
                          // by one whenever the device is ahead of UTC.
                          docCtrl.expiryIsoDate.value = DateTime.utc(
                            datePicked.year,
                            datePicked.month,
                            datePicked.day,
                          ).toIso8601String();
                          setState(() {});
                        }
                      },
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    SizedBox(height: 24),
                  ],

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            docCtrl.prefillData.value = null;
                            Get.back();
                          },
                        ),
                      ),
                      customWidth(12.w),
                      Expanded(
                        child: Obx(() => isSaving.value
                            ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryAppColor,
                          ),
                        )
                            : PrimaryButton(
                          onTap: () async {
                            if (docCtrl.fileName.value.trim().isEmpty) {
                              docCtrl.fileNameValidation.value =
                              'Please upload document';
                              return;
                            }

                            final String? isoExpiry =
                            expDateController.text.isEmpty
                                ? null
                                : docCtrl.expiryIsoDate.value;
                            final bool pickedNewFile =
                                docCtrl.selectedPdfFile.value != null;

                            isSaving.value = true;
                            try {
                              ApiData response;
                              if (pickedNewFile) {
                                response =
                                await docCtrl.patchEmployeeDocumentBase64Data(
                                  employeeDocumentId:
                                  prefill.employeeDocumentId,
                                  docMetaId: prefill.empDocMetaDataId,
                                  docTypeSetupId: prefill.empDocSetupId,
                                  empId: prefill.employeeId,
                                  base64File: docCtrl.selectedPdfFile.value!,
                                  documentName: docCtrl.fileName.value,
                                );

                                // The withBase64 endpoint doesn't accept an
                                // expiry date — persist it with a follow-up
                                // metadata patch once the new file is saved,
                                // using the freshly uploaded DocumentUrl.
                                if ((response.statusCode == 200 ||
                                    response.statusCode == 201) &&
                                    isoExpiry != null) {
                                  final refreshed =
                                  await docCtrl.fetchPrefillDocument(
                                      employeeDocumentId:
                                      prefill.employeeDocumentId);
                                  if (refreshed != null) {
                                    response = await docCtrl
                                        .patchEmployeeDocumentMetadata(
                                      employeeDocumentId:
                                      prefill.employeeDocumentId,
                                      docMetaId: prefill.empDocMetaDataId,
                                      docTypeSetupId: prefill.empDocSetupId,
                                      empId: prefill.employeeId,
                                      documentUrl: refreshed.documentUrl,
                                      uploadDate: DateTime.now()
                                          .toUtc()
                                          .toIso8601String(),
                                      expiryDate: isoExpiry,
                                    );
                                  }
                                }
                              } else {
                                response =
                                await docCtrl.patchEmployeeDocumentMetadata(
                                  employeeDocumentId:
                                  prefill.employeeDocumentId,
                                  docMetaId: prefill.empDocMetaDataId,
                                  docTypeSetupId: prefill.empDocSetupId,
                                  empId: prefill.employeeId,
                                  documentUrl: prefill.documentUrl,
                                  uploadDate:
                                  DateTime.now().toUtc().toIso8601String(),
                                  expiryDate: isoExpiry,
                                );
                              }

                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                Get.back();
                                docCtrl.clearAll();
                                docCtrl.docSubList.clear();
                                docCtrl.prefillData.value = null;
                                docCtrl.fetchDocListDetails(
                                    empId: empId,
                                    approveOnly: 'no',
                                    searchText: 'all');
                                showSucessDialog(
                                    context: context,
                                    message: 'Document updated successfully.',
                                    title: 'Successfully');
                              } else {
                                Get.back();
                                showDocErrorDialog(
                                    context: context,
                                    message: response.message,
                                    title: 'Error');
                              }
                            } finally {
                              isSaving.value = false;
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
            );
          },
        ),
      );
    },
  );
}

/// Static display box matching the dropdown's visual style, minus the
/// chevron — signals "not editable" for Select Document / Select Sub Document.
Widget _readOnlyField({required String label}) {
  return Container(
    width: double.infinity,
    height: 44.h,
    padding: EdgeInsets.symmetric(horizontal: 8.h),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderGrey),
      borderRadius: BorderRadius.circular(6),
      color: Colors.grey.withValues(alpha: 0.08),
    ),
    alignment: Alignment.centerLeft,
    child: Text(
      label.isEmpty ? '--' : label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.normal12style.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColors.defaultTxtGrey,
      ),
    ),
  );
}

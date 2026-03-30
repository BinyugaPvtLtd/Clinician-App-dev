import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/update_documents_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../../core/ui/primary_dropdown.dart';
import '../../../utils/validator.dart';
import '../../calender_section/widget/calender_date_pick_dialog_widget.dart';

void showAddDocumentDialog(BuildContext context,int empId) {
  UpdateDocumentsController docCtrl = Get.put(UpdateDocumentsController());
  TextEditingController expDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  docCtrl.clearAll();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
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

                    // Upload and Capture Buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //   Obx(()=>docCtrl.fileName.isEmpty ? _uploadCaptureOption(
                    //     isRedValidation:  docCtrl.fileNameValidation.value.isEmpty ? false : true,
                    //       label2: docCtrl.fileNameValidation.value.isEmpty ? "Upload document" : docCtrl.fileNameValidation.value,
                    //       icon: AppAsset.upload,
                    //       label: "Upload here",
                    //       onTap: () {
                    //         docCtrl.pickPdf();
                    //         // Handle file picker
                    //       },
                    //     ) : _uploadCaptureOption(
                    //     isRedValidation: false,
                    //     label2: docCtrl.fileName.value,
                    //     icon: AppAsset.upload,
                    //     label: "Upload here",
                    //     onTap: () {
                    //       docCtrl.pickPdf();
                    //       // Handle file picker
                    //     },
                    //   )),
                    //     // Padding(
                    //     //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //     //   child: Text("\nor"),
                    //     // ),
                    //     // _uploadCaptureOption(
                    //     //   label2: "Capture document",
                    //     //   icon: AppAsset.captured,
                    //     //   label: "Capture here",
                    //     //   onTap: () {
                    //     //     // Handle camera capture
                    //     //   },
                    //     // ),
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(   // ← ADD THIS
                          child: Obx(() => docCtrl.fileName.isEmpty
                              ? _uploadCaptureOption(
                            isRedValidation: docCtrl.fileNameValidation.value.isEmpty ? false : true,
                            label2: docCtrl.fileNameValidation.value.isEmpty
                                ? "Upload document"
                                : docCtrl.fileNameValidation.value,
                            icon: AppAsset.upload,
                            label: "Upload here",
                            onTap: () {
                              docCtrl.pickPdf();
                            },
                          )
                              : _uploadCaptureOption(
                            isRedValidation: false,
                            label2: docCtrl.fileName.value,
                            icon: AppAsset.upload,
                            label: "Upload here",
                            onTap: () {
                              docCtrl.pickPdf();
                            },
                          )),
                        ),   // ← CLOSE Expanded
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        return PrimaryDropDown(
                          validator: (value) => Validators.validateRequired(docCtrl.selectedMasterMetaDocName.value,'Document'),
                          contentPadding: EdgeInsets.zero,
                          filled: false,
                          value: docCtrl.selectedMasterMetaDocName.value,
                          buttonStyleData: ButtonStyleData(
                            width: 120.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderGrey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          hintText:  "Select document",
                          // value: addVisitController.selectedRecordName.value == ''
                          //     ? 'Select type'
                          //     : addVisitController.selectedRecordName.value,
                          items: docCtrl.docMetaList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item.documentName ?? '',
                              child: Padding(
                                padding:  EdgeInsets.all(8.h),
                                child: Text(
                                  item.documentName,
                                  style: AppTextStyle.normal12style
                                      .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            for (var a in docCtrl.docMetaList) {
                              if (a.documentName == value) {
                                docCtrl.selectedSubDocId.value = 0;
                                docCtrl.selectedSubDocName.value = '';
                                docCtrl.docSubList.clear();
                                docCtrl.selectedMasterMetaDocName.value = value ?? '';
                                docCtrl.selectedMasterMetaDocId.value = a.employeeDocumentTypeMetaDataId ?? 0;
                                docCtrl.fetchSubDocList(docMetaId:  a.employeeDocumentTypeMetaDataId );
                              }
                            }
                            //

                          },
                        );
                      }),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        return PrimaryDropDown(
                          validator: (value) => Validators.validateRequired(docCtrl.selectedSubDocName.value,'Sub document'),
                          contentPadding: EdgeInsets.zero,
                          filled: false,
                          value: docCtrl.selectedSubDocName.value,
                          buttonStyleData: ButtonStyleData(
                            width: 120.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderGrey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          hintText:  "Select sub document",
                          // value: addVisitController.selectedRecordName.value == ''
                          //     ? 'Select type'
                          //     : addVisitController.selectedRecordName.value,
                          items: docCtrl.docSubList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item.documentName ?? '',
                              child: Padding(
                                padding:  EdgeInsets.all(8.h),
                                child: Text(
                                  item.documentName,
                                  style: AppTextStyle.normal12style
                                      .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.defaultTxtGrey,
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
                            //

                          },
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
                      // validator: (value) => Validators.validateRequired(value!,'Expiry date'),
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
                          // show only in UI
                          expDateController.text = selectedDate;

                          // convert to ISO and store separately
                          final DateTime datePicked = DateFormat("yyyy-MM-dd").parse(selectedDate);
                          docCtrl.expiryIsoDate.value = datePicked.toUtc().toIso8601String(); // ✅ ISO (Z included)
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
                              if (_formKey.currentState!.validate()){
                                if(docCtrl.fileNameValidation.value.isNotEmpty){
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
                                        message: 'Document uploaded successfully',
                                        title: 'Successfully');
                                  }else{

                                  }
                                }else{
                                  docCtrl.fileNameValidation.value = 'Please upload document';
                                  print('Validation failed');
                                }

                                // if(docCtrl.fileName.value.isEmpty){
                                //   docCtrl.fileNameValidation.value = 'Please upload document';
                                //   //return;
                                // }else{
                                //
                                //   // var response = await docCtrl.postUploadDocumentData(
                                //   //     docMetaId: docCtrl.selectedMasterMetaDocId.value,
                                //   //     docTypeSetupId: docCtrl.selectedSubDocId.value,
                                //   //     empId: empId);
                                //   // if(response.statusCode == 200 || response.statusCode == 201){
                                //   //
                                //   // }
                                // }

                              }else{
                                docCtrl.fileNameValidation.value = 'Please upload document';
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

Widget _uploadCaptureOption({
  required String icon,
  required String label,
  required String label2,
  required bool isRedValidation,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      Text(
        label2,
        style: AppTextStyle.bold12style.copyWith(
          color: isRedValidation ? AppColors.redColor : AppColors.defaultTxtGrey,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      customHeight(12.h),
      InkWell(
        onTap: onTap,
        child: DottedBorder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          borderType: BorderType.RRect,
          dashPattern: [6],
          color: Color(0xffBEBEBE),
          radius: Radius.circular(6),
          strokeWidth: 1.5,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60.h,
                width: 62.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
                child: Center(child: Image.asset(icon, height: 40.h)),
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  color: Color(0xff008ABD),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

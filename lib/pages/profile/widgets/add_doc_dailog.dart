import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/update_documents_controller.dart';

void showAddDocumentDialog(BuildContext context) {
  final docCtrl = Get.put(UpdateDocumentsController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
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
                    "Add New Document",
                    style: AppTextStyle.normal16style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Upload and Capture Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Obx(()=>docCtrl.fileName.isEmpty ? _uploadCaptureOption(
                        label2: "Upload document",
                        icon: AppAsset.upload,
                        label: "Upload here",
                        onTap: () {
                          docCtrl.pickDocument();
                          // Handle file picker
                        },
                      ) : _uploadCaptureOption(
                      label2: docCtrl.fileName.value,
                      icon: AppAsset.upload,
                      label: "Upload here",
                      onTap: () {
                        docCtrl.pickDocument();
                        // Handle file picker
                      },
                    )),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Text("\nor"),
                      // ),
                      // _uploadCaptureOption(
                      //   label2: "Capture document",
                      //   icon: AppAsset.captured,
                      //   label: "Capture here",
                      //   onTap: () {
                      //     // Handle camera capture
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Expiry Date Field
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
                    hintText: "Enter Expiry date of document",
                    hintStyle: AppTextStyle.regular12style.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.defaultTxtGrey,
                    ),
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                  ),
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
                            Get.back();
                          },
                        ),
                      ),
                      customWidth(12.w),
                      // Cancel Button
                      Expanded(
                        child: PrimaryButton(
                          onTap: () {
                            Get.back();
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
                        ),
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

Widget _uploadCaptureOption({
  required String icon,
  required String label,
  required String label2,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      Text(
        label2,
        style: AppTextStyle.bold12style.copyWith(
          color: AppColors.defaultTxtGrey,
        ),
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

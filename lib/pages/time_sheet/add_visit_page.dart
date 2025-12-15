import 'package:clinician_app/controller/visit_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/time_sheet/widget/radio_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVisitPage extends StatefulWidget {
  const AddVisitPage({super.key});

  @override
  State<AddVisitPage> createState() => _AddVisitPageState();
}

class _AddVisitPageState extends State<AddVisitPage> {
  VisitController visitController = Get.find<VisitController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppbar(label: "Add Visit"),
            customHeight(10.h),
            Obx(
              () => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56.w,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                AppAsset.avatarImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                            customWidth(10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lucas Jackson',
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                  Text(
                                    'Anxiety',
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        customHeight(18.h),
                        Text("Record Type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryDropDown(
                            value: visitController.statusVal.value,
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

                            items: [
                              ...List.generate(4, (index) {
                                var list = [
                                  'Traveling',
                                  'Break',
                                  'Patient Visit',
                                  'Other Visit',
                                ];
                                return DropdownMenuItem(
                                  value: list[index],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      list[index],
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              visitController.statusVal.value = value ?? "";
                            },
                          ),
                        ),
                        customHeight(18.h),

                        Row(
                          children: [
                            AppRadioButton(
                              groupValue: visitController.recordType.value,
                              value: "SOC",
                              onChanged: (v) {
                                visitController.recordType.value = v!;
                              },
                            ),
                            customWidth(5.w),
                            Text("SOC", style: AppTextStyle.bold12style),
                            customWidth(12.w),
                            AppRadioButton(
                              groupValue: visitController.recordType.value,
                              value: "Revisit",
                              onChanged: (v) {
                                visitController.recordType.value = v!;
                              },
                            ),
                            customWidth(5.w),
                            Text("Revisit", style: AppTextStyle.bold12style),
                            customWidth(12.w),
                            AppRadioButton(
                              groupValue: visitController.recordType.value,
                              value: "Evaluation",
                              onChanged: (v) {
                                visitController.recordType.value = v!;
                              },
                            ),
                            customWidth(5.w),
                            Text("Evaluation", style: AppTextStyle.bold12style),
                          ],
                        ),
                        customHeight(18.h),
                        Text("Visit Type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryDropDown(
                            value: visitController.statusVal.value,
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

                            items: [
                              ...List.generate(4, (index) {
                                var list = [
                                  'Traveling',
                                  'Break',
                                  'Patient Visit',
                                  'Other Visit',
                                ];
                                return DropdownMenuItem(
                                  value: list[index],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      list[index],
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              visitController.statusVal.value = value ?? "";
                            },
                          ),
                        ),
                        customHeight(18.h),
                        Text("Patient Name", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(),
                        customHeight(18.h),
                        Text("Location", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(),
                        customHeight(18.h),
                        Text("Visit Date", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          suffixIcon: Icon(Icons.calendar_month_rounded),
                        ),
                        customHeight(18.h),
                        Row(
                          children: [
                            AppRadioButton(
                              groupValue: visitController.zoneType.value,
                              value: "In",
                              onChanged: (v) {
                                visitController.zoneType.value = v!;
                              },
                            ),
                            customWidth(5.w),
                            Text("In Zone", style: AppTextStyle.bold12style),
                            customWidth(12.w),
                            AppRadioButton(
                              groupValue: visitController.zoneType.value,
                              value: "Out",
                              onChanged: (v) {
                                visitController.zoneType.value = v!;
                              },
                            ),
                            customWidth(5.w),
                            Text("Out Zone", style: AppTextStyle.bold12style),
                            customWidth(12.w),
                          ],
                        ),

                        customHeight(18.h),
                        Text("Visit Rate", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(),
                        customHeight(18.h),
                        Text("Start Time", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          suffixIcon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                        customHeight(18.h),
                        Text("End Time", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(
                          suffixIcon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                        customHeight(18.h),
                        Text("Visit Type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryDropDown(
                            value: visitController.status.value,
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

                            items: [
                              ...List.generate(2, (index) {
                                var list = ['Completed', 'Ongoing'];
                                return DropdownMenuItem(
                                  value: list[index],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      list[index],
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              visitController.status.value = value ?? "";
                            },
                          ),
                        ),
                        customHeight(48.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryOutlinedButton(
                              text: "Cancel",
                              onPressed: () {},
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
                            customWidth(5.w),
                            PrimaryOutlinedButton(
                              text: "Save",
                              onPressed: () {},
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

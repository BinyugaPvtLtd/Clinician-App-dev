import 'package:clinician_app/controller/time_off_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/profile/history_page.dart';
import 'package:clinician_app/pages/time_sheet/widget/radio_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeOffPage extends StatefulWidget {
  const TimeOffPage({super.key});

  @override
  State<TimeOffPage> createState() => _TimeOffPageState();
}

class _TimeOffPageState extends State<TimeOffPage> {
  TimeController timeController = Get.put(TimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "Time Off",
              trailing: InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Get.to(() => HistoryPage());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        size: 20,
                        color: AppColors.defaultTxtGrey,
                      ),
                      customWidth(5.w),
                      Text(
                        "View history ",
                        style: TextStyle(color: AppColors.defaultTxtGrey),
                      ),
                    ],
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
            customHeight(15.h),
            Obx(
              () => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryAppColor.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Available Time Off",
                                  style: AppTextStyle.bold14style.copyWith(
                                    color: AppColors.primaryAppColor,
                                  ),
                                ),
                              ),
                              customWidth(10.w),
                              Text(
                                "36.0 hours",
                                style: AppTextStyle.bold14style.copyWith(
                                  color: AppColors.primaryAppColor,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        customHeight(24.h),
                        Text(
                          "Request time off",
                          style: AppTextStyle.bold14style.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        customHeight(20.h),
                        Text("Full Name", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        PrimaryTextField(hintText: "Lucas Jackson"),
                        customHeight(18.h),
                        Text("Time off type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryDropDown(
                            value: timeController.timeOfType.value,
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
                                var list = ['Vacation', 'Break'];
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
                              timeController.timeOfType.value = value ?? "";
                            },
                          ),
                        ),
                        customHeight(18.h),
                        Text("Leave Type", style: AppTextStyle.bold14style),
                        customHeight(4.h),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryDropDown(
                            value: timeController.leaveType.value,
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
                              ...List.generate(3, (index) {
                                var list = [
                                  'One day',
                                  'Multi days',
                                  'Half day',
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
                              timeController.leaveType.value = value ?? "";
                            },
                          ),
                        ),

                        if (timeController.leaveType.value == "One day") ...[
                          customHeight(18.h),
                          Text("Date", style: AppTextStyle.bold14style),
                          customHeight(4.h),

                          PrimaryTextField(
                            hintText: "05/21/2025",
                            suffixIcon: Icon(Icons.calendar_month_rounded),
                          ),
                        ],
                        if (timeController.leaveType.value == "Multi days") ...[
                          customHeight(18.h),
                          Text("Date", style: AppTextStyle.bold14style),
                          customHeight(4.h),

                          Row(
                            children: [
                              Expanded(
                                child: PrimaryTextField(
                                  hintText: "05/21/2025",
                                  suffixIcon: Icon(
                                    Icons.calendar_month_rounded,
                                  ),
                                ),
                              ),
                              customWidth(6.w),
                              Text(
                                "To",
                                style: AppTextStyle.bold12style.copyWith(
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                              customWidth(6.w),
                              Expanded(
                                child: PrimaryTextField(
                                  hintText: "05/21/2025",
                                  suffixIcon: Icon(
                                    Icons.calendar_month_rounded,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (timeController.leaveType.value == "Half day") ...[
                          customHeight(18.h),
                          Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                  AppRadioButton(
                                    color: AppColors.primaryAppColor,
                                    groupValue: timeController.recordType.value,
                                    value: "SOC",
                                    onChanged: (v) {
                                      timeController.recordType.value = v!;
                                    },
                                  ),
                                  customWidth(5.w),
                                  Text(
                                    "First half",
                                    style: AppTextStyle.bold14style.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  customWidth(20.w),
                                  AppRadioButton(
                                    color: AppColors.primaryAppColor,
                                    groupValue: timeController.recordType.value,
                                    value: "Revisit",
                                    onChanged: (v) {
                                      timeController.recordType.value = v!;
                                    },
                                  ),
                                  customWidth(5.w),
                                  Text(
                                    "Second half",
                                    style: AppTextStyle.bold14style.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],

                        customHeight(18.h),
                        Text(
                          "Reason for time off (optional) ",
                          style: AppTextStyle.bold14style,
                        ),
                        customHeight(4.h),
                        PrimaryTextField(hintText: "Enter your reason"),
                        customHeight(24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: PrimaryOutlinedButton(
                                text: "Cancel",
                                onPressed: () {},
                                fillColor: Colors.white,

                                textStyle: AppTextStyle.bold14style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryAppColor,
                                ),
                                borderWidth: 1.5,
                                width: double.infinity,
                                radius: 6,
                                height: 30.h,
                              ),
                            ),
                            customWidth(10.w),
                            Expanded(
                              child: PrimaryOutlinedButton(
                                text: "Submit",
                                onPressed: () {},
                                fillColor: AppColors.primaryAppColor,

                                textStyle: AppTextStyle.normal14style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                borderWidth: 1.5,
                                width: double.infinity,
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

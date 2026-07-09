import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/timesheet_controller.dart';
import '../../model/timesheet/timesheet_model.dart';
import 'edit_visit_page.dart';

class VisitPage extends StatefulWidget {

  const VisitPage({super.key,});

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  TimeSheetController timeSheetController = Get.put(TimeSheetController());
  // @override
  // void dispose() {
  //   if (Get.isRegistered<TimeSheetController>()) {
  //     Get.delete<TimeSheetController>(); // triggers onClose()
  //   }
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                Obx(() {
                  return Text(
                    timeSheetController.formatSmartDate(timeSheetController.selectedDate.value),
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  );}),
                Spacer(),
                PrimaryOutlinedButton(
                  text: "Choose Date",
                  onPressed: () async{
                    final String? selectedDate =
                    await Get.dialog(CalenderDatePickDialogWidget());

                    if (selectedDate != null) {
                      timeSheetController.selectedDate.value = selectedDate;
                      timeSheetController.formatSmartDate(timeSheetController.selectedDate.value);
                    }

                  },
                  isIconStart: true,
                  icon: Icon(Icons.calendar_month_sharp, color: AppColors.grey),
                  textStyle: AppTextStyle.regular10style.copyWith(
                    color: AppColors.grey,
                  ),
                  buttonColor: AppColors.grey,
                  borderWidth: 1,
                  width: 120.h,
                  height: 28.h,
                  radius: 6,
                ),
              ],
            ),

            Obx(() {
              if (timeSheetController.isInitialLoading.value &&
                  timeSheetController.timeSheetRecord.isEmpty) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  )),
                );
              }
              if (timeSheetController.timeSheetRecord.isEmpty) {
                return const Expanded(
                  child: Center(child: Text("No Records Found!")),
                );
              }
              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: timeSheetController.timeSheetRecord.length,
                  itemBuilder: (context, index) {
                    final item = timeSheetController.timeSheetRecord[index];
                    final visitTiming = timeSheetController.formatTimeRange(
                        timeSheetController.timeSheetRecord[index].visiteDateTimeFrom,
                        timeSheetController.timeSheetRecord[index].visitDateTimeTo);
                    return InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        item.recordTypeName == "Case Conference" || item.recordTypeName == "Miscellaneous" ?
                        Get.to(
                              () => EditVisitPage(item: item, visitStatus: item.recordTypeName!,),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ): null;
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: item.status == 'Completed' ? AppColors.chatGreenColor : AppColors.appYellowColor.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                item.status,
                                style: AppTextStyle.normal10style.copyWith(
                                  color: item.status == 'Completed' ? AppColors.greenColor : AppColors.warningBackgColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          customHeight(6.h),
                          Row(
                            children: [
                              Container(
                                width: 56.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: item.patientImgUrl.isEmpty ?
                                Image.asset(
                                  AppAsset.profilePicImg,
                                  fit: BoxFit.cover,
                                ):Image.network(
                                  item.patientImgUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              customWidth(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.patientName.isEmpty ?  item.recordTypeName : item.patientName,
                                            style: AppTextStyle.normal12style.copyWith(
                                              color: AppColors.textGreyColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          visitTiming,
                                          style: AppTextStyle.normal12style.copyWith(
                                            color: AppColors.textGreyColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      item.location,
                                      style: AppTextStyle.normal10style.copyWith(
                                        color: AppColors.textGreyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
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
            }
            ),
          ],
        ),
      ),
    );
  }
}
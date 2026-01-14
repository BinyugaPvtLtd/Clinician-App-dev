import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/timesheet_controller.dart';
import '../../model/timesheet/timesheet_model.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

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
                    child: Center(child: Text("No Records Found")),
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
                          timeSheetController.timeSheetRecord[index].visitDateTimeFrom,
                          timeSheetController.timeSheetRecord[index].visitDateTimeto);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: item.isVisitCompleted ?AppColors.chatGreenColor:AppColors.appYellowColor.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                item.isVisitCompleted ? "Completed" : "Ongoing",
                                style: AppTextStyle.normal10style.copyWith(
                                  color:  item.isVisitCompleted ? AppColors.greenColor : AppColors.warningBackgColor,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          customHeight(6.h),
                          Row(
                            children: [
                              !item.onWay
                                  ? item.ptImage.isEmpty ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage:AssetImage(AppAsset.profilePicImg),
                                  ) :CircleAvatar(
                                radius: 30,
                                backgroundImage:NetworkImage(item.ptImage),
                                backgroundColor: Colors.transparent,
                              )
                                  : Container(
                                    height: 50.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(AppAsset.carSvgIcon),
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                !item.onWay
                                                    ? "${item.ptFirstName} ${item.ptLastName}"
                                                    : "Going for Office Visit",
                                                style: AppTextStyle.normal12style
                                                    .copyWith(
                                                      color:
                                                          AppColors.textGreyColor,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              if (index.isEven)
                                                Text(
                                                  item.fkPtDiagnosisName,
                                                  style: AppTextStyle.normal12style
                                                      .copyWith(
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          visitTiming,
                                          style: AppTextStyle.normal12style
                                              .copyWith(
                                                color: AppColors.textGreyColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${item.ptAddress}",
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

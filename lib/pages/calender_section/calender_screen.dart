import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/calender_section/appointment_list_widget.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:clinician_app/pages/home/widget/home_appbar_widget.dart';
import 'package:clinician_app/pages/request/visit_detail_page.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../controller/calender_controller.dart';
import '../../controller/profile_controller.dart';
import '../../model/calender/calender_model.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalenderListController controller = Get.put(CalenderListController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    controller.fetchCalenderListDetails(status: 'pending', date: controller.formattedDate);
    controller.fetchCalenderDetails(dateFrom: "2025-12-31", dateTo: "2025-12-31", empIds: "51");
    super.initState();
  }
  DateTime? _parsePickedDate(dynamic result) {
    if (result == null) return null;
    if (result is DateTime) return result;
    if (result is String) {
      // Expecting "yyyy-MM-dd"
      return DateTime.tryParse(result);
    }
    return null;
  }
  void _fetchForCurrentDate() {
    controller.fetchCalenderListDetails(
      status: 'pending',
      date: controller.formattedDate,
    );
  }
  void _fetchForCurrentCalenderDate() {
    controller.fetchCalenderDetails(
        dateFrom: controller.formattedDate, dateTo: controller.formattedDate, empIds: profileController.employeeId.toString()
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ChatFABWidget(),
      body: Column(
        children: [
          // ------ header --------
          HomeAppbarWidget(),
          customHeight(10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(2, (index) {
                        return Obx(
                          () => InkWell(
                            onTap: () {
                              controller.contentTypeInx.value = index;
                            },
                            child: Container(
                              width: 83.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    index == controller.contentTypeInx.value
                                        ? AppColors.primaryAppColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                index == 0 ? 'List' : 'Calender',
                                style: AppTextStyle.normal12style.copyWith(
                                  fontWeight:
                                      index == controller.contentTypeInx.value
                                          ? FontWeight.w600
                                          : FontWeight.w300,
                                  color:
                                      index == controller.contentTypeInx.value
                                          ? Colors.white
                                          : AppColors.defaultTxtGrey,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  customHeight(10.h),
                  // ----- date change ---------
                  SizedBox(
                    height: 34.h,
                    child: Row(
                      children: [
                        customWidth(33.w),
                        Spacer(),
                        InkWell(
                          onTap:  () {
                            controller.changeDate(-1);
                            controller.calController.value.displayDate = controller.currentDate.value; // ✅ update calendar
                            _fetchForCurrentDate();
                            _fetchForCurrentCalenderDate();
                          },
                          child: Container(
                            width: 32.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.backGrndGrey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.r),
                                bottomLeft: Radius.circular(6.r),
                              ),
                            ),
                            child: SvgPicture.asset(AppAsset.leftArrowSvgIcon),
                          ),
                        ),
                        customWidth(10.w),
                        Container(
                          height: 32.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 8.h,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.backGrndGrey,
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 1.r,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Obx(
                            () => Text(
                              CommonMethods.getFormattedDay(controller.currentDate.value),
                              style: AppTextStyle.normal12style.copyWith(
                                color: AppColors.defaultTxtGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        customWidth(10.w),
                        InkWell(
                          onTap:  () {
                            controller.changeDate(1);
                            controller.calController.value.displayDate = controller.currentDate.value; // ✅ update calendar
                            _fetchForCurrentDate();
                            _fetchForCurrentCalenderDate();
                          },
                          child: Container(
                            width: 32.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.backGrndGrey,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.r),
                                bottomRight: Radius.circular(6.r),
                              ),
                            ),
                            child: SvgPicture.asset(AppAsset.rightArrowSvgIcon),
                          ),
                        ),
                        Spacer(),
                        customWidth(5.w),
                        InkWell(
                          onTap:() async{
                            final result = await Get.dialog(
                              CalenderDatePickDialogWidget(),
                            );

                            final picked = _parsePickedDate(result);
                            if (picked == null) return;

                            controller.currentDate.value = picked;

                            // If you want calendar to follow date in calendar mode
                            if (controller.contentTypeInx.value == 1) {
                              controller.calController.value.displayDate = picked;
                            }

                            _fetchForCurrentDate();
                            _fetchForCurrentCalenderDate();
                          },
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.borderGrey),
                            ),
                            child: SvgPicture.asset(
                              AppAsset.pickScheduleSvgIcon,
                              width: 14.w,
                              colorFilter: AppColors.defaultTxtGrey.getSvgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customHeight(10.h),
                  Obx(
                    () => Visibility(
                      visible: controller.contentTypeInx.value == 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            controller.formattedDateReadable,
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w300,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                          customHeight(10.h),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      if (controller.isListLoading.value) {
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryAppColor,
                            ),
                          ),
                        );
                      }

                      final items = controller.calenderListModel.value.visits;
                      // if (items.isEmpty) {
                      //   return const Expanded(
                      //     child: Center(child: Text("No Records Found!")),
                      //   );
                      // }
                      return  Expanded(
                          child:controller.contentTypeInx.value == 0
                              ? items.isEmpty ? Center(child: Text("No Records Found!")) :
                          ListView.builder(
                            itemCount: controller.calenderListModel.value.visits.length,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20.h),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var visitListData = controller.calenderListModel.value.visits[index];
                              return InkWell(
                                onTap: () {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    Get.to(
                                          () => VisitDetailPage(
                                        visitId: visitListData.visitId,
                                      ),
                                    );
                                  });
                                },
                                child: AppointmentListWidget(dataList: visitListData,),
                              );
                            },
                          )
                              :  Obx(() {
                        // ✅ This log confirms Calendar widget rebuilds
                        debugPrint("📅 Calendar rebuild | visits=${controller.visitList.length} "
                            "appointments=${controller.calendarAppointments.length}");

                        return SfCalendar(
                          controller: controller.calController.value,
                          cellBorderColor: Colors.transparent,
                          view: CalendarView.day,
                          allowViewNavigation: false,
                          headerHeight: 0,
                          // onViewChanged: (viewChangedDetails) {
                          //   Future.delayed(const Duration(milliseconds: 10), () {
                          //     final visibleDate = viewChangedDetails.visibleDates.first;
                          //     controller.currentDate.value = visibleDate;
                          //   });
                          // },
                          monthViewSettings: const MonthViewSettings(),
                          viewHeaderStyle: ViewHeaderStyle(
                            dayTextStyle: AppTextStyle.normal12style.copyWith(
                              color: AppColors.defaultTxtGrey,
                            ),
                            dateTextStyle: AppTextStyle.regular16style.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                          timeSlotViewSettings: TimeSlotViewSettings(
                            timeFormat: 'HH\na',
                            timeTextStyle: AppTextStyle.normal12style.copyWith(
                              color: AppColors.defaultTxtGrey,
                            ),
                            timeIntervalHeight: 44.h,
                            startHour: 0,
                            endHour: 24,
                          ),
                          firstDayOfWeek: 1,

                          // ✅ use RxList appointments
                          dataSource: MeetingDataSource(controller.calendarAppointments),

                          appointmentBuilder: customAppointmentBuilder,
                        );
                      })

                      );
                   }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


DateTime _safeParse(String value) {
  // API example: "2026-01-02T04:00:00.000Z"
  // DateTime.parse handles it. If empty -> fallback now.
  try {
    if (value.trim().isEmpty) return DateTime.now();
    return DateTime.parse(value).toLocal();
  } catch (_) {
    return DateTime.now();
  }
}

// String _visitTypeLabel(int visitType) {
//   // change labels as per your need
//   switch (visitType) {
//     case 1:
//       return "Visit";
//     case 2:
//       return "Follow-up";
//     default:
//       return "Type $visitType";
//   }
// }

List<Appointment> getAppointments({required List<VisitModelData> dataList}) {
  debugPrint("✅ getAppointments called, length=${dataList.length}");

  return List<Appointment>.generate(dataList.length, (index) {
    final item = dataList[index];

    final start = _safeParse(item.visiteDateTimeFrom);
    final end = _safeParse(item.visitDateTimeTo);

    final fixedStart = start.isBefore(end) ? start : end;
    final fixedEnd = start.isBefore(end)
        ? end
        : start.add(const Duration(minutes: 30));

    debugPrint(
      "✅ [$index] ${item.employee.firstName} "
          "Start=$fixedStart End=$fixedEnd",
    );
    Color hexToColor(String hex) {
      hex = hex.replaceAll("#", "").trim();

      if (hex.length == 6) {
        hex = "FF$hex"; // add full opacity
      }

      return Color(int.parse(hex, radix: 16));
    }

    return Appointment(
      startTime: fixedStart,
      endTime: fixedEnd,
      subject:
      '${item.employee.firstName} ${item.employee.lastName}',
          // '\n${_visitTypeLabel(item.visitType)}',
      color: hexToColor(item.employeeType.color),
    );
  });
}



Widget customAppointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
    ) {
  final Appointment appointment = details.appointments.first;

  return Container(
    height: 44,
    decoration: BoxDecoration(
      color: appointment.color.withOpacity(0.25),
      borderRadius: BorderRadius.circular(8),
      border: Border(left: BorderSide(color: appointment.color, width: 4)),
    ),
    child: Row(
      children: [
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            appointment.subject,
            style: TextStyle(
              color: appointment.color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        // your icon here
        SvgPicture.asset(AppAsset.calenderEventInfoSvgIcon),
        const SizedBox(width: 12),
      ],
    ),
  );
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

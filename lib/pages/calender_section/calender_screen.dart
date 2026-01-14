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

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalenderListController controller = Get.put(CalenderListController());

  @override
  void initState() {
    // TODO: implement initState
    controller.fetchCalenderListDetails(status: 'pending', date: controller.formattedDate);
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
                          onTap: () {
                            controller.changeDate(-1);
                            _fetchForCurrentDate();
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
                          onTap: () {
                            controller.changeDate(1);
                            _fetchForCurrentDate();
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
                          onTap: () async{
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
                              ? items.isEmpty ? Center(child: Text("No Records Found!")) : ListView.builder(
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
                              : SfCalendar(
                            // key: ValueKey('sf_calender'),
                            controller: controller.calController.value,
                            cellBorderColor: Colors.transparent,
                            view: CalendarView.day,
                            headerHeight: 0,

                            onViewChanged: (viewChangedDetails) {
                              Future.delayed(
                                Duration(milliseconds: 10),
                                    () {
                                  DateTime visibleDate =
                                      viewChangedDetails.visibleDates.first;
                                  controller.currentDate.value = visibleDate;
                                },
                              );
                            },
                            monthViewSettings: MonthViewSettings(),
                            viewHeaderStyle: ViewHeaderStyle(
                              dayTextStyle: AppTextStyle.normal12style
                                  .copyWith(
                                color: AppColors.defaultTxtGrey,
                              ),
                              dateTextStyle: AppTextStyle.regular16style
                                  .copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.defaultTxtGrey,
                              ),
                            ),
                            timeSlotViewSettings: TimeSlotViewSettings(
                              timeFormat: 'h\na',
                              timeTextStyle: AppTextStyle.normal12style
                                  .copyWith(
                                color: AppColors.defaultTxtGrey,
                              ),
                              timeIntervalHeight: 44.h,
                              startHour: 8,
                              endHour: 16,
                            ),
                            firstDayOfWeek: 1,
                            dataSource: MeetingDataSource(
                              getAppointments(),
                            ),
                            appointmentBuilder: customAppointmentBuilder,
                          ));
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

List<Appointment> getAppointments() {
  return <Appointment>[
    Appointment(
      startTime: DateTime.now().copyWith(day: DateTime.now().day - 1, hour: 12),
      endTime: DateTime.now().copyWith(day: DateTime.now().day - 1, hour: 14),
      subject: 'John\nPT',
      color: Colors.lightBlueAccent,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(hour: 11),
      endTime: DateTime.now().copyWith(hour: 12),
      subject: 'Thomus',
      color: Colors.amberAccent,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(hour: 9),
      endTime: DateTime.now().copyWith(hour: 10),
      subject: 'Thomus',
      color: Colors.purpleAccent,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(day: DateTime.now().day + 1, hour: 12),
      endTime: DateTime.now().copyWith(day: DateTime.now().day + 1, hour: 13),
      subject: 'Thomus',
      color: Colors.amberAccent,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(day: DateTime.now().day - 2, hour: 12),
      endTime: DateTime.now().copyWith(day: DateTime.now().day - 2, hour: 13),
      subject: 'Eva',
      color: Colors.purpleAccent.shade100,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(day: DateTime.now().day - 2, hour: 9),
      endTime: DateTime.now().copyWith(day: DateTime.now().day - 2, hour: 11),
      subject: 'Williams',
      color: Colors.redAccent.shade100,
    ),
    Appointment(
      startTime: DateTime.now().copyWith(day: DateTime.now().day - 3, hour: 9),
      endTime: DateTime.now().copyWith(day: DateTime.now().day - 3, hour: 14),
      subject: 'John',
      color: Colors.blueAccent.shade100,
    ),
    Appointment(
      startTime: DateTime(2025, 3, 20, 2, 30),
      endTime: DateTime(2025, 3, 20, 3, 30),
      subject: 'James',
      color: Colors.blueAccent,
    ),
  ];
}

Widget customAppointmentBuilder(
  BuildContext context,
  CalendarAppointmentDetails details,
) {
  final Appointment appointment = details.appointments.first;
  return Container(
    // width: 63.w,
    height: 44.h,
    decoration: BoxDecoration(
      color: appointment.color.withValues(alpha: 0.25),
      borderRadius: BorderRadius.circular(8),
      border: Border(left: BorderSide(color: appointment.color, width: 4)),
    ),
    child: Row(
      children: [
        customWidth(6.w),
        Text(
          appointment.subject,
          style: TextStyle(
            color: appointment.color,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SvgPicture.asset(AppAsset.calenderEventInfoSvgIcon),
        customWidth(12.w),
      ],
    ),
  );
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

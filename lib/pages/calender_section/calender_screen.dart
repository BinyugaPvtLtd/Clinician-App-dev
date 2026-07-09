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
  final CalenderListController controller = Get.put(CalenderListController());
  final ProfileController profileController = Get.put(ProfileController());

  String get _empId =>
      profileController.employeeIdByEmail.value.employeeId.toString();

  static const String _status = 'pending';

  @override
  void initState() {
    super.initState();

    // ✅ keep calendar controller in sync with current date
    controller.calController.value.displayDate = controller.currentDate.value;

    // ✅ Start continue listening (poll every 2 seconds)
    controller.startContinueListening(
      status: _status,
      empIds: _empId,
    );
  }

  @override
  void dispose() {
    // ✅ stop polling to avoid memory leaks
    controller.stopContinueListening();
    super.dispose();
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

  void _refreshNow() {
    // ✅ instant refresh (no need to wait for next 2-second tick)
    controller.refreshNow(status: _status, empIds: _empId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ChatFABWidget(),
      body: SafeArea(
        child: Column(
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
            
                                // Optional: keep calendar view synced if switching to Calendar tab
                                if (index == 1) {
                                  controller.calController.value.displayDate =
                                      controller.currentDate.value;
                                }
                              },
                              child: Container(
                                width: 83.w,
                                height: 36.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: index == controller.contentTypeInx.value
                                      ? AppColors.primaryAppColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  index == 0 ? 'List' : 'Calender',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontWeight: index == controller.contentTypeInx.value
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    color: index == controller.contentTypeInx.value
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
                          const Spacer(),
            
                          // PREVIOUS DAY
                          InkWell(
                            onTap: () {
                              controller.changeDate(-1);
                              controller.calController.value.displayDate =
                                  controller.currentDate.value;
            
                              _refreshNow();
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
            
                          // CURRENT DATE LABEL
                          Container(
                            height: 35.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.w,
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
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Obx(
                                  () => Text(
                                CommonMethods.getFormattedDay(
                                    controller.currentDate.value),
                                style: AppTextStyle.normal12style.copyWith(
                                  color: AppColors.defaultTxtGrey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
            
                          customWidth(10.w),
            
                          // NEXT DAY
                          InkWell(
                            onTap: () {
                              controller.changeDate(1);
                              controller.calController.value.displayDate =
                                  controller.currentDate.value;
            
                              _refreshNow();
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
            
                          const Spacer(),
                          customWidth(5.w),
            
                          // DATE PICKER
                          InkWell(
                            onTap: () async {
                              final result = await Get.dialog(
                                CalenderDatePickDialogWidget(),
                              );
            
                              final picked = _parsePickedDate(result);
                              if (picked == null) return;
            
                              controller.currentDate.value = picked;
            
                              if (controller.contentTypeInx.value == 1) {
                                controller.calController.value.displayDate = picked;
                              }
            
                              _refreshNow();
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
            
                    // list mode date label
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
            
                    // CONTENT
                    Obx(
                          () {
                        if (controller.isListLoading.value) {
                          return const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryAppColor,
                              ),
                            ),
                          );
                        }
            
                        final items = controller.calenderListModel.value.visits;
            
                        return Expanded(
                          child: controller.contentTypeInx.value == 0
                              ? (items.isEmpty
                              ? const Center(child: Text("No Records Found!"))
                              : ListView.builder(
                            itemCount: items.length,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20.h),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final visitListData = items[index];
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Get.to(
                                          () => VisitDetailPage(
                                        visitId: visitListData.visitId,
                                            employeeTypeId: items[index].employeeTypeId,
                                            visitStatus: 'accepted',

                                      ),
                                    );
                                  });
                                },
                                child: AppointmentListWidget(
                                  dataList: visitListData,
                                ),
                              );
                            },
                          ))
                              : Obx(() {
                            debugPrint(
                              "📅 Calendar rebuild | visits=${controller.visitList.length} "
                                  "appointments=${controller.calendarAppointments.length}",
                            );
            
                            return SfCalendar(
                              controller: controller.calController.value,
                              cellBorderColor: Colors.transparent,
                              view: CalendarView.day,
                              allowViewNavigation: false,
                              headerHeight: 0,
                              monthViewSettings: const MonthViewSettings(),
                              viewHeaderStyle: ViewHeaderStyle(
                                dayTextStyle:
                                AppTextStyle.normal12style.copyWith(
                                  color: AppColors.defaultTxtGrey,
                                ),
                                dateTextStyle:
                                AppTextStyle.regular16style.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                              timeSlotViewSettings: TimeSlotViewSettings(
                                timeFormat: 'HH\na',
                                timeTextStyle:
                                AppTextStyle.normal12style.copyWith(
                                  color: AppColors.defaultTxtGrey,
                                ),
                                timeIntervalHeight: 44.h,
                                startHour: 0,
                                endHour: 24,
                              ),
                              firstDayOfWeek: 1,
                              dataSource: MeetingDataSource(
                                controller.calendarAppointments,
                              ),
                              appointmentBuilder: customAppointmentBuilder,
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================
// helpers (unchanged)
// ==========================
DateTime _safeParse(String value) {
  try {
    if (value.trim().isEmpty) return DateTime.now();
    return DateTime.parse(value).toLocal();
  } catch (_) {
    return DateTime.now();
  }
}

List<Appointment> getAppointments({required List<VisitModelData> dataList}) {
  debugPrint("✅ getAppointments called, length=${dataList.length}");

  return List<Appointment>.generate(dataList.length, (index) {
    final item = dataList[index];

    final start = _safeParse(item.visiteDateTimeFrom);
    final end = _safeParse(item.visitDateTimeTo);

    final fixedStart = start.isBefore(end) ? start : end;
    final fixedEnd =
    start.isBefore(end) ? end : start.add(const Duration(minutes: 30));

    Color hexToColor(String hex) {
      hex = hex.replaceAll("#", "").trim();
      if (hex.length == 6) hex = "FF$hex";
      return Color(int.parse(hex, radix: 16));
    }

    return Appointment(
      startTime: fixedStart,
      endTime: fixedEnd,
      subject: '${item.employee.firstName} ${item.employee.lastName}',
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
        const Spacer(),
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

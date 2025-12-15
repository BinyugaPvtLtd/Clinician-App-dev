import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/pages/calender_section/appointment_list_widget.dart';
import 'package:clinician_app/pages/calender_section/calender_screen.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:clinician_app/pages/request/visit_detail_page.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PendingVisits extends StatefulWidget {
  const PendingVisits({super.key});

  @override
  State<PendingVisits> createState() => _PendingVisitsState();
}

class _PendingVisitsState extends State<PendingVisits> {
  RxInt contentTypeInx = 0.obs;
  Rx<DateTime> currentDate = DateTime.now().obs;
  CalendarController calController = CalendarController();

  changeDate(int day) {
    currentDate.value = currentDate.value.add(Duration(days: day));
    if (contentTypeInx.value == 1) {
      calController.displayDate = currentDate.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "Pending Visit Notes",

              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
            customHeight(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 34.h,
                child: Row(
                  children: [
                    customWidth(33.w),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        changeDate(-1);
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
                          CommonMethods.getFormattedDay(currentDate.value),
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
                        changeDate(1);
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
                      onTap: () {
                        Get.dialog(CalenderDatePickDialogWidget());
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
            ),
            customHeight(10.h),
            Obx(
              () => Visibility(
                visible: contentTypeInx.value == 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'January 5,2025',
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 20.h),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => VisitDetailPage());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.2.r,
                              offset: Offset(0, 1.2.w),
                              color: Colors.black.withValues(alpha: 0.25),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 97.w,
                                  height: 20.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.appYellowColor.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                  child: Text(
                                    'Evaluation',
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.appYellowColor,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 130.w,
                                  height: 23.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.appYellowColor.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                  child: Text(
                                    '9.00AM-10.00AM',
                                    style: AppTextStyle.normal14style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            customHeight(7.5.h),
                            Row(
                              children: [
                                customWidth(20.w),
                                Container(
                                  width: 56.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    AppAsset.avatarImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                customWidth(10.w),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lucas Jackson',
                                              style: AppTextStyle.normal12style
                                                  .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors
                                                            .defaultTxtGrey,
                                                  ),
                                            ),
                                            Text(
                                              'Anxiety',
                                              style: AppTextStyle.normal12style
                                                  .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                    color:
                                                        AppColors
                                                            .defaultTxtGrey,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '\$55.00',
                                        style: AppTextStyle.normal12style
                                            .copyWith(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryAppColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                customWidth(20.w),
                              ],
                            ),
                            customHeight(10.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

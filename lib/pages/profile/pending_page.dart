import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:clinician_app/pages/request/visit_detail_page.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../controller/profile_controller.dart';

class PendingVisits extends StatefulWidget {
  const PendingVisits({super.key});

  @override
  State<PendingVisits> createState() => _PendingVisitsState();
}

class _PendingVisitsState extends State<PendingVisits> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.fetchPatientNoteRecord(
      empId: controller.employeeIdByEmail.value.employeeId,
      date: controller.formattedDate, // should be yyyy-MM-dd from controller getter
    );
  }

  void _fetchForCurrentDate() {
    controller.fetchPatientNoteRecord(
      empId: controller.employeeIdByEmail.value.employeeId,
      date: controller.formattedDate,
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const Divider(),
            customHeight(10.h),

            // ✅ No Obx here (was causing "improper use" because no Rx was read in this builder)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 34.h,
                child: Row(
                  children: [
                    customWidth(33.w),
                    const Spacer(),

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
                      // ✅ Only Obx where Rx is actually read
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

                    const Spacer(),
                    customWidth(5.w),

                    InkWell(
                      onTap: () async {
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
            ),

            customHeight(10.h),

            // Example: show some header text only when list mode selected
            Obx(
                  () => Visibility(
                visible: controller.contentTypeInx.value == 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ✅ Use current date instead of hardcoded string
                      Text(
                        controller.formattedDateReadable, // yyyy-MM-dd
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

            // Main list area
            Obx(() {
              if (controller.isEmployeeLoading.value) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryAppColor,
                    ),
                  ),
                );
              }

              final items = controller.patientVisitNoteData.value.items;
              if (items.isEmpty) {
                return const Expanded(
                  child: Center(child: Text("No Records Found!")),
                );
              }

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    itemCount: items.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 20.h),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // TODO: You can bind real data from items[index] here
                      var visitsItem = items[index];
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Get.to(() => VisitDetailPage(
                              visitId: visitsItem.visitId,
                              employeeTypeId: visitsItem.employeeTypeId,
                              visitStatus: visitsItem.isVisitAccepted == true ? 'accepted': 'pending',
                            ));
                          });
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
                                      color: AppColors.appYellowColor.withValues(alpha: 0.3),
                                    ),
                                    child: Text(
                                      visitsItem.visitType.name,
                                      style: AppTextStyle.normal12style.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.appYellowColor,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 130.w,
                                    height: 23.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.appYellowColor.withValues(alpha: 0.3),
                                    ),
                                    child: Text(
                                      '${visitsItem.visiteDateTimeFrom}-${visitsItem.visitDateTimeTo}',
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
                                  visitsItem.imageUrl.isEmpty ? CircleAvatar(
                                    radius: 28,
                                    backgroundImage:AssetImage(AppAsset.profilePicImg),
                                  ) :CircleAvatar(
                                    radius: 28,
                                    backgroundImage:NetworkImage(visitsItem.imageUrl),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  // Container(
                                  //   width: 54.w,
                                  //   decoration: const BoxDecoration(shape: BoxShape.circle),
                                  //   clipBehavior: Clip.hardEdge,
                                  //   child: visitsItem.imageUrl.isEmpty ? Image.asset(
                                  //     AppAsset.profilePicImg,
                                  //     fit: BoxFit.cover,
                                  //   ):Image.network(
                                  //     visitsItem.imageUrl,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  customWidth(10.w),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                visitsItem.patientName,
                                                style: AppTextStyle.normal12style.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.defaultTxtGrey,
                                                ),
                                              ),
                                              Text(
                                                visitsItem.primaryDiagnosis.name,
                                                style: AppTextStyle.normal12style.copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  color: AppColors.defaultTxtGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '\$${visitsItem.visitCharge}',
                                          style: AppTextStyle.normal12style.copyWith(
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
              );
            }),
          ],
        ),
      ),
    );
  }
}

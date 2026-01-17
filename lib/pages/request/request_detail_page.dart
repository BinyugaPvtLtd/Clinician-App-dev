import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:clinician_app/pages/request/widget/accept_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reject_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reschedule_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/schedule_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RequestDetailPage extends StatefulWidget {
  const RequestDetailPage({super.key, required this.data});
  final RequestDataModel data;

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            customHeight(14.h),
            Row(
              children: [
                customWidth(24.w),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.defaultTxtGrey,
                  ),
                ),
                customWidth(15.w),
                Text(
                  'Visit Details',
                  style: AppTextStyle.normal14style.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultTxtGrey,
                  ),
                ),
              ],
            ),
            customHeight(14.h),
            (widget.data.noteTxt ?? "").isNotEmpty
                ? Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColors.warningBackgColor),
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    widget.data.noteTxt ?? "",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal10style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
                : CommonDivider(),
            customHeight(9.h),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
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
                        Column(
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
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.backGrndGrey,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 4.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '1x55=',
                                style: AppTextStyle.normal10style.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              customWidth(5.w),
                              Text(
                                '\$55.00',
                                style: AppTextStyle.normal10style.copyWith(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.navyBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       '2x4    | 2.5 miles',
                        //       style: AppTextStyle.normal12style.copyWith(
                        //         fontWeight: FontWeight.w600,
                        //         color: AppColors.defaultTxtGrey,
                        //       ),
                        //     ),
                        //     Text(
                        //       '\$55.00',
                        //       style: AppTextStyle.normal12style.copyWith(
                        //         fontSize: 20.sp,
                        //         fontWeight: FontWeight.w600,
                        //         color: AppColors.primaryAppColor,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    customHeight(7.h),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Sacramento Zone 4 ',
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryAppColor,
                            ),
                            children: [
                              TextSpan(
                                text: '(In Zone)',
                                style: AppTextStyle.normal12style.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primaryAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Evalution',
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.appYellowColor,
                          ),
                        ),
                      ],
                    ),
                    customHeight(12.h),
                    Row(
                      children: [
                        SvgPicture.asset(AppAsset.locationFillSvgIcon),
                        customWidth(4.w),
                        Text(
                          '132 My Street, Kingston, New York 12401',
                          style: AppTextStyle.normal12style.copyWith(
                            color: AppColors.defaultTxtGrey,
                          ),
                        ),
                      ],
                    ),
                    customHeight(10.h),
                    ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return CommonDivider();
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            customHeight(8.h),
                            Row(
                              children: [
                                Text(
                                  'Week ${index + 1}',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                                customWidth(5.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.h,
                                    horizontal: 8.w,
                                  ),
                                  // width: 15.w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 2.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.chatGreenColor,
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                  child: Text(
                                    'SOC',
                                    style: AppTextStyle.normal10style.copyWith(
                                      fontSize: 7.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            customHeight(8.h),
                            ...List.generate(2, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Visit Type ${index + 1}',
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                  customHeight(8.h),
                                  ScheduleRowWidget(),
                                  customHeight(8.h),
                                ],
                              );
                            }),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ChatFABWidget(),
        bottomNavigationBar: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: AppColors.defaultTxtGrey)),
          ),
          alignment: Alignment.topCenter,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.only(top: 10.h),

            child: Row(
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    radius: 6.r,
                    text: 'Reject',
                    buttonColor: AppColors.rejectionRedColor,
                    onPressed: () {
                      Get.dialog(RejectDialogWidget(visitId: 0,));
                    },
                    textStyle: AppTextStyle.normal12style.copyWith(
                      color: AppColors.rejectionRedColor,
                    ),
                  ),
                ),
                customWidth(5.w),
                Expanded(
                  child: PrimaryOutlinedButton(
                    radius: 6.r,
                    text: 'Reschedule',
                    buttonColor: AppColors.primaryAppColor,
                    onPressed: () {
                      Get.dialog(RescheduleDialogWidget());
                    },
                    textStyle: AppTextStyle.normal12style.copyWith(
                      color: AppColors.primaryAppColor,
                    ),
                  ),
                ),
                customWidth(5.w),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Get.dialog(AcceptDialogWidget(visitId: 0,));
                    },
                    padding: EdgeInsets.all(0),
                    label: 'Accept',
                    borderRadius: 6.r,
                    labelStyle: AppTextStyle.normal12style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    buttonColor: Color(0xff2ED8B6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

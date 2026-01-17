import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:clinician_app/pages/request/request_detail_page.dart';
import 'package:clinician_app/pages/request/widget/accept_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reject_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reschedule_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/schedule_row_widget.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class RequestInfoWidget extends StatefulWidget {
  const RequestInfoWidget({super.key, required this.data});
  final RequestDataModel data;

  @override
  State<RequestInfoWidget> createState() => _RequestInfoWidgetState();
}

class _RequestInfoWidgetState extends State<RequestInfoWidget> {
  Color getColor(ZoneType type) {
    switch (type) {
      case ZoneType.warning:
        return AppColors.appYellowColor;
      case ZoneType.inZone:
        return Colors.green;

      case ZoneType.outOfZone:
        return AppColors.primaryAppColor;
    }
    // return index.isOdd ? Colors.green : AppColors.ratingYellowColor;
  }

  String getIconStatus(String status) {
    switch (status) {
      case 'Rescheduled pending' || 'Completed pending':
        return AppAsset.pendingSvgIcon;
      case 'Rejected':
        return AppAsset.rejectedSvgIcon;
      case 'Accepted' || 'Rescheduled' || 'Completed':
        return AppAsset.acceptedSvgIcon;
    }
    return AppAsset.acceptedSvgIcon;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          widget.data.status?.toLowerCase() == 'pending'
              ? () {
                Get.to(() => RequestDetailPage(data: widget.data));
              }
              : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: getColor(
              widget.data.zone ?? ZoneType.inZone,
            ).withValues(alpha: 0.5),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (widget.data.noteTxt ?? '').isNotEmpty
                    ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffB26322),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 4.h,
                          horizontal: 4.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        child: Text(
                          widget.data.noteTxt ?? "",
                          style: AppTextStyle.normal10style.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : Expanded(child: SizedBox.shrink()),

                // Spacer(),
                customWidth(15.w),
                Align(
                  child: Text(
                    CommonMethods.getZoneName(
                      widget.data.zone ?? ZoneType.inZone,
                    ),
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w700,
                      color: getColor(widget.data.zone ?? ZoneType.inZone),
                    ),
                  ),
                ),
                customWidth(10.w),
              ],
            ),
            customHeight(8.h),
            // user info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Container(
                    width: 56.w,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(AppAsset.avatarImg, fit: BoxFit.cover),
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
                        'Male | 24y',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w300,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '2x4    | 2.5 miles',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                      Text(
                        '\$55.00',
                        style: AppTextStyle.normal12style.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryAppColor,
                        ),
                      ),
                      Text(
                        'Sacramento Zone 4',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryAppColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            customHeight(6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
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
            ),
            customHeight(6.h),
            // --pending
            widget.data.status == 'Pending'
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ScheduleRowWidget();
                        },
                      ),
                      customHeight(5.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '10+ More',
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                      ),
                      customHeight(5.h),
                      SizedBox(
                        height: 38.h,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      customHeight(9.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          SvgPicture.asset(
                            widget.data.statusTxt?.contains(
                                      'Pending to reschedule',
                                    ) ??
                                    false
                                ? AppAsset.pendingSvgIcon
                                : getIconStatus(widget.data.status ?? ""),
                            width: 18.w,
                            height: 18.h,
                          ),
                          customWidth(4.w),
                          Flexible(
                            child: Text(
                              widget.data.statusTxt ?? "N/A",
                              style: AppTextStyle.normal12style.copyWith(
                                color: AppColors.defaultTxtGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.data.status == 'Rejected') ...[
                        customHeight(16.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: PrimaryOutlinedButton(
                            width: 176.w,
                            height: 40.h,
                            text: 'Request for Re-assignment',
                            radius: 6.r,
                            textStyle: AppTextStyle.normal12style.copyWith(
                              color: AppColors.primaryAppColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            customHeight(20.h),
          ],
        ),
      ),
    );
  }
}

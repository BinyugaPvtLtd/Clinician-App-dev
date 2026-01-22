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

import '../../../model/request/requestList_model.dart';

class RequestInfoWidget extends StatefulWidget {
  const RequestInfoWidget({super.key, required this.data});
  final PatientVisitModel data;

  @override
  State<RequestInfoWidget> createState() => _RequestInfoWidgetState();
}

class _RequestInfoWidgetState extends State<RequestInfoWidget> {
  // ✅ ADDED: expand/collapse state for visitList
  bool _isExpanded = false;

  Color getColor(ZoneType type) {
    switch (type) {
      case ZoneType.warning:
        return AppColors.appYellowColor;
      case ZoneType.inZone:
        return Colors.green;
      case ZoneType.outOfZone:
        return AppColors.primaryAppColor;
    }
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
    final totalVisits = widget.data.visitList.length;

    // ✅ show only first 3 if more than 3 and not expanded
    final visibleCount = (!_isExpanded && totalVisits > 3) ? 3 : totalVisits;

    // ✅ remaining for More text
    final remaining = totalVisits - visibleCount;

    return InkWell(
      onTap:
          () {
        Get.to(() => RequestDetailPage(visitId: widget.data.visitId, noteText: widget.data.visitNote,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: getColor(
              widget.data.inZone == "true" ? ZoneType.inZone :widget.data.inZone == "false" ? ZoneType.outOfZone : ZoneType.warning,
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
                widget.data.visitNote .isNotEmpty
                    ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffB26322),
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
                      widget.data.visitNote,
                      style: AppTextStyle.normal10style.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                    : widget.data.warning.isNotEmpty ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffB26322),
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
                      widget.data.warning,
                      style: AppTextStyle.normal10style.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ):Expanded(child: SizedBox.shrink()),
                customWidth(15.w),
                Align(
                  child: Text(
                    CommonMethods.getZoneName(
                      widget.data.inZone == "true" ? ZoneType.inZone :widget.data.inZone == "false" ? ZoneType.outOfZone : ZoneType.warning,

                    ),
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w700,
                      color: getColor(
                        widget.data.inZone == "true" ? ZoneType.inZone :widget.data.inZone == "false" ? ZoneType.outOfZone : ZoneType.warning,

                      ),
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
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.hardEdge,
                    child: widget.data.patientImage.isEmpty
                        ? Image.asset(
                      AppAsset.profilePicImg,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      widget.data.patientImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  customWidth(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.patientName,
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                      Text(
                        '${widget.data.genderName} | ${widget.data.patientAge}y',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                      Text(
                        widget.data.primaryDiagnosisName,
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
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
                        // ✅ show 2 decimals
                        '\$${widget.data.visitCharge.toStringAsFixed(2)}',
                        style: AppTextStyle.normal12style.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryAppColor,
                        ),
                      ),
                      Text(
                        widget.data.zoneName,
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
                    widget.data.patientAddress,
                    style: AppTextStyle.normal12style.copyWith(
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                ],
              ),
            ),
            customHeight(6.h),

            // Schedule section
          widget.data.visitStatus == 'pending' ?  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ListView.builder(
                    // ✅ CHANGED: visibleCount instead of full length
                    itemCount: visibleCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var listData = widget.data.visitList[index];
                      return ScheduleRowWidget(listData: listData);
                    },
                  ),

                  // ✅ CHANGED: show only when more than 3 visits
                  if (totalVisits > 3) ...[
                    customHeight(5.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'Less' : '${remaining}+ More',
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                      ),
                    ),
                  ],

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
                              Get.dialog(RejectDialogWidget(visitId:widget.data.visitId ));
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
                              Get.dialog(AcceptDialogWidget(visitId: widget.data.visitId));
                            },
                            padding: const EdgeInsets.all(0),
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
              : Padding( padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              widget.data.visitStatus == 'rejected' ? SvgPicture.asset(AppAsset.rejectedSvgIcon) :
              widget.data.visitStatus == 'accepted' ? SvgPicture.asset(AppAsset.acceptedSvgIcon) :
             SvgPicture.asset(AppAsset.acceptedSvgIcon),
              customWidth(4.w),
              Text('${(widget.data.visitStatus ?? '')[0].toUpperCase()}${(widget.data.visitStatus ?? '').substring(1)} on ${widget.data.visitTime}, ${widget.data.visitDateTime}',
                style: AppTextStyle.normal10style.copyWith(
                  color: AppColors.defaultTxtGrey,
                ),)
            ],
          ),),

            customHeight(20.h),
          ],
        ),
      ),
    );
  }
}

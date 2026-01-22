import 'package:clinician_app/core/common/hex_color_decoder.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../model/request/requestList_model.dart';

class ScheduleRowWidget extends StatefulWidget {
  final VisitDetailsModel? listData;
  const ScheduleRowWidget({super.key,  this.listData});

  @override
  State<ScheduleRowWidget> createState() => _ScheduleRowWidgetState();
}

class _ScheduleRowWidgetState extends State<ScheduleRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Row(
        children: [
          SvgPicture.asset(AppAsset.scheduleSvgIcon, width: 15.w),
          customWidth(8.5.w),
          Text(
            widget.listData!.visitDateFrom,
            style: AppTextStyle.normal12style.copyWith(
              color: AppColors.defaultTxtGrey,
            ),
          ),
          customWidth(2.w),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
            width: 19.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 2.w),
            decoration: BoxDecoration(
              color: hexToColor(widget.listData!.employeeTypeColor),
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Text(
              widget.listData!.employeeTypeAbbreviation,
              style: AppTextStyle.normal10style.copyWith(
                fontSize: 7.sp,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Text(
            '${widget.listData!.visitStartTime}-${widget.listData!.visitEndTime}',
            style: AppTextStyle.normal12style.copyWith(
              color: AppColors.defaultTxtGrey,
            ),
          ),
        ],
      ),
    );
  }
}

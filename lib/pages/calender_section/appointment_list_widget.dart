import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/constant_import.dart';

class AppointmentListWidget extends StatefulWidget {
  const AppointmentListWidget({super.key});

  @override
  State<AppointmentListWidget> createState() => _AppointmentListWidgetState();
}

class _AppointmentListWidgetState extends State<AppointmentListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
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
                        'Evaluation',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.appYellowColor,
                        ),
                      ),
                    ),
                    customHeight(7.5.h),
                    Row(
                      children: [
                        customWidth(20.w),
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
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customHeight(4.h),
                  Text(
                    CommonMethods.getZoneName(ZoneType.inZone),
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.appYellowColor,
                    ),
                  ),
                  customHeight(13.h),
                  Text(
                    '2x4    | 2.5 miles',
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                  customHeight(5.h),
                  Text(
                    '\$55.00',
                    style: AppTextStyle.normal12style.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryAppColor,
                    ),
                  ),
                ],
              ),
              customWidth(20.w),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppAsset.locationFillSvgIcon),
                      customWidth(4.w),
                      Flexible(
                        child: Text(
                          '132 My Street, Kingston, New York 12401',
                          style: AppTextStyle.normal12style.copyWith(
                            color: AppColors.defaultTxtGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              customHeight(8.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 130.w,
                  height: 23.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.appYellowColor.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    '9.00AM-10.00AM',
                    style: AppTextStyle.normal14style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

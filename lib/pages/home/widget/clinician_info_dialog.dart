import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/model/key_value_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClinicianInfoDialog extends StatefulWidget {
  const ClinicianInfoDialog({super.key});

  @override
  State<ClinicianInfoDialog> createState() => _ClinicianInfoDialogState();
}

class _ClinicianInfoDialogState extends State<ClinicianInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColors.grey),
                      child: SvgPicture.asset(
                        AppAsset.closeSvgIcon,
                        colorFilter: Colors.white.getSvgColor,
                      ),
                    ),
                  ),
                ),
                customHeight(10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Distance 4.5km',
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.textGreyColor,
                        ),
                      ),
                      customHeight(6.h),
                      Row(
                        children: [
                          Text(
                            'Visit  6/10',
                            style: AppTextStyle.normal12style.copyWith(
                              color: AppColors.textGreyColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Time to reach',
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      customHeight(6.h),
                      Row(
                        children: [
                          SvgPicture.asset(AppAsset.locationFillSvgIcon),
                          customWidth(4.w),
                          Expanded(
                            child: Text(
                              '132 My Street, Kingston, New York 12401',
                              style: AppTextStyle.normal12style.copyWith(
                                color: AppColors.defaultTxtGrey,
                              ),
                            ),
                          ),
                          Text(
                            '30- 40 mins',
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      customHeight(8.h),
                      Text(
                        'Lorem Ipsum about',
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                      customHeight(8.h),
                      Text(
                        'Plan Of Care',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                      customHeight(10.h),
                      Row(
                        children: [
                          ...List.generate(3, (index) {
                            var list = [
                              KeyValueModel(key: 'OT', value: 'FEBD4D'),
                              KeyValueModel(key: 'PT', value: 'F6928A'),
                              KeyValueModel(key: 'ST', value: '527FB9'),
                            ];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 4.w,
                              ),
                              width: 23.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 2.w),
                              decoration: BoxDecoration(
                                color: Color(
                                  int.tryParse('0xff${list[index].value}') ?? 0,
                                ),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Text(
                                list[index].key,
                                style: AppTextStyle.normal10style.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
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

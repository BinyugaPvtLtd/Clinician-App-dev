import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/model/key_value_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/live_map_controller.dart';
import '../../../model/liveMap/live_data_model.dart';

class ClinicianInfoDialog extends StatefulWidget {
  final int viditId;
  final VisitDashboardDetailsModel data;
  const ClinicianInfoDialog({super.key, required this.data, required this.viditId});

  @override
  State<ClinicianInfoDialog> createState() => _ClinicianInfoDialogState();
}

class _ClinicianInfoDialogState extends State<ClinicianInfoDialog> {
   LiveMapController liveMapController = Get.put(LiveMapController());
  @override
  initState() {

    super.initState();
  }
  Color hexToColor(String? hex) {
    if (hex == null || hex.trim().isEmpty) return AppColors.chatRedColor;

    String value = hex.trim();

    // Accept "#RRGGBB"
    if (value.startsWith("#")) {
      value = value.replaceFirst("#", "");
      return Color(int.parse("0xFF$value"));
    }

    // Accept "0xffRRGGBB" or "0xFFRRGGBB"
    if (value.startsWith("0x") || value.startsWith("0X")) {
      return Color(int.parse(value));
    }

    // fallback: raw "RRGGBB"
    if (value.length == 6) {
      return Color(int.parse("0xFF$value"));
    }

    return AppColors.chatRedColor;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Obx(() => liveMapController.isDetailsLoading.value ? Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryAppColor,
        ),
      ) :Material(
        type: MaterialType.transparency,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child:  Padding(
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
                            child: liveMapController.visitDashboardDetails.value.patient.imageUrl.isEmpty ? Image.asset(
                              AppAsset.profilePicImg,
                              fit: BoxFit.cover,
                            ): Image.network(
                              liveMapController.visitDashboardDetails.value.patient.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          customWidth(10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                liveMapController.visitDashboardDetails.value.patient.name,
                                style: AppTextStyle.normal12style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                              Text(
                                '${liveMapController.visitDashboardDetails.value.patient.gender} | ${liveMapController.visitDashboardDetails.value.patient.age}y',
                                style: AppTextStyle.normal12style.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                              Text(
                                liveMapController.visitDashboardDetails.value.patient.primaryDiagnosis,
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
                                '\$${liveMapController.visitDashboardDetails.value.visit.visitCharge}',
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
                        'Distance ${liveMapController.visitDashboardDetails.value.visit.distance ?? "--"}km',
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.textGreyColor,
                        ),
                      ),
                      customHeight(6.h),
                      Row(
                        children: [
                          Text(
                            'Visit  ${liveMapController.visitDashboardDetails.value.visit.visitCount}',
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
                              liveMapController.visitDashboardDetails.value.patient.address,
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
                        liveMapController.visitDashboardDetails.value.patient.about,
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
                          ...List.generate(liveMapController.visitDashboardDetails.value.planOfCare.length, (index) {
                            var list = liveMapController.visitDashboardDetails.value.planOfCare[index];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                                horizontal: 4.w,
                              ),
                              width: 24.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 2.w),
                              decoration: BoxDecoration(
                                color: hexToColor(list.color),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Text(
                                list.abbreviation,
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
      )),
    );
  }
}

import 'package:clinician_app/core/constant/app_asset.dart';
import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:clinician_app/core/constant/app_text_style.dart';
import 'package:clinician_app/core/constant/static_decoration.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "View History",

              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: 34,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 19.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 1,
                          color: AppColors.borderGrey,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppAsset.user, height: 16.h),
                              customWidth(15.w),
                              Expanded(
                                child: Text(
                                  "Lucas Jackson",
                                  style: AppTextStyle.normal12style.copyWith(
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 2.h,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(
                                    0xffce9e2f1a,
                                  ).withValues(alpha: 0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    "Pending",
                                    style: AppTextStyle.normal10style.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          customHeight(9.h),
                          Row(
                            children: [
                              Image.asset(AppAsset.others, height: 16.h),
                              customWidth(15.w),
                              Text(
                                "Vacation",
                                style: AppTextStyle.normal12style.copyWith(
                                  color: AppColors.primaryAppColor,
                                ),
                              ),
                            ],
                          ),
                          customHeight(9.h),
                          Row(
                            children: [
                              Image.asset(AppAsset.calander, height: 16.h),
                              customWidth(15.w),
                              Expanded(
                                child: Text(
                                  "12/05/2025/09.30pm  to 18/05/2025/09.50am",
                                  style: AppTextStyle.normal12style.copyWith(
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

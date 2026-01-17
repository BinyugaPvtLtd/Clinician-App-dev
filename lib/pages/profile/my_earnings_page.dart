import 'package:clinician_app/controller/earnings_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyEarningPage extends StatefulWidget {
  const MyEarningPage({super.key});

  @override
  State<MyEarningPage> createState() => _MyEarningPageState();
}

class _MyEarningPageState extends State<MyEarningPage> {
  EarningsController earningsController = Get.put(EarningsController());
  @override
  void initState() {
    // TODO: implement initState
    earningsController.fetchMyTotalEarningData();
    earningsController.fetchMyTotalEarningTodayData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppbar(
              label: "My Earning",
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
          Obx((){
            if (earningsController.isEarningLoading.value  ) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ),
                ),
              );
            }
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: earningsController.earningsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: AppColors.primaryAppColor,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  earningsController.earningsList[index].price,
                                  style: AppTextStyle.bold12style.copyWith(
                                    fontSize: 20.sp,
                                    color: AppColors.primaryAppColor,
                                  ),
                                ),
                                customHeight(5.h),
                                Text(
                                  earningsController
                                      .earningsList[index]
                                      .duration,
                                  style: AppTextStyle.bold12style.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.defaultTxtGrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    customHeight(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "Total Visits",
                            style: AppTextStyle.normal14style.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          PrimaryOutlinedButton(
                            text: "Choose Date",
                            onPressed: () {
                              Get.dialog(CalenderDatePickDialogWidget());
                            },
                            isIconStart: true,
                            icon: Icon(
                              Icons.calendar_month_sharp,
                              color: AppColors.grey,
                            ),
                            textStyle: AppTextStyle.regular10style.copyWith(
                              color: AppColors.grey,
                            ),
                            buttonColor: AppColors.grey,
                            borderWidth: 1,
                            width: 120,
                            height: 28.h,
                            radius: 6,
                          ),
                        ],
                      ),
                    ),
                    customHeight(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              earningsController.selectedVisit.value = index;
                            },
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  color:
                                      earningsController.selectedVisit.value ==
                                              index
                                          ? AppColors.primaryAppColor
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: AppColors.primaryAppColor,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      earningsController
                                          .visitsList[index]
                                          .price,
                                      style: AppTextStyle.bold12style.copyWith(
                                        fontSize: 20.sp,
                                        color:
                                            earningsController
                                                        .selectedVisit
                                                        .value ==
                                                    index
                                                ? Colors.white
                                                : AppColors.primaryAppColor,
                                      ),
                                    ),
                                    customHeight(5.h),
                                    Text(
                                      earningsController
                                          .visitsList[index]
                                          .duration,
                                      style: AppTextStyle.bold12style.copyWith(
                                        fontSize: 14.sp,
                                        color:
                                            earningsController
                                                        .selectedVisit
                                                        .value ==
                                                    index
                                                ? Colors.white
                                                : AppColors.defaultTxtGrey,

                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    customHeight(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "Today's Visit",
                        style: AppTextStyle.bold12style,
                      ),
                    ),
                  Obx((){
                    if (earningsController.isEarningLoadingList.value  ) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 100.h ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryAppColor,
                          ),
                        ),
                      );
                    }
                    final items = earningsController.myEarningTodayVisitModel;
                    if (items.isEmpty) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 100.h ),
                        child: Center(child: Text("No Records Found!")),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: earningsController.myEarningTodayVisitModel.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var listData = earningsController.myEarningTodayVisitModel[index];
                          return Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.2.r,
                                    offset: Offset(0, 1.2.w),
                                    color: Colors.black.withValues(alpha: 0.25),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: listData.patientAvatarUrl.isEmpty ? AssetImage(
                                      AppAsset.profilePicImg,
                                    ):NetworkImage(listData.patientAvatarUrl),
                                  ),
                                  customWidth(10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 90.w,
                                        child: Text(
                                          listData.patientName,
                                          style: AppTextStyle.bold12style
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: AppColors.defaultTxtGrey,
                                            size: 12,
                                          ),
                                          customWidth(5.w),
                                          Text(
                                            listData.dayLabel,
                                            style: AppTextStyle.regular10style
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "${listData.startTime}-${listData.endTime}",
                                    style: AppTextStyle.regular10style.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$55.00",
                                    style: AppTextStyle.regular10style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp,
                                      color: AppColors.primaryAppColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );}),
                    customHeight(20.h),
                  ],
                ),
              ),
            );}),
          ],
        ),
      ),
    );
  }
}

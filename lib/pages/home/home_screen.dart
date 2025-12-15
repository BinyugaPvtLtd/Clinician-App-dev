import 'dart:developer';

import 'package:clinician_app/controller/home_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/constant/list_content.dart';
import 'package:clinician_app/pages/calender_section/calender_screen.dart';
import 'package:clinician_app/pages/home/live_page.dart';
import 'package:clinician_app/pages/home/map_screen.dart';
import 'package:clinician_app/pages/profile/profile_page.dart';
import 'package:clinician_app/pages/request/request_page.dart';
import 'package:clinician_app/pages/time_sheet/time_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: homeController.homeIndex.value,
            children: [
              RequestPage(),
              CalenderScreen(),
              homeController.isLiveView.value ? LivePage() : MapScreen(),

              TimeSheetPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -3.h),
                blurRadius: 7.r,
                color: const Color(0x20000000),
              ),
            ],
          ),
          child: Row(
            children: [
              ...List.generate(ListContent.homeBottomBarList.length, (index) {
                if (index == 2) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        if (homeController.homeIndex.value == 2) {
                          // toggle between Map and LivePage
                          homeController.isLiveView.value =
                              !homeController.isLiveView.value;
                        } else {
                          homeController.homeIndex.value = 2;
                          homeController.isLiveView.value =
                              false; // reset to MapScreen when switching back
                        }
                        log(homeController.homeIndex.value.toString());
                        setState(() {});
                      },
                      child: Transform.translate(
                        offset: Offset(0, -30),
                        child: Container(
                          height: 48.h,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryAppColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3E007B9B),
                                blurRadius: 4.r,
                                offset: Offset(4.w, 4.h),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ListContent.homeBottomBarList[index].iconPath,
                                height: 18.h,
                              ),
                              Text(
                                ListContent.homeBottomBarList[index].label,
                                style: AppTextStyle.normal12style.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      homeController.homeIndex.value = index;
                      log(homeController.homeIndex.value.toString());
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          customHeight(12.h),
                          SvgPicture.asset(
                            ListContent.homeBottomBarList[index].iconPath,
                            height: 18.h,
                            width: 21.w,
                            colorFilter: ColorFilter.mode(
                              homeController.homeIndex.value == index
                                  ? AppColors.primaryAppColor
                                  : AppColors.defaultTxtGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          customHeight(9.h),
                          Text(
                            ListContent.homeBottomBarList[index].label,
                            style: AppTextStyle.normal10style.copyWith(
                              color:
                                  homeController.homeIndex.value == index
                                      ? AppColors.primaryAppColor
                                      : AppColors.defaultTxtGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

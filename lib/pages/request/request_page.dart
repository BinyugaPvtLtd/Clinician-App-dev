// ignore_for_file: invalid_use_of_protected_member

import 'package:clinician_app/controller/home_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/home/widget/home_appbar_widget.dart';
import 'package:clinician_app/pages/request/widget/request_info_widget.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../controller/profile_controller.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  ProfileController controller = Get.put(ProfileController());
   HomeController homeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  //
  // ProfileController controller = Get.find<ProfileController>();
  // HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    // ✅ wait until employeeId is available (not 0)
    homeController.fetchListAllDetails(
      clinicianId: controller.employeeIdByEmail.value.employeeId,
      visitStatus: 'Pending',
      patientName: 'all',
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // ------ header -------
          HomeAppbarWidget(),
          // --------- search and dropdown ----------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: PrimaryTextField(
                      onChanged: (value){
                        if (value.trim().isEmpty) {
                          homeController.fetchListAllDetails(
                              clinicianId: controller.employeeId.value,
                              visitStatus: homeController.statusVal.value,
                              patientName: 'all');
                        } else {
                          homeController.fetchListAllDetails(
                              clinicianId: controller.employeeId.value,
                              visitStatus: homeController.statusVal.value,
                              patientName: value.trim());
                        }
                      },
                      hintText: 'Search',
                      filledColor: Color(0xffE9E9E9),
                      borderRadius: 6.75.r,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppAsset.searchSvgIcon),
                      ),
                    ),
                  ),
                ),
                customWidth(15.w),
                SizedBox(
                  width: 120.w,
                  child: Obx(
                    () => PrimaryDropDown(
                      value: homeController.statusVal.value,
                      buttonStyleData: ButtonStyleData(width: 120.w),
                      filled: false,
                      iconStyleData: IconStyleData(
                        icon: SvgPicture.asset(AppAsset.downArrowFillSvgIcon),
                      ),
                      items: [
                        ...List.generate(4, (index) {
                          var list = [
                            'Pending',
                            'Accepted',
                            'Rejected',
                            'Completed',
                            // 'Rescheduled',
                          ];
                          return DropdownMenuItem(
                            value: list[index],
                            child: Text(
                              list[index],
                              style: AppTextStyle.normal12style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.defaultTxtGrey,
                              ),
                            ),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        homeController.statusVal.value = value ?? "";
                        searchController.text.isEmpty ?
                        homeController.fetchListAllDetails(
                            clinicianId: controller.employeeId.value,
                            visitStatus: value!,
                            patientName: 'all') : homeController.fetchListAllDetails(
                            clinicianId: controller.employeeId.value,
                            visitStatus: value!,
                            patientName: searchController.text) ;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          customHeight(17.h),
          // ------- request list ---------
        Obx((){
          if (homeController.isRequestLoading.value) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryAppColor,
                ),
              ),
            );
          }

          final items = homeController.todayVisitsModel.value.visits;
          if (items.isEmpty) {
            return const Expanded(
              child: Center(child: Text("No Data Found!")),
            );
          }
          return Expanded(
            child: ListView.builder(
                itemCount: homeController.todayVisitsModel.value.visits.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                // groupBy: (element) {
                //   return CommonMethods.formatDateWithDate(
                //     element.dateTime ?? DateTime.now(),
                //   );
                // },
                // groupSeparatorBuilder: (value) {
                //   return Padding(
                //     padding: EdgeInsets.symmetric(vertical: 5.h),
                //     child: Text(
                //       value,
                //       style: AppTextStyle.normal14style.copyWith(
                //         fontWeight: FontWeight.w600,
                //         color: AppColors.defaultTxtGrey,
                //       ),
                //     ),
                //   );
                // },
                itemBuilder: (context, element) {
                  var data =
                  homeController.todayVisitsModel.value.visits[element];
                  return RequestInfoWidget(data: data);
                },
              ),
          );
        }),
        ],
      ),
    );
  }
}

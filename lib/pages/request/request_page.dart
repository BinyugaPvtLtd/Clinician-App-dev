import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:clinician_app/controller/home_controller.dart';
import '../../controller/profile_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/home/widget/home_appbar_widget.dart';
import 'package:clinician_app/pages/request/widget/request_info_widget.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final ProfileController profileController = Get.find<ProfileController>();
  final HomeController homeController = Get.find<HomeController>();

  final TextEditingController searchController = TextEditingController();

  int get clinicianId => profileController.employeeId.value != 0
      ? profileController.employeeId.value
      : profileController.employeeIdByEmail.value.employeeId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ✅ First load (shows loader only first time via controller.showFirstLoader)
      await homeController.fetchListAllDetails(
        clinicianId: clinicianId,
        visitStatus: homeController.statusVal.value,
        patientName: 'all',
        isPollingCall: false,
      );

      // ✅ Start polling every 2 seconds
      homeController.startAutoRefresh();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeAppbarWidget(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: PrimaryTextField(
                      controller: searchController,
                      // ✅ proper debounced search (and keeps polling)
                      onChanged: (v) {
                        homeController.debounceSearch(patientName: v);
                      },
                      hintText: 'Search',
                      filledColor: const Color(0xffE9E9E9),
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
                      items: ['Pending', 'Accepted', 'Rejected', 'Completed']
                          .map(
                            (s) => DropdownMenuItem(
                          value: s,
                          child: Text(
                            s,
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (value) async {
                        if (value == null) return;

                        // ✅ update filter
                        homeController.statusVal.value = value;

                        // ✅ fetch immediately with new status + current search text
                        await homeController.fetchListAllDetails(
                          clinicianId: clinicianId,
                          visitStatus: value,
                          patientName: searchController.text.trim().isEmpty
                              ? 'all'
                              : searchController.text.trim(),
                          isPollingCall: false,
                        );

                        // ✅ restart polling
                        homeController.startAutoRefresh();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          customHeight(12.h),

          /// ✅ tiny indicator (doesn't block UI)
          // Obx(() {
          //   return homeController.isSilentRefreshing.value
          //       ? const LinearProgressIndicator(minHeight: 2)
          //       : const SizedBox(height: 2);
          // }),

          Expanded(
            child: Obx(() {
              /// ✅ ONLY FIRST TIME loader
              if (homeController.showFirstLoader.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ),
                );
              }

              final items = homeController.todayVisitsModel.value.visits;
              if (items.isEmpty) {
                return const Center(child: Text("No Data Found!"));
              }

              return RefreshIndicator(
                color: AppColors.primaryAppColor,
                onRefresh: () async {
                  await homeController.fetchListAllDetails(
                    clinicianId: clinicianId,
                    visitStatus: homeController.statusVal.value,
                    patientName: searchController.text.trim().isEmpty
                        ? 'all'
                        : searchController.text.trim(),
                    isPollingCall: false,
                  );
                },
                child: ListView.builder(
                  itemCount: items.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  itemBuilder: (context, index) {
                    return RequestInfoWidget(data: items[index]);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

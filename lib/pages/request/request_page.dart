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

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final homeController = Get.find<HomeController>();
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
                        ...List.generate(5, (index) {
                          var list = [
                            'Pending',
                            'Accepted',
                            'Rejected',
                            'Completed',
                            'Rescheduled',
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
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          customHeight(17.h),
          // ------- request list ---------
          Expanded(
            child: Obx(
              () => GroupedListView(
                elements: homeController.selectedReqTypeList.value,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                groupBy: (element) {
                  return CommonMethods.formatDateWithDate(
                    element.dateTime ?? DateTime.now(),
                  );
                },
                groupSeparatorBuilder: (value) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      value,
                      style: AppTextStyle.normal14style.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  );
                },
                itemBuilder: (context, element) {
                  return RequestInfoWidget(data: element);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

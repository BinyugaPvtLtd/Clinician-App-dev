import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/live_map_controller.dart';
import '../../../core/ui/primary_textfield.dart';
import '../../../utils/validator.dart';

class SeeRouteDialog extends StatefulWidget {
  const SeeRouteDialog({super.key});

  @override
  State<SeeRouteDialog> createState() => _SeeRouteDialogState();
}

class _SeeRouteDialogState extends State<SeeRouteDialog> {
  final LiveMapController liveMapController = Get.put(LiveMapController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Select the Source and Destination \nto view the route.',
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppAsset.closeSvgIcon, width: 12.w),
                  ),
                ],
              ),
              customHeight(20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  if (index == 1) {
                    return Row(
                      children: [
                        customWidth(68.w),
                        SizedBox(
                          height: 40.h,
                          width: 2.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned.fill(
                                top: -8.h,
                                bottom: -10.h,
                                // left: 0,
                                // right: 0,
                                child: Dash(
                                  length: 56.h,
                                  dashBorderRadius: 4.r,
                                  dashThickness: 2.w,
                                  direction: Axis.vertical,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          index == 0 ? 'Source' : 'Destination',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.normal10style.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                        child:
                            index == 0
                                ? SizedBox(
                                  height: 18.h,
                                  child: Radio(
                                    value: true,
                                    groupValue: true,
                                    onChanged: (value) {},
                                    fillColor: WidgetStatePropertyAll(
                                      Color(0xff3A9A40),
                                    ),
                                    activeColor: Color(0xff3A9A40),
                                  ),
                                )
                                : SvgPicture.asset(AppAsset.locationPinSvgIcon),
                      ),
                      customWidth(12.w),
                      index == 0 ? Expanded(child:
                      PrimaryTextField(
                        controller: TextEditingController(text:liveMapController.clinicianStats.value.clinician.name),
                        readonly: true,
                        validator: (value) => Validators.validateRequired(value!,'Location'),
                      ))  : Expanded(
                        child: Obx(() {
                          final visits = liveMapController.visitsMapModel.value.visits;

                          // Keep only first occurrence of each name + remove empty/null names
                          final seen = <String>{};
                          final uniqueVisits = visits.where((v) {
                            final name = (v.patientName ?? '').trim();
                            if (name.isEmpty) return false;
                            if (seen.contains(name)) return false;
                            seen.add(name);
                            return true;
                          }).toList();

                          final names = uniqueVisits.map((e) => e.patientName!).toList();
                          final selectedName = liveMapController.selectedPatientName.value;
                          final safeValue = names.contains(selectedName) ? selectedName : null;

                          return PrimaryDropDown(
                            hintText: "Select Patient",
                            value: safeValue,
                            items: uniqueVisits.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.patientName!,
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Text(
                                   item.patientName,
                                    style: AppTextStyle.normal12style
                                        .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value == null) return;
                              liveMapController.selectedPatientName.value = value;

                              // If multiple visits have same name, this picks the first
                              final first = visits.firstWhere((e) => e.patientName == value);
                              liveMapController.selectedPatientId.value = first.patientId ?? 0;
                            },
                          );
                        })
                        // SizedBox(
                        //   height: 37.h,
                        //   child: PrimaryDropDown(
                        //     hintText: 'Select Patient',
                        //     iconStyleData: IconStyleData(
                        //       icon: SvgPicture.asset(
                        //         AppAsset.downArrowFillSvgIcon,
                        //       ),
                        //     ),
                        //     contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
                        //     dropdownStyleData: DropdownStyleData(
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         border: Border.all(
                        //           color: Color(0xffD1D5DB),
                        //           width: 1.w,
                        //         ),
                        //         borderRadius: BorderRadius.only(
                        //           bottomLeft: Radius.circular(6.r),
                        //           bottomRight: Radius.circular(6.r),
                        //         ),
                        //       ),
                        //       elevation: 0,
                        //     ),
                        //     filledColor: Colors.white,
                        //     style: AppTextStyle.normal12style.copyWith(
                        //       color: AppColors.greyColor,
                        //     ),
                        //     onChanged: (value) {},
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: AppColors.borderGrey,
                        //         width: 1.w,
                        //       ),
                        //     ),
                        //     items: List.generate(4, (index) {
                        //       var list = [
                        //         ' 1    Guy Hawkins',
                        //         ' 2    Savannah Nguyen',
                        //         ' 3    Dianne Russell',
                        //         ' 4    Floyd Miles',
                        //       ];
                        //       return DropdownMenuItem(
                        //         value: list[index],
                        //         child: Text(
                        //           list[index],
                        //           style: AppTextStyle.normal12style.copyWith(
                        //             color: AppColors.greyColor,
                        //           ),
                        //         ),
                        //       );
                        //     }),
                        //   ),
                        // ),
                      ),
                    ],
                  );
                }),
              ),
              customHeight(20.h),
            Obx(()=> liveMapController.isSeeRouteLoading.value ? Padding(
              padding:  EdgeInsets.symmetric(horizontal: 17.h,vertical: 1.h),
              child: SizedBox(
                width: 21.w,
                height: 21.h,
                child: CircularProgressIndicator(
                  color: AppColors.primaryAppColor,
                ),
              ),
            ):  PrimaryButton(
                width: 80.w,
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                label: 'View Route',
                labelStyle: AppTextStyle.normal10style.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onTap: () async {
                  if(liveMapController.selectedPatientName.value.isEmpty){
                    return;
                  }
                var response =  await liveMapController.fetchViewRoutetMap(
                     clinitianId: 51,
                      patientId:  liveMapController.selectedPatientId.value,
                  );

                  // ✅ after source/dest are set in controller
                  await liveMapController.drawRoute();

                  // ✅ switch to Map tab if needed
                  // mapInx.value = 0;
                  Get.back();

                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

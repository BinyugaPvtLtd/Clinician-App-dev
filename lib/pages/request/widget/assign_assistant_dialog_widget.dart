import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../../utils/validator.dart';

class AssignAssistantDialogWidget extends StatefulWidget {
  final int visitId;
  const AssignAssistantDialogWidget({super.key, required this.visitId});

  @override
  State<AssignAssistantDialogWidget> createState() =>
      _AssignAssistantDialogWidgetState();
}

class _AssignAssistantDialogWidgetState
    extends State<AssignAssistantDialogWidget> {
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    controller.emailAssistenseController.value.clear();
    controller.selectedDataId.value = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Assign Visit To Assistant',
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(AppAsset.closeSvgIcon, width: 12.w),
                  ),
                ],
              ),
              customHeight(12.h),
              Column(
                children: [
                  Obx(() {
                    final assistants = controller.employeeAssistantTypeModel
                        .expand((e) => e.assistants)
                        .toList();

                    return PrimaryDropDown(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderGrey,
                          width: 1.w,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          AppAsset.profileSvgIcon,
                          colorFilter: Color(0xff9CA3AF).getSvgColor,
                          width: 12.w,
                        ),
                      ),
                      validator: (value) => Validators.validateRequired(
                        controller.selectedDataName.value,
                        'Assistant Name',
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: false,
                      // buttonStyleData: ButtonStyleData(
                      //   width: 120.w,
                      //   height: 44.h,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: AppColors.borderGrey),
                      //     borderRadius: BorderRadius.circular(6),
                      //   ),
                      // ),
                      hintText: "Select assistance",

                      items: assistants.map((a) {
                        return DropdownMenuItem<String>(
                          value: a.userName, // ✅ String
                          child: Text(
                            a.userName,
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                        );
                      }).toList(),

                      onChanged: (value) {
                        if (value == null) return;

                        controller.selectedDataName.value = value; // selected assistant name

                        // If you want the selected assistant object/id too:
                        final selected = assistants.firstWhere(
                              (x) => x.userName == value,
                          orElse: () => assistants.first,
                        );
                        controller.selectedDataId.value = selected.employeeId;
                        controller.selectedDataName.value = selected.userName;
                        controller.emailAssistenseController.value.text = selected.personalEmail;

                      },
                    );
                  }),
                  // PrimaryDropDown(
                  //   hintText: 'Assistant Name',
                  //   iconStyleData: IconStyleData(
                  //     icon: SvgPicture.asset(AppAsset.downArrowFillSvgIcon),
                  //   ),
                  //   filledColor: Colors.white,
                  //   style: AppTextStyle.normal12style.copyWith(
                  //     color: AppColors.greyColor,
                  //   ),
                  //   // prefixIconConstraints: BoxConstraints(maxWidth: 40.w),
                  //   prefixIcon: Padding(
                  //     padding: EdgeInsets.all(13),
                  //     child: SvgPicture.asset(
                  //       AppAsset.profileSvgIcon,
                  //       colorFilter: Color(0xff9CA3AF).getSvgColor,
                  //       width: 12.w,
                  //     ),
                  //   ),
                  //   onChanged: (value) {},
                  //   focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //       color: AppColors.borderGrey,
                  //       width: 1.w,
                  //     ),
                  //   ),
                  // ),
                  customHeight(10.h),
                  PrimaryTextField(
                    borderRadius: 3.r,
                    controller: controller.emailAssistenseController.value,
                    hintText: 'Assistant Email',
                    readonly: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        AppAsset.emailSvgIcon,
                        colorFilter: Color(0xff9CA3AF).getSvgColor,
                        width: 12.w,
                      ),
                    ),
                    filledColor: Colors.white,
                  ),
                  customHeight(20.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(() {
                      final bool isSelected =
                          controller.selectedDataId.value != 0;

                      if (controller.isAssistantAssignLoading.value) {
                        return CircularProgressIndicator(
                          color: AppColors.primaryAppColor,
                        );
                      }

                      return Opacity(
                        opacity: isSelected ? 1.0 : 0.5,
                        child: PrimaryButton(
                          onTap: isSelected
                              ? () async {
                            var response =
                            await controller.PostAssignAssistance(
                                visitId: widget.visitId,
                                EmployeeId:
                                controller.selectedDataId.value);
                            if (response.statusCode == 200 ||
                                response.statusCode == 201) {
                              Get.back();
                              showSucessDialog(
                                  context: context,
                                  message:
                                  'Assistant assigned successfully',
                                  title: 'Successfully');
                              controller.selectedDataName.value = '';
                              controller.selectedDataId.value = 0;
                              controller.emailAssistenseController.value
                                  .clear();
                            }
                          }
                              : () {}, // no-op when disabled
                          label: 'Assign',
                          width: double.infinity,
                          borderRadius: 6.r,
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          labelStyle: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
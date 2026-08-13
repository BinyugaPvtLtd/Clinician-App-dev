import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../../utils/validator.dart';

class RejectDialogWidget extends StatefulWidget {
  final int visitId;
  const RejectDialogWidget({super.key, required this.visitId});

  @override
  State<RejectDialogWidget> createState() => _RejectDialogWidgetState();
}

class _RejectDialogWidgetState extends State<RejectDialogWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileController controller = Get.find<ProfileController>();
  final HomeController homeController = Get.find<HomeController>();
  TextEditingController rejectResone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: ColoredBox(
        color: Colors.white30,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: (Get.width / 1.3).w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Reject',
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(AppAsset.closeSvgIcon,width: 11.w),
                        ),
                      ],
                    ),
                    customHeight(18.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reason*',
                        style: AppTextStyle.normal10style.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ),
                    customHeight(3.h),
                    PrimaryTextField(
                      controller: rejectResone,
                      maxLines: 4,
                      validator:
                          (value) =>
                              Validators.validateRequired(value!, 'Reason'),
                    ),
                    customHeight(10.h),
                    SizedBox(
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryOutlinedButton(
                            width: 80.w,
                            height: 35.h,
                            text: 'Cancel',
                            radius: 6.r,
                            borderWidth: 1.r,
                            onPressed: () {
                              Get.back();
                            },
                            textStyle: AppTextStyle.normal10style.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryAppColor,
                            ),
                          ),
                          customWidth(6.w),
                          Obx(
                            () =>
                                controller.isVisitUpdateLoding.value
                                    ? SizedBox(
                                  width: 54.w,
                                  height: 15.h,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 19.w),
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryAppColor,
                                    ),
                                  ),
                                )
                                    : PrimaryButton(
                                      width: 80.w,
                                      height: 35.h,
                                      label: 'Save',
                                      borderRadius: 6.r,
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          var response = await controller
                                              .postVisitUpdate(
                                                visitId: widget.visitId,
                                                rejectedReason:
                                                    rejectResone.text,
                                                isVisitAccepted: false,
                                              );
                                          if (response.statusCode == 200 ||
                                              response.statusCode == 201) {
                                            Get.back();
                                            showSucessDialog(
                                              context: context,
                                              message:
                                                  'Visit rejected successfully',
                                              title: 'Successfully',
                                            );
                                            homeController.refreshRequestList();
                                            //Get.to(() => HomeScreen());
                                          } else {
                                            print('Validation failed');
                                          }
                                        } else {
                                          print('Validation failed');
                                        }
                                      },
                                      padding: EdgeInsets.zero,
                                      labelStyle: AppTextStyle.normal10style
                                          .copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

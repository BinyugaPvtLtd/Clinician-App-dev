import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/ui/const_sucess_popup.dart';

class AcceptDialogWidget extends StatefulWidget {
  final int visitId;
  const AcceptDialogWidget({super.key, required this.visitId});

  @override
  State<AcceptDialogWidget> createState() => _AcceptDialogWidgetState();
}

class _AcceptDialogWidgetState extends State<AcceptDialogWidget> {
  ProfileController controller = Get.find<ProfileController>();
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Accept',
                        style: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppAsset.closeSvgIcon),
                      ),
                    ],
                  ),
                  customHeight(18.h),
                  Text(
                    'Do you really want to \nAccept visit ?',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal10style.copyWith(
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                  customHeight(13.h),
                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryOutlinedButton(
                          width: 54.w,
                          text: 'Cancel',
                          radius: 6.r,
                          borderWidth: 1.r,
                          onPressed: () {
                            Get.back();
                          },
                          textStyle: AppTextStyle.normal10style.copyWith(
                            fontSize: 6.sp,
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
                                :   PrimaryButton(
                          width: 54.w,
                          label: 'Save',
                          borderRadius: 6.r,
                          onTap: () async{

                              var response = await controller
                                  .postVisitUpdate(
                                visitId: widget.visitId,
                                rejectedReason:
                                "",
                                isVisitAccepted: true,
                              );
                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                Get.back();
                                showSucessDialog(
                                  context: context,
                                  message:
                                  'Visit accepted successfully',
                                  title: 'Successfully',
                                );
                                controller.fetchRecordType();
                                //Get.to(() => HomeScreen());
                              } else {
                                print('Validation failed');
                              }

                          },
                          padding: EdgeInsets.zero,
                          labelStyle: AppTextStyle.normal10style.copyWith(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                  ),
                  customHeight(12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

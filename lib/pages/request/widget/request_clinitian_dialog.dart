import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/common/hex_color_decoder.dart';
import '../../../utils/validator.dart';

class AssignRequestClinitianDialogWidget extends StatefulWidget {
  const AssignRequestClinitianDialogWidget({super.key});

  @override
  State<AssignRequestClinitianDialogWidget> createState() =>
      _AssignRequestClinitianDialogWidgetState();
}

class _AssignRequestClinitianDialogWidgetState
    extends State<AssignRequestClinitianDialogWidget> {
  ProfileController controller = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 300.h,
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Column(
            children: [
              // ✅ HEADER (fixed)
              Row(
                children: [
                  Text(
                    'Assign Visit To Assistant',
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(AppAsset.closeSvgIcon, width: 12.w),
                  ),
                ],
              ),

              customHeight(12.h),

              // ✅ BODY (scrollable)
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        20,
                            (index) => Obx(
                              () => InkWell(
                            onTap: () {
                              controller.selectedIndex.value = index;
                            },
                            borderRadius: BorderRadius.circular(6.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == index
                                    ? AppColors.appYellowColor.withOpacity(0.15) // ✅ light highlight
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 3),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 50.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          child: Image.asset(
                                            AppAsset.avatarImg,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 19.h,
                                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: AppColors.appYellowColor,
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              "RN",
                                              style: AppTextStyle.normal10style
                                                  .copyWith(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    customWidth(10.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "John Doe",
                                          style: AppTextStyle.normal12style.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Put your dropdown / textfields here too (they will scroll)
                      // customHeight(10.h),
                      // Obx(() => PrimaryDropDown(...)),
                      // customHeight(10.h),
                      // PrimaryTextField(...),
                    ],
                  ),
                ),
              ),

              customHeight(12.h),

              // ✅ FOOTER BUTTON (fixed)
              PrimaryButton(
                label: 'Assign',
                width: double.infinity,
                borderRadius: 6.r,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                labelStyle: AppTextStyle.normal12style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

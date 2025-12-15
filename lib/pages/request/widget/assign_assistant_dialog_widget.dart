import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssignAssistantDialogWidget extends StatefulWidget {
  const AssignAssistantDialogWidget({super.key});

  @override
  State<AssignAssistantDialogWidget> createState() =>
      _AssignAssistantDialogWidgetState();
}

class _AssignAssistantDialogWidgetState
    extends State<AssignAssistantDialogWidget> {
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
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppAsset.closeSvgIcon, width: 12.w),
                  ),
                ],
              ),
              customHeight(12.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  children: [
                    PrimaryDropDown(
                      hintText: 'Assistant Name',
                      iconStyleData: IconStyleData(
                        icon: SvgPicture.asset(AppAsset.downArrowFillSvgIcon),
                      ),
                      filledColor: Colors.white,
                      style: AppTextStyle.normal12style.copyWith(
                        color: AppColors.greyColor,
                      ),
                      // prefixIconConstraints: BoxConstraints(maxWidth: 40.w),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          AppAsset.profileSvgIcon,
                          colorFilter: Color(0xff9CA3AF).getSvgColor,
                          width: 12.w,
                        ),
                      ),
                      onChanged: (value) {},
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderGrey,
                          width: 1.w,
                        ),
                      ),
                    ),
                    customHeight(10.h),
                    PrimaryTextField(
                      hintText: 'Assistant Email',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          AppAsset.emailSvgIcon,
                          colorFilter: Color(0xff9CA3AF).getSvgColor,
                          width: 12.w,
                        ),
                      ),
                      filledColor: Colors.white,
                      style: AppTextStyle.normal12style.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    customHeight(20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: PrimaryButton(
                        label: 'Assign',
                        width: 93.w,
                        borderRadius: 6.r,
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        labelStyle: AppTextStyle.normal12style.copyWith(
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
    );
  }
}

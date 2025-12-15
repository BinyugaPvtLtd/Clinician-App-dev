import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeeRouteDialog extends StatefulWidget {
  const SeeRouteDialog({super.key});

  @override
  State<SeeRouteDialog> createState() => _SeeRouteDialogState();
}

class _SeeRouteDialogState extends State<SeeRouteDialog> {
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
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: PrimaryDropDown(
                            hintText: 'Select Patient',
                            iconStyleData: IconStyleData(
                              icon: SvgPicture.asset(
                                AppAsset.downArrowFillSvgIcon,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffD1D5DB),
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6.r),
                                  bottomRight: Radius.circular(6.r),
                                ),
                              ),
                              elevation: 0,
                            ),
                            filledColor: Colors.white,
                            style: AppTextStyle.normal12style.copyWith(
                              color: AppColors.greyColor,
                            ),
                            onChanged: (value) {},
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.borderGrey,
                                width: 1.w,
                              ),
                            ),
                            items: List.generate(4, (index) {
                              var list = [
                                ' 1    Guy Hawkins',
                                ' 2    Savannah Nguyen',
                                ' 3    Dianne Russell',
                                ' 4    Floyd Miles',
                              ];
                              return DropdownMenuItem(
                                value: list[index],
                                child: Text(
                                  list[index],
                                  style: AppTextStyle.normal12style.copyWith(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              customHeight(20.h),
              PrimaryButton(
                width: 80.w,
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                label: 'View Route',
                labelStyle: AppTextStyle.normal10style.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

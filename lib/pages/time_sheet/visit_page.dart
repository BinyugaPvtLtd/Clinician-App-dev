import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/pages/calender_section/widget/calender_date_pick_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Today , 25 December 2024",
                  style: AppTextStyle.normal12style.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                PrimaryOutlinedButton(
                  text: "Choose Date",
                  onPressed: () {
                    Get.dialog(CalenderDatePickDialogWidget());
                  },
                  isIconStart: true,
                  icon: Icon(Icons.calendar_month_sharp, color: AppColors.grey),
                  textStyle: AppTextStyle.regular10style.copyWith(
                    color: AppColors.grey,
                  ),
                  buttonColor: AppColors.grey,
                  borderWidth: 1,
                  width: 120,
                  height: 28.h,
                  radius: 6,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.chatGreenColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Completed",
                            style: AppTextStyle.normal10style.copyWith(
                              color: AppColors.greenColor,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      customHeight(6.h),
                      Row(
                        children: [
                          index.isEven
                              ? CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(AppAsset.avatarImg),
                              )
                              : Container(
                                height: 50.h,
                                width: 60.w,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(AppAsset.carSvgIcon),
                              ),
                          customWidth(10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            index.isEven
                                                ? "John Scott"
                                                : "Going for Office Visit",
                                            style: AppTextStyle.normal12style
                                                .copyWith(
                                                  color:
                                                      AppColors.textGreyColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          if (index.isEven)
                                            Text(
                                              'Anxiety',
                                              style: AppTextStyle.normal12style
                                                  .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "9.00AM-11.00AM",
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            color: AppColors.textGreyColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "3891 Ranchview Dr. Richardson, California 62639",
                                  style: AppTextStyle.normal10style.copyWith(
                                    color: AppColors.textGreyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

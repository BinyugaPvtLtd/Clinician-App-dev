import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/model/key_value_model.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:clinician_app/pages/request/visit_doc_upload_page.dart';
import 'package:clinician_app/pages/request/widget/accept_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/assign_assistant_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reject_dialog_widget.dart';
import 'package:clinician_app/pages/request/widget/reschedule_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VisitDetailPage extends StatefulWidget {
  const VisitDetailPage({super.key});

  @override
  State<VisitDetailPage> createState() => _VisitDetailPageState();
}

class _VisitDetailPageState extends State<VisitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            customHeight(14.h),
            Row(
              children: [
                customWidth(24.w),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.defaultTxtGrey,
                  ),
                ),
                customWidth(15.w),
                Text(
                  'Visit Details',
                  style: AppTextStyle.normal14style.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultTxtGrey,
                  ),
                ),
              ],
            ),
            customHeight(14.h),
            CommonDivider(),
            customHeight(14.h),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 56.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    AppAsset.avatarImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                customWidth(10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lucas Jackson',
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                    ),
                                    Text(
                                      'Anxiety',
                                      style: AppTextStyle.normal12style
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.defaultTxtGrey,
                                          ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '2x4',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ],
                            ),
                            customHeight(10.h),
                            Text(
                              'Lorem Ipsum about',
                              style: AppTextStyle.normal12style,
                            ),
                            customHeight(10.h),
                            Row(
                              children: [
                                SvgPicture.asset(AppAsset.locationFillSvgIcon),
                                customWidth(4.w),
                                Text(
                                  '132 My Street, Kingston, New York 12401',
                                  style: AppTextStyle.normal12style.copyWith(
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ],
                            ),
                            customHeight(10.h),
                            Text(
                              'Plan Of Care',
                              style: AppTextStyle.normal12style.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGreyColor,
                              ),
                            ),
                            Row(
                              children: [
                                ...List.generate(3, (index) {
                                  var list = [
                                    KeyValueModel(key: 'OT', value: 'FEBD4D'),
                                    KeyValueModel(key: 'PT', value: 'F6928A'),
                                    KeyValueModel(key: 'ST', value: '527FB9'),
                                  ];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.h,
                                      horizontal: 4.w,
                                    ),
                                    width: 23.w,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 2.w),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        int.tryParse(
                                              '0xff${list[index].value}',
                                            ) ??
                                            0,
                                      ),
                                      borderRadius: BorderRadius.circular(2.r),
                                    ),
                                    child: Text(
                                      list[index].key,
                                      style: AppTextStyle.normal10style
                                          .copyWith(color: Colors.white),
                                    ),
                                  );
                                }),
                                Spacer(),
                                PrimaryOutlinedButton(
                                  height: 35.h,
                                  onPressed: () {
                                    Get.dialog(AssignAssistantDialogWidget());
                                  },
                                  radius: 6.r,
                                  width: 150.w,
                                  borderWidth: 0.8.w,
                                  text: 'Assign to Assistant',
                                  padding: EdgeInsets.symmetric(),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 6.w,
                                  //   vertical: 6.h,
                                  // ),
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.primaryAppColor,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                            customHeight(10.h),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(color: Color(0xffEFF9FD)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visit Instructions / Precautions',
                            style: AppTextStyle.normal14style.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          customWidth(10.w),
                          ...List.generate(4, (index) {
                            var list = [
                              '🔒 Gate Might Be Locked – Call for Access',
                              '🚫 Avoid Strong Perfumes or Scents',
                              '🧴 Sanitize Hands Before Entry',
                              '👟 Remove Shoes Before Entering',
                            ];
                            return Text(
                              list[index],
                              style: AppTextStyle.normal12style.copyWith(
                                fontSize: 11.sp,
                                color: Color(0xff686464),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Other Clinicians',
                              style: AppTextStyle.normal12style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textGreyColor,
                              ),
                            ),
                            customHeight(10.h),
                            Flexible(
                              child: ListView.separated(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return customHeight(10.h);
                                },
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        height: 51.h,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: 46.h,
                                              width: 46.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.asset(
                                                AppAsset.avatarImg,
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 2.5.w,
                                                  vertical: 2.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 0.75.h),
                                                      blurRadius: 1.5.r,
                                                      color: Colors.black
                                                          .withValues(
                                                            alpha: 0.25,
                                                          ),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        3.r,
                                                      ),
                                                  color:
                                                      AppColors.appYellowColor,
                                                ),
                                                child: Text(
                                                  'OT',
                                                  style: AppTextStyle
                                                      .normal10style
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      customWidth(15.w),
                                      Expanded(
                                        child: Text(
                                          'John Bark',
                                          style: AppTextStyle.normal12style
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.defaultTxtGrey,
                                              ),
                                        ),
                                      ),
                                      customWidth(8.h),
                                      SvgPicture.asset(
                                        AppAsset.callFillSvgIcon,
                                        width: 19.w,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            customHeight(12.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: PrimaryOutlinedButton(
                                height: 35.h,
                                borderWidth: 0.8.w,
                                onPressed: () {},
                                radius: 6.r,
                                width: 150.w,
                                text: 'Request For Clinician',
                                padding: EdgeInsets.symmetric(),
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: 6.w,
                                //   vertical: 6.h,
                                // ),
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.primaryAppColor,
                                  size: 15,
                                ),
                              ),
                            ),
                            customHeight(12.h),

                            Flexible(
                              child: ListView.separated(
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return CommonDivider();
                                },
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      if (index < 2) {
                                        Get.to(() => VisitDocUploadPage());
                                      }
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        customHeight(8.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Week ${index + 1}',
                                              style: AppTextStyle.normal12style
                                                  .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors
                                                            .defaultTxtGrey,
                                                  ),
                                            ),
                                            customWidth(5.w),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2.h,
                                                horizontal: 8.w,
                                              ),
                                              // width: 15.w,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                right: 2.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.chatGreenColor,
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                              ),
                                              child: Text(
                                                'SOC',
                                                style: AppTextStyle
                                                    .normal10style
                                                    .copyWith(
                                                      fontSize: 7.sp,
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        customHeight(8.h),
                                        ...List.generate(2, (inx) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4.w,
                                              vertical: 4.h,
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppAsset.scheduleSvgIcon,
                                                  width: 15.w,
                                                  colorFilter:
                                                      index > 2
                                                          ? null
                                                          : index == 2
                                                          ? AppColors
                                                              .greenColor
                                                              .getSvgColor
                                                          : AppColors
                                                              .greyColor
                                                              .getSvgColor,
                                                ),
                                                customWidth(8.5.w),
                                                Text(
                                                  '09-05-2023',
                                                  style: AppTextStyle
                                                      .normal12style
                                                      .copyWith(
                                                        color:
                                                            index > 2
                                                                ? AppColors
                                                                    .defaultTxtGrey
                                                                : index == 2
                                                                ? AppColors
                                                                    .greenColor
                                                                : AppColors
                                                                    .greyColor,
                                                      ),
                                                ),
                                                customWidth(7.w),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 3.h,
                                                    horizontal: 3.w,
                                                  ),
                                                  width: 15.w,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                    right: 2.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors
                                                            .appYellowColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          2.r,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'OT',
                                                    style: AppTextStyle
                                                        .normal10style
                                                        .copyWith(
                                                          fontSize: 7.sp,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                ),
                                                Spacer(),
                                                if (index < 2) ...[
                                                  SvgPicture.asset(
                                                    AppAsset.checkDoneSvgIcon,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          AppColors.hintGrey,
                                                          BlendMode.srcIn,
                                                        ),
                                                  ),
                                                  customWidth(5.w),
                                                ],
                                                Text(
                                                  '9.00AM-11.00AM',
                                                  style: AppTextStyle
                                                      .normal12style
                                                      .copyWith(
                                                        color:
                                                            index > 2
                                                                ? AppColors
                                                                    .defaultTxtGrey
                                                                : index == 2
                                                                ? AppColors
                                                                    .greenColor
                                                                : AppColors
                                                                    .greyColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ChatFABWidget(),
        bottomNavigationBar: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: AppColors.defaultTxtGrey)),
          ),
          alignment: Alignment.topCenter,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.only(top: 10.h),

            child: Row(
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    radius: 6.r,
                    text: 'Reject',
                    buttonColor: AppColors.rejectionRedColor,
                    onPressed: () {
                      Get.dialog(RejectDialogWidget());
                    },
                    textStyle: AppTextStyle.normal12style.copyWith(
                      color: AppColors.rejectionRedColor,
                    ),
                  ),
                ),
                customWidth(5.w),
                Expanded(
                  child: PrimaryOutlinedButton(
                    radius: 6.r,
                    text: 'Reschedule',
                    buttonColor: AppColors.primaryAppColor,
                    onPressed: () {
                      Get.dialog(RescheduleDialogWidget());
                    },
                    textStyle: AppTextStyle.normal12style.copyWith(
                      color: AppColors.primaryAppColor,
                    ),
                  ),
                ),
                customWidth(5.w),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Get.dialog(AcceptDialogWidget());
                    },
                    padding: EdgeInsets.all(0),
                    label: 'Accept',
                    borderRadius: 6.r,
                    labelStyle: AppTextStyle.normal12style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    buttonColor: Color(0xff2ED8B6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

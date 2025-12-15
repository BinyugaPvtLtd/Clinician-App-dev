import 'dart:io';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VisitDocUploadPage extends StatefulWidget {
  const VisitDocUploadPage({super.key});

  @override
  State<VisitDocUploadPage> createState() => _VisitDocUploadPageState();
}

class _VisitDocUploadPageState extends State<VisitDocUploadPage> {
  RxList<File> uploadImgList = <File>[].obs;
  RxList<File> captureImgList = <File>[].obs;

  Future<File?> pickImage(ImageSource source) async {
    try {
      var file = await ImagePicker().pickImage(source: source);
      if (file == null) {
        return null;
      }
      return File(file.path);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 60.h,
          padding: EdgeInsets.fromLTRB(35.w, 0, 35.w, 27.h),
          child: Row(
            children: [
              Expanded(
                child: PrimaryOutlinedButton(
                  text: 'Cancel',
                  onPressed: () {},
                  radius: 6.r,
                  borderWidth: 0.8.w,
                  textStyle: AppTextStyle.normal14style.copyWith(
                    color: AppColors.primaryAppColor,
                  ),
                ),
              ),
              customWidth(10.w),
              Expanded(
                child: PrimaryButton(
                  label: 'Save',
                  borderRadius: 6.r,
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  labelStyle: AppTextStyle.normal14style.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Visit-1',
                  style: AppTextStyle.normal14style.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultTxtGrey,
                  ),
                ),
              ],
            ),
            customHeight(14.h),
            CommonDivider(),
            customHeight(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit 1 (Week - 1)',
                    style: AppTextStyle.normal10style.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  customHeight(15.h),
                  Row(
                    children: [
                      Container(
                        width: 56.w,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          AppAsset.avatarImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      customWidth(12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lucas Jackson',
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                          Text(
                            'Anxiety',
                            style: AppTextStyle.normal12style.copyWith(
                              fontWeight: FontWeight.w300,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 100.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Color(0xff87C38A),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'SOC',
                          style: AppTextStyle.normal10style.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            customHeight(11.h),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 28.h),
                decoration: BoxDecoration(
                  color: AppColors.borderGrey.withValues(alpha: 0.21),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ...List.generate(3, (index) {
                          if (index == 1) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                customWidth(12.w),
                                Text(
                                  'or',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                customWidth(12.w),
                              ],
                            );
                          }
                          return Expanded(
                            child: Column(
                              children: [
                                Text(
                                  index == 0
                                      ? 'Upload Photos'
                                      : 'Capture photo',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textGreyColor,
                                  ),
                                ),
                                customHeight(12.h),
                                DottedBorder(
                                  dashPattern: [5, 3],
                                  radius: Radius.circular(8.r),
                                  borderType: BorderType.RRect,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Obx(
                                      () => Visibility(
                                        visible:
                                            (index == 0
                                                    ? uploadImgList
                                                    : captureImgList)
                                                .isEmpty,
                                        replacement: GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: ((index == 0
                                                          ? uploadImgList
                                                          : captureImgList)
                                                      .length +
                                                  1)
                                              .clamp(0, 4),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 11.w,
                                            vertical: 10.h,
                                          ),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 39.h,
                                                crossAxisSpacing: 6.w,
                                                mainAxisSpacing: 6.h,
                                              ),
                                          itemBuilder: (context, inx) {
                                            var list =
                                                index == 0
                                                    ? uploadImgList
                                                    : captureImgList;
                                            // if(index==list.length-1){
                                            //   return ;
                                            // }
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffEAEAEA),
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                              child:
                                                  inx == list.length
                                                      ? InkWell(
                                                        onTap: () async {
                                                          var file =
                                                              await pickImage(
                                                                index == 0
                                                                    ? ImageSource
                                                                        .gallery
                                                                    : ImageSource
                                                                        .camera,
                                                              );
                                                          if (file == null) {
                                                            return;
                                                          }
                                                          if (index == 0) {
                                                            uploadImgList.add(
                                                              file,
                                                            );
                                                            uploadImgList
                                                                .refresh();
                                                          } else {
                                                            captureImgList.add(
                                                              file,
                                                            );
                                                            captureImgList
                                                                .refresh();
                                                          }
                                                        },
                                                        child: Icon(Icons.add),
                                                      )
                                                      : Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 6.w,
                                                              vertical: 6.h,
                                                            ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .centerRight,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (index ==
                                                                      0) {
                                                                    uploadImgList
                                                                        .removeAt(
                                                                          inx,
                                                                        );
                                                                    uploadImgList
                                                                        .refresh();
                                                                  } else {
                                                                    captureImgList
                                                                        .removeAt(
                                                                          inx,
                                                                        );
                                                                    captureImgList
                                                                        .refresh();
                                                                  }
                                                                },
                                                                child: SvgPicture.asset(
                                                                  AppAsset
                                                                      .closeSvgIcon,
                                                                  width: 6.w,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                list[inx].path
                                                                    .split('/')
                                                                    .last,
                                                                style: AppTextStyle
                                                                    .normal10style
                                                                    .copyWith(
                                                                      fontSize:
                                                                          6.sp,
                                                                      color: Color(
                                                                        0xff7E7E7E,
                                                                      ),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                            );
                                          },
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            var file = await pickImage(
                                              index == 0
                                                  ? ImageSource.gallery
                                                  : ImageSource.camera,
                                            );
                                            if (file == null) return;
                                            if (index == 0) {
                                              uploadImgList.add(file);
                                              uploadImgList.refresh();
                                            } else {
                                              captureImgList.add(file);
                                              captureImgList.refresh();
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 82.h,
                                                width: 89.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffEAEAEA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        4.r,
                                                      ),
                                                ),
                                                alignment: Alignment.center,
                                                child: SvgPicture.asset(
                                                  index == 0
                                                      ? AppAsset
                                                          .galleyImageSvgIcon
                                                      : AppAsset.cameraSvgIcon,
                                                  colorFilter:
                                                      Color(
                                                        0xff898989,
                                                      ).getSvgColor,
                                                ),
                                              ),
                                              customHeight(17.h),
                                              Text(
                                                index == 0
                                                    ? 'Upload here'
                                                    : 'Capture here',
                                                style: AppTextStyle
                                                    .normal10style
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors
                                                              .primaryAppColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                customHeight(27.h),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    PrimaryTextField(
                      hintText: 'Add notes',
                      hintStyle: AppTextStyle.normal10style.copyWith(
                        color: AppColors.hintGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 4,
                    ),
                    customHeight(15.h),
                    PrimaryButton(
                      padding: EdgeInsets.symmetric(vertical: 11.h),
                      label: 'Upload your audio here',
                      borderRadius: 8.r,
                      buttonColor: Color(0xff50B5E5).withValues(alpha: 0.12),
                      labelStyle: AppTextStyle.normal10style.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryAppColor,
                      ),
                      icon: SvgPicture.asset(
                        AppAsset.microphoneSvgIcon,
                        colorFilter: AppColors.primaryAppColor.getSvgColor,
                        width: 12.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

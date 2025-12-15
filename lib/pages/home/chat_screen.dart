// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/home/widget/chat_element_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.isGroup});
  final bool isGroup;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chatDummyList = [
    ChatModel(
      msg: 'Lorem Ipsum is simply dummy ',
      isSender: false,
      time: DateTime.now(),
    ),
    ChatModel(
      msg:
          'Lorem Ipsum is simply dummy  text of the printing and typesetting industry.',
      isSender: true,
      time: DateTime.now(),
    ),
    ChatModel(
      msg: 'Lorem Ipsum is simply dummy ',
      isSender: false,
      time: DateTime.now().add(Duration(days: -1)),
    ),
    ChatModel(
      msg:
          'Lorem Ipsum is simply dummy  text of the printing and typesetting industry.',
      isSender: true,
      time: DateTime.now().add(Duration(days: -1)),
    ),
    ChatModel(
      msg:
          'Lorem Ipsum is simply dummy  text of the printing and typesetting industry.',
      isSender: true,
      time: DateTime.now().add(Duration(days: -1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            customHeight(13.h),
            Row(
              children: [
                customWidth(21.w),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.defaultTxtGrey,
                    size: 18,
                  ),
                ),
                customWidth(12.w),
                SizedBox(
                  width: 45.w,
                  height: 40.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 40.w,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          AppAsset.chatAvatarImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (!widget.isGroup)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.chatRedColor,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'OT',
                              style: AppTextStyle.normal12style.copyWith(
                                fontSize: 9.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                customWidth(18.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '42657845 John Scott PT',
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.defaultTxtGrey,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.isGroup)
                        Row(
                          children: [
                            ...List.generate(3, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 4.w,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      index == 0
                                          ? AppColors.appYellowColor
                                          : AppColors.chatRedColor,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Text(
                                  index == 0 ? 'OT' : 'PT',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontSize: 9.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(3, (index) {
                      var list = [
                        AppAsset.videoCallSvgIcon,
                        AppAsset.audioCallSvgIcon,
                        AppAsset.threeDotSvgIcon,
                      ];
                      return Container(
                        width: 29.w,
                        height: 29.h,
                        margin: EdgeInsets.only(right: 6.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF3F3F3),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(list[index]),
                      );
                    }),
                  ],
                ),
                customWidth(10.w),
              ],
            ),
            customHeight(16.h),
            CommonDivider(),
            Expanded(
              child: GroupedListView(
                reverse: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                elements: [...chatDummyList, ...chatDummyList],
                groupBy: (element) {
                  return CommonMethods.formatDateWithDate(element.time);
                },
                itemBuilder: (context, element) {
                  return ChatElementWidget(
                    isGroup: widget.isGroup,
                    chat: element,
                  );
                },
                groupSeparatorBuilder: (value) {
                  return Container(
                    height: 30.h,
                    alignment: Alignment.center,
                    child: Text(
                      value,
                      style: AppTextStyle.normal12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: Offset(0, 6.4.w),
                            blurRadius: 13.8.r,
                          ),
                        ],
                      ),
                      child: PrimaryTextField(
                        hintText: 'Type a message',
                        hintStyle: AppTextStyle.normal10style.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.defaultTxtGrey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAsset.emojiSvgIcon),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(3, (index) {
                              var list = [
                                AppAsset.attachSvgIcon,
                                AppAsset.sendMsgSvgIcon,
                                AppAsset.downArrowFillSvgIcon,
                              ];
                              return Container(
                                width: 20.w,
                                height: 20.h,
                                margin: EdgeInsets.only(right: 9.w),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(list[index]),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  customWidth(10.w),
                  Container(
                    height: 36.h,
                    width: 36.w,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AppAsset.microphoneSvgIcon),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatModel {
  final String msg;
  final bool isSender;
  final DateTime time;
  ChatModel({required this.msg, required this.isSender, required this.time});
}

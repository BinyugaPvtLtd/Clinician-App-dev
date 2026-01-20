// ===========================
// chat_screen.dart
// ===========================

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

import '../../controller/chat_controller.dart';// <-- update import path as per your project
import '../../model/chatScreen/chatList_model.dart';
import '../../model/chatScreen/empChat_model.dart';
import '../../model/chatScreen/groupChat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.isGroup,
    this.ptGroupId,
    this.otherEmpId, required this.title, required this.avatarUrl,
    // ✅ NEW
    this.abbrList,
  });
  final String title;
  final String avatarUrl;
  final bool isGroup;


  // ✅ for group chat
  final int? ptGroupId;
  final List<AbbrChipModel>? abbrList;
  // ✅ for emp chat
  final int? otherEmpId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatDataController controller = Get.find<ChatDataController>();

  @override
  void initState() {
    super.initState();

    controller.startChatScreenListening(
      isGroup: widget.isGroup,
      ptGroupId: widget.ptGroupId,
      otherEmpId: widget.otherEmpId,
      pageNo: 1,
      rows: 99999,
    );
  }

  @override
  void dispose() {
    controller.stopChatScreenListening();
    super.dispose();
  }

  // ===========================
// IMPORTANT: Update mappers in ChatScreen to fill senderName + senderAvatarUrl
// ===========================

// GROUP chat mapper (use sender in your Message model)
  List<ChatModel> _mapGroupMessages(PatientGroupChatData? data) {
    if (data == null) return [];

    return data.messages.map((m) {
      final dt = DateTime.tryParse(m.dateCreated) ?? DateTime.now();

      final senderName =
      '${m.sender.firstName} ${m.sender.lastName}'.trim();

      return ChatModel(
        msg: m.textContent,
        isSender: false, // if you have isMine in group then replace here
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: m.sender.imgUrl.isEmpty ? null : m.sender.imgUrl,
      );
    }).toList();
  }

// EMP chat mapper (senderName optional, avatar optional)
  List<ChatModel> _mapEmpMessages(ChatDepartmentGroupCommunicationData? data) {
    if (data == null) return [];

    return data.messages.map((m) {
      final dt = DateTime.tryParse(m.dateCreated) ?? DateTime.now();

      final senderName =
      '${m.sender.firstName} ${m.sender.lastName}'.trim();

      return ChatModel(
        msg: m.textContent,
        isSender: m.isMine,
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: (m.sender.imgUrl.isEmpty) ? null : m.sender.imgUrl,
      );
    }).toList();
  }
  Color hexToColor(String? hex) {
    if (hex == null || hex.trim().isEmpty) return AppColors.chatRedColor;

    String value = hex.trim();

    // Accept "#RRGGBB"
    if (value.startsWith("#")) {
      value = value.replaceFirst("#", "");
      return Color(int.parse("0xFF$value"));
    }

    // Accept "0xffRRGGBB" or "0xFFRRGGBB"
    if (value.startsWith("0x") || value.startsWith("0X")) {
      return Color(int.parse(value));
    }

    // fallback: raw "RRGGBB"
    if (value.length == 6) {
      return Color(int.parse("0xFF$value"));
    }

    return AppColors.chatRedColor;
  }


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
                  onTap: () => Get.back(),
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
                        height: 40.w,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: (widget.avatarUrl != null && widget.avatarUrl!.trim().isNotEmpty)
                            ? Image.network(
                          widget.avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.asset(
                            AppAsset.chatAvatarImg,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset(
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
                              controller.groupChatData.value!.participants[1].employeeTypeAbbreviation!,
                              style: AppTextStyle.normal12style.copyWith(
                                fontSize: 9.sp,
                                color: hexToColor(controller.groupChatData.value!.participants[1].employeeTypeColor),
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
                        widget.title, // ✅ selected name / group name
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.defaultTxtGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      if (widget.isGroup)
                        Obx(() {
                          final data = controller.groupChatData.value;

                          // ✅ chips from API participants (SHOW ALL)
                          final chips = <AbbrChipModel>[];

                          if (data != null) {
                            for (final p in data.participants) {
                              final abbr =
                              (p.employeeTypeAbbreviation ?? '').toString().trim();
                              final colorHex = p.employeeTypeColor?.toString();

                              if (abbr.isNotEmpty) {
                                chips.add(
                                  AbbrChipModel(
                                    abbr: abbr,
                                    color: hexToColor(colorHex),
                                  ),
                                );
                              }
                            }
                          }

                          if (chips.isEmpty) return const SizedBox();

                          return SizedBox(
                            height: 18.h, // ✅ small height for chips row
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: chips.length,
                              separatorBuilder: (context, index) => SizedBox(width: 4.w),
                              itemBuilder: (context, index) {
                                final chip = chips[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.h,
                                    horizontal: 6.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: chip.color,
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                  child: Text(
                                    chip.abbr,
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontSize: 9.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),


                    ],
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(3, (index) {
                      final list = [
                        AppAsset.videoCallSvgIcon,
                        AppAsset.audioCallSvgIcon,
                        AppAsset.threeDotSvgIcon,
                      ];
                      return Container(
                        width: 29.w,
                        height: 29.h,
                        margin: EdgeInsets.only(right: 6.w),
                        decoration: const BoxDecoration(
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
            const CommonDivider(),

            // ===================== MESSAGES UI =====================
            Expanded(
              child: Obx(() {
                if (controller.isLoadingChatScreen.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.chatScreenError.value.isNotEmpty) {
                  return Center(child: Text(controller.chatScreenError.value));
                }

                final elements = widget.isGroup
                    ? _mapGroupMessages(controller.groupChatData.value)
                    : _mapEmpMessages(controller.empChatData.value);

                if (elements.isEmpty) {
                  return const Center(child: Text("No messages"));
                }

                return GroupedListView<ChatModel, String>(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  elements: elements,
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
                );
              }),
            ),

            // ===================== INPUT =====================
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
                              final list = [
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
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
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
  final String? senderName;        // ✅ for group chat
  final String? senderAvatarUrl;   // ✅ for group chat

  ChatModel({
    required this.msg,
    required this.isSender,
    required this.time,
    this.senderName,
    this.senderAvatarUrl,
  });
}

// ===========================
// chat_screen.dart  (NO DATE HEADERS, ONLY MSG)
// ===========================

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/home/widget/chat_element_widget.dart';

import '../../controller/chat_controller.dart'; // <-- update path
import '../../core/common/calling_class.dart';
import '../../model/chatScreen/chatList_model.dart';
import '../../model/chatScreen/empChat_model.dart';
import '../../model/chatScreen/groupChat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.isGroup,
    this.ptGroupId,
    this.otherEmpId,
    required this.title,
    required this.avatarUrl,
    this.abbrList,
    required this.userId,
  });

  final String title;
  final String avatarUrl;
  final bool isGroup;
  final int userId;

  final int? ptGroupId;
  final int? otherEmpId;

  final List<AbbrChipModel>? abbrList;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatDataController controller = Get.find<ChatDataController>();
  final TextEditingController sendMessageController = TextEditingController();

  // ✅ Local optimistic messages (shows immediately after send)
  final RxList<ChatModel> _pendingLocal = <ChatModel>[].obs;

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
    sendMessageController.dispose();
    super.dispose();
  }

  // ===========================
  // MAPPERS
  // ===========================
  List<ChatModel> _mapGroupMessages(PatientGroupChatData? data) {
    if (data == null) return [];

    return data.messages.map((m) {
      final dt = DateTime.tryParse(m.dateCreated) ?? DateTime.now();
      final senderName = '${m.sender.firstName} ${m.sender.lastName}'.trim();

      return ChatModel(
        msg: m.textContent,
        isSender: false, // backend doesn't give isMine for group
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: m.sender.imgUrl.isEmpty ? null : m.sender.imgUrl,
        localTempId: null,
      );
    }).toList();
  }

  List<ChatModel> _mapEmpMessages(ChatDepartmentGroupCommunicationData? data) {
    if (data == null) return [];

    return data.messages.map((m) {
      final dt = DateTime.tryParse(m.dateCreated) ?? DateTime.now();
      final senderName = '${m.sender.firstName} ${m.sender.lastName}'.trim();

      return ChatModel(
        msg: m.textContent,
        isSender: m.isMine,
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: (m.sender.imgUrl.isEmpty) ? null : m.sender.imgUrl,
        localTempId: null,
      );
    }).toList();
  }

  // ===========================
  // COLOR PARSER
  // ===========================
  Color hexToColor(String? hex) {
    if (hex == null || hex.trim().isEmpty) return AppColors.chatRedColor;

    String value = hex.trim();
    if (value.startsWith("#")) {
      value = value.replaceFirst("#", "");
      return Color(int.parse("0xFF$value"));
    }
    if (value.startsWith("0x") || value.startsWith("0X")) {
      return Color(int.parse(value));
    }
    if (value.length == 6) {
      return Color(int.parse("0xFF$value"));
    }
    return AppColors.chatRedColor;
  }

  // ===========================
  // MERGE API + LOCAL
  // ===========================
  List<ChatModel> _mergeMessages(List<ChatModel> apiMessages, List<ChatModel> local) {
    bool existsInApi(ChatModel loc) {
      for (final api in apiMessages) {
        if (api.isSender != loc.isSender) continue;
        if (api.msg.trim() != loc.msg.trim()) continue;
        final diff = api.time.difference(loc.time).inSeconds.abs();
        if (diff <= 8) return true;
      }
      return false;
    }

    final keptLocal = local.where((l) => !existsInApi(l)).toList();

    final merged = <ChatModel>[
      ...apiMessages,
      ...keptLocal,
    ];

    // newest first (because reverse: true)
    merged.sort((a, b) => b.time.compareTo(a.time));
    return merged;
  }

  // ===========================
  // SEND MESSAGE (Optimistic)
  // ===========================
  Future<void> _handleSend() async {
    final text = sendMessageController.text.trim();
    if (text.isEmpty) return;

    final tempId = '${DateTime.now().microsecondsSinceEpoch}';

    final optimistic = ChatModel(
      msg: text,
      isSender: true,
      time: DateTime.now(),
      localTempId: tempId,
      senderName: null,
      senderAvatarUrl: null,
    );

    _pendingLocal.insert(0, optimistic);
    sendMessageController.clear();

    try {
      if (widget.isGroup) {
        final res = await controller.postSendChatData(
          ptGroupId: controller.groupChatData.value!.groupInfo.ptGroupId,
          textContent: text,
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: 0,
          empTextContent: '',
          isGroup: true,
        );

        if (!(res.statusCode == 200 || res.statusCode == 201)) {
          _pendingLocal.removeWhere((m) => m.localTempId == tempId);
          Get.snackbar('Failed', 'Message not sent');
        }
      } else {
        final res = await controller.postSendChatData(
          ptGroupId: 0,
          textContent: '',
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: controller.empChatData.value!.empInfoData.employeeId,
          empTextContent: text,
          isGroup: false,
        );

        if (!(res.statusCode == 200 || res.statusCode == 201)) {
          _pendingLocal.removeWhere((m) => m.localTempId == tempId);
          Get.snackbar('Failed', 'Message not sent');
        }
      }
    } catch (e) {
      _pendingLocal.removeWhere((m) => m.localTempId == tempId);
      Get.snackbar('Error', e.toString());
    }
  }

  // ===========================
  // UI
  // ===========================
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

                // Avatar
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
                        child: (widget.avatarUrl.trim().isNotEmpty)
                            ? Image.network(
                          widget.avatarUrl,
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
                    ],
                  ),
                ),

                customWidth(18.w),

                // Title + Abbreviations
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppTextStyle.normal12style.copyWith(
                          color: AppColors.defaultTxtGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      if (widget.isGroup)
                        Obx(() {
                          final data = controller.groupChatData.value;

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
                            height: 18.h,
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

                // Call buttons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(3, (index) {
                      final list = [
                        AppAsset.videoCallSvgIcon,
                        AppAsset.audioCallSvgIcon,
                        AppAsset.threeDotSvgIcon,
                      ];
                      return InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: list[index].contains(AppAsset.videoCallSvgIcon)
                            ? () {
                          widget.isGroup
                              ? InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: controller.groupChatData.value!.participants
                                .map((e) => e.userId)
                                .where((id) => id != widget.userId)
                                .toList(),
                            callType: 'GROUP',
                            isVideo: true,
                          )
                              : InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: [controller.empChatData.value!.empInfoData.userId],
                            callType: 'ONE_TO_ONE',
                            isVideo: true,
                          );
                        }
                            : list[index].contains(AppAsset.audioCallSvgIcon)
                            ? () {
                          widget.isGroup
                              ? InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: controller.groupChatData.value!.participants
                                .map((e) => e.userId)
                                .where((id) => id != widget.userId)
                                .toList(),
                            callType: 'GROUP',
                            isVideo: false,
                          )
                              : InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: [controller.empChatData.value!.empInfoData.userId],
                            callType: 'ONE_TO_ONE',
                            isVideo: false,
                          );
                        }
                            : () {},
                        child: Container(
                          width: 29.w,
                          height: 29.h,
                          margin: EdgeInsets.only(right: 6.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF3F3F3),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(list[index]),
                        ),
                      );
                    }),
                  ],
                ),
                customWidth(10.w),
              ],
            ),

            customHeight(16.h),
            const CommonDivider(),

            // ===================== MESSAGES UI (NO DATE HEADERS) =====================
            Expanded(
              child: Obx(() {
                final apiElements = widget.isGroup
                    ? _mapGroupMessages(controller.groupChatData.value)
                    : _mapEmpMessages(controller.empChatData.value);

                final merged = _mergeMessages(apiElements, _pendingLocal);

                if (controller.chatScreenError.value.isNotEmpty && merged.isEmpty) {
                  return Center(child: Text(controller.chatScreenError.value));
                }

                if (controller.isLoadingChatScreen.value && merged.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primaryAppColor),
                  );
                }

                if (merged.isEmpty) {
                  return const Center(child: Text("No messages"));
                }

                return controller.isLoadingChatScreen.value ?Container(
                  color: Colors.white.withValues(alpha: 0.25),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ),
                ) : ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  itemCount: merged.length,
                  itemBuilder: (context, index) {
                    final element = merged[index];
                    return ChatElementWidget(
                      isGroup: widget.isGroup,
                      chat: element,
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
                        controller: sendMessageController,
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

                              return InkWell(
                                onTap: list[index].contains(AppAsset.sendMsgSvgIcon)
                                    ? _handleSend
                                    : () {},
                                child: Container(
                                  width: 20.w,
                                  height: 20.h,
                                  margin: EdgeInsets.only(right: 9.w),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(list[index]),
                                ),
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

// ===========================
// ChatModel
// ===========================
class ChatModel {
  final String msg;
  final bool isSender;
  final DateTime time;
  final String? senderName;
  final String? senderAvatarUrl;
  final String? localTempId;

  ChatModel({
    required this.msg,
    required this.isSender,
    required this.time,
    this.senderName,
    this.senderAvatarUrl,
    this.localTempId,
  });
}

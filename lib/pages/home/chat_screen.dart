// ===========================
// chat_screen.dart  (FULL - UPDATED)
// ✅ Keeps SAME UI
// ✅ FIX: EmojiPicker now shows correctly (WhatsApp style)
//   - Hide keyboard first, then show picker
//   - When picker visible, tapping keyboard icon shows keyboard again
//   - Tapping TextField hides picker
// ✅ Your existing chat logic kept
// ===========================

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ added
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';

import '../../controller/chat_controller.dart';
import '../../core/common/calling_class.dart';
import '../../model/chatScreen/chatList_model.dart';
import '../../model/chatScreen/empChat_model.dart';
import '../../model/chatScreen/groupChat_model.dart';
import '../home/widget/chat_element_widget.dart';

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

  // ✅ optimistic messages
  final RxList<ChatModel> _pendingLocal = <ChatModel>[].obs;

  // ✅ Emoji picker state
  bool showEmojiPicker = false;

  // ✅ Focus node (important)
  final FocusNode _focusNode = FocusNode();

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
    _focusNode.dispose();
    super.dispose();
  }

  // ===========================
  // ✅ FIXED Emoji Toggle (WhatsApp style)
  // ===========================
  Future<void> _toggleEmojiKeyboard() async {
    if (showEmojiPicker) {
      // Emoji visible -> switch to keyboard
      setState(() => showEmojiPicker = false);
      await Future.delayed(const Duration(milliseconds: 50));
      FocusScope.of(context).requestFocus(_focusNode);
      return;
    }

    // Keyboard visible -> hide keyboard, then show emoji picker
    FocusScope.of(context).unfocus();
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    await Future.delayed(const Duration(milliseconds: 80));
    if (!mounted) return;
    setState(() => showEmojiPicker = true);
  }

  // ===========================
  // COLOR PARSER (chips)
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
  // GROUP MAPPER
  // ===========================
  List<ChatModel> _mapGroupMessages(PatientGroupChatData? data) {
    if (data == null) return [];
    return data.messages.map((msg) {
      final dt = DateTime.tryParse(msg.dateCreated) ?? DateTime.now();

      // ✅ YOUR isMe logic
      final bool isMe = (msg.ptUserId == 0)
          ? (msg.ptEmpUserId == widget.userId)
          : (msg.sender.userId == widget.userId);

      final senderName = '${msg.sender.firstName} ${msg.sender.lastName}'.trim();

      return ChatModel(
        msg: msg.textContent,
        isSender: isMe,
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: msg.sender.imgUrl.isEmpty ? null : msg.sender.imgUrl,
        attachments: msg.attachedMultimediaUrls,
        voiceNotes: const [],
      );
    }).toList();
  }

  // ===========================
  // EMP MAPPER
  // ===========================
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
        attachments: m.attachedMultimediaUrl,
        voiceNotes: const [],
      );
    }).toList();
  }

  // ===========================
  // MERGE API + LOCAL
  // ===========================
  List<ChatModel> _mergeMessages(
      List<ChatModel> apiMessages,
      List<ChatModel> local,
      ) {
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
    final merged = <ChatModel>[...apiMessages, ...keptLocal];
    merged.sort((a, b) => b.time.compareTo(a.time)); // newest first
    return merged;
  }

  // ===========================
  // SEND (Optimistic)
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
      attachments: const [],
      voiceNotes: const [],
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
        resizeToAvoidBottomInset: true, // ✅ important
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

                // Title + chips
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
                              final abbr = (p.employeeTypeAbbreviation ?? '')
                                  .toString()
                                  .trim();
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
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 4.w),
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
                            participentId: controller
                                .groupChatData.value!.participants
                                .map((e) => e.userId)
                                .where((id) => id != widget.userId)
                                .toList(),
                            callType: 'GROUP',
                            isVideo: true,
                          )
                              : InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: [
                              controller.empChatData.value!.empInfoData
                                  .userId
                            ],
                            callType: 'ONE_TO_ONE',
                            isVideo: true,
                          );
                        }
                            : list[index].contains(AppAsset.audioCallSvgIcon)
                            ? () {
                          widget.isGroup
                              ? InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: controller
                                .groupChatData.value!.participants
                                .map((e) => e.userId)
                                .where((id) =>
                            id != widget.userId)
                                .toList(),
                            callType: 'GROUP',
                            isVideo: false,
                          )
                              : InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: [
                              controller.empChatData.value!
                                  .empInfoData.userId
                            ],
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

            // ===================== MESSAGES UI =====================
            Expanded(
              child: Obx(() {
                final apiElements = widget.isGroup
                    ? _mapGroupMessages(controller.groupChatData.value)
                    : _mapEmpMessages(controller.empChatData.value);

                final merged = _mergeMessages(apiElements, _pendingLocal);

                if (controller.chatScreenError.value.isNotEmpty &&
                    merged.isEmpty) {
                  return Center(child: Text(controller.chatScreenError.value));
                }

                if (controller.isLoadingChatScreen.value && merged.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryAppColor,
                    ),
                  );
                }

                if (merged.isEmpty) {
                  return const Center(child: Text("No messages"));
                }

                return controller.isLoadingChatScreen.value? Container(
                                color: Colors.white.withValues(alpha: 0.25),
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                color: AppColors.primaryAppColor,
                                ),
                                ) :ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
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

            // ===================== BOTTOM (SAME UI) =====================
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Emoji picker ABOVE input (keeps UI stable)
                Offstage(
                  offstage: !showEmojiPicker,
                  child: SizedBox(
                    height: 256,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        setState(() {
                          sendMessageController.text += emoji.emoji;
                          sendMessageController.selection =
                              TextSelection.fromPosition(
                                TextPosition(
                                  offset: sendMessageController.text.length,
                                ),
                              );
                        });
                      },
                      onBackspacePressed: () {
                        setState(() {
                          final text = sendMessageController.text;
                          if (text.isNotEmpty) {
                            sendMessageController.text =
                                text.characters.skipLast(1).toString();
                            sendMessageController.selection =
                                TextSelection.fromPosition(
                                  TextPosition(
                                    offset: sendMessageController.text.length,
                                  ),
                                );
                          }
                        });
                      },
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                                  ? 1.20
                                  : 1.0),
                        ),
                        viewOrderConfig: const ViewOrderConfig(
                          top: EmojiPickerItem.searchBar,
                          middle: EmojiPickerItem.categoryBar,
                          bottom: EmojiPickerItem.emojiView,
                        ),
                        bottomActionBarConfig: const BottomActionBarConfig(
                          backgroundColor: Colors.white,
                          buttonColor: Colors.white,
                          buttonIconColor: AppColors.primaryAppColor,
                          showBackspaceButton: false,
                        ),
                      ),
                    ),
                  ),
                ),

                // INPUT (your same UI container)
                Container(
                  padding:
                  EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
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
                            focusNode: _focusNode,
                            controller: sendMessageController,

                            // ✅ Tap field -> hide emoji picker
                            onTap: () {
                              if (showEmojiPicker) {
                                setState(() => showEmojiPicker = false);
                              }
                            },

                            hintText: 'Type a message',
                            hintStyle: AppTextStyle.normal10style.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.defaultTxtGrey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(22.r),
                            ),

                            // ✅ SAME UI but fixed logic
                            prefixIcon: IconButton(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                showEmojiPicker
                                    ? Icons.keyboard
                                    : Icons.sentiment_satisfied_alt_outlined,
                              ),
                              onPressed: _toggleEmojiKeyboard, // ✅ FIX
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
                                    onTap:
                                    // list[index]
                                    //     .contains(AppAsset.sendMsgSvgIcon)
                                    //     ? _handleSend
                                    //     :
                                        () {},
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
          ],
        ),
      ),
    );
  }
}

// ===========================
// ChatModel (WhatsApp style support)
// ===========================
class ChatModel {
  final String msg;
  final bool isSender;
  final DateTime time;

  final String? senderName;
  final String? senderAvatarUrl;
  final String? localTempId;

  final List<String> attachments;
  final List<String> voiceNotes;

  ChatModel({
    required this.msg,
    required this.isSender,
    required this.time,
    this.senderName,
    this.senderAvatarUrl,
    this.localTempId,
    this.attachments = const [],
    this.voiceNotes = const [],
  });
}

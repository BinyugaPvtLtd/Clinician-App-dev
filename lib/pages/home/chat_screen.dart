// ===========================
// chat_screen.dart  (FULL - UPDATED)
// ✅ Keeps SAME UI
// ✅ FIX: EmojiPicker now shows correctly (WhatsApp style)
// ✅ ADDED: VoiceNoteBubble support (renders .mpeg voice bubbles)
//    Usage:
//      final voiceNoteUrl = msg.voiceNoteUrl!.where((url) {
//        final lower = url.toLowerCase();
//        return lower.endsWith('.mpeg');
//      }).toList();
//    UI:
//      ...voiceNoteUrl.map((url) => Padding(... VoiceNoteBubble(url: url, isMe: isMe)))
// ===========================

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ added
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

// ✅ ADD THIS (for playback)
// Add dependency if not present:
// just_audio: ^0.9.38
import 'package:just_audio/just_audio.dart';

import '../../controller/chat_controller.dart';
import '../../core/common/audio_decoder.dart';
import '../../core/common/calling_class.dart';
import '../../core/common/const_medipicker.dart';
import '../../core/common/voice_bubble_const.dart';
import '../../model/chatScreen/chatList_model.dart';
import '../../model/chatScreen/empChat_model.dart';
import '../../model/chatScreen/groupChat_model.dart';
import '../../model/request/request_data_model.dart';
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
  bool showFilePick = false;
  bool _isRecording = false;
  int _recordSeconds = 0;
  bool isLoadingVoiceSend = false;
  Timer? _timer;
  final List<Uint8List> selectedFiles = [];
  final List<String> selectedFileNames = [];
  bool _fileAbove20Mb = true;

  void _appendSelectedNamesToInput() {
    final existingText = sendMessageController.text.trim();
    final fileText = selectedFileNames.join(', ');
    sendMessageController.text =
    existingText.isEmpty ? fileText : '$existingText, $fileText';

    sendMessageController.selection = TextSelection.fromPosition(
      TextPosition(offset: sendMessageController.text.length),
    );
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  final AudioRecorder _recorder = AudioRecorder();
  String? _filePath;

  Future<void> startRecording() async {
    final ok = await _recorder.hasPermission();
    if (!ok) return;

    final dir = await getTemporaryDirectory();
    _filePath =
    '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.mpeg';

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      ),
      path: _filePath!,
    );
  }

  void onStartRecording() async {
    setState(() {
      _isRecording = true;
      _recordSeconds = 0;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _recordSeconds++);
    });

    await startRecording();
  }

  Future<String?> stopRecording() async {
    _timer?.cancel();
    setState(() => _isRecording = false);

    final path = await _recorder.stop();

    if (path != null) {
      await sendVoiceNote(path);
    }
    return path;
  }

// ----------------------------------------
// 2) helper: ensure file exists (some plugins return path already)
// ----------------------------------------
  Future<File> _ensureFile(String path) async {
    final f = File(path);
    if (await f.exists()) return f;

    // fallback (should rarely happen)
    final dir = await getTemporaryDirectory();
    final alt = File('${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.mpeg');
    return alt;
  }

// ----------------------------------------
// 3) MAIN: send voice note with your API method
// ----------------------------------------
  Future<void> sendVoiceNote(String audioPath) async {
    try {
      setState(() => isLoadingVoiceSend = true);

      // ✅ recorded file
      final File audioFile = await _ensureFile(audioPath);

      // ✅ filename for backend
      final String fileName =
          "voice_${DateTime.now().millisecondsSinceEpoch}.mpeg";

      // =========================
      // A) SEND MESSAGE FIRST (to get chatId)
      // =========================
      final ApiData msgRes;
      if (widget.isGroup) {
        msgRes = await controller.postSendChatData(
          ptGroupId: controller.groupChatData.value!.groupInfo.ptGroupId,
          textContent: "", // no text for voice note
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: 0,
          empTextContent: "",
          isGroup: true,
        );
      } else {
        msgRes = await controller.postSendChatData(
          ptGroupId: 0,
          textContent: "",
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: controller.empChatData.value!.empInfoData.employeeId,
          empTextContent: "",
          isGroup: false,
        );
      }

      if (!(msgRes.statusCode == 200 || msgRes.statusCode == 201)) {
        Get.snackbar('Failed', 'Voice message not sent');
        return;
      }

      // ✅ MUST be present in ApiData (same as media attachments)
      final int? chatId = msgRes.chatId;
      if (chatId == null || chatId == 0) {
        Get.snackbar('Error', 'ChatId missing for voice upload');
        return;
      }

      // =========================
      // B) UPLOAD VOICE NOTE (your API method)
      // =========================
      final ApiData uploadRes = await controller.postSendVoiceNoteAttachmentUrl(
        chatId: chatId,
        base64File: audioFile,
        documentName: fileName,
        isGroup: widget.isGroup,
        duration: _recordSeconds, // ✅ duration in seconds
      );

      if (!(uploadRes.statusCode == 200 || uploadRes.statusCode == 201)) {
        Get.snackbar('Failed', uploadRes.message);
        return;
      }

      // =========================
      // C) RESET UI STATES
      // =========================
      setState(() {
        isLoadingVoiceSend = false;
        _recordSeconds = 0;
        // if you also used these anywhere:
        selectedFiles.clear();
        selectedFileNames.clear();
        showEmojiPicker = false;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      if (mounted) {
        setState(() => isLoadingVoiceSend = false);
      }
    }
  }
  Future<void> cancel() async {
    _timer?.cancel();
    setState(() => _isRecording = false);
    await _recorder.cancel();
  }

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
      setState(() => showEmojiPicker = false);
      await Future.delayed(const Duration(milliseconds: 50));
      FocusScope.of(context).requestFocus(_focusNode);
      return;
    }

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
  // ✅ Voice Notes extractor (.mpeg only as you requested)
  // ===========================
  List<String> _extractVoiceNotesFromList(List<String>? urls) {
    if (urls == null || urls.isEmpty) return const [];
    return urls.where((url) {
      final lower = url.toLowerCase().trim();
      return lower.endsWith('.mpeg');
    }).toList();
  }

  // If your API sometimes puts voice notes inside "attachments", this safely supports it too.
  List<String> _extractVoiceNotesFromAttachments(List<String> attachments) {
    return attachments.where((url) {
      final lower = url.toLowerCase().trim();
      return lower.endsWith('.mpeg');
    }).toList();
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

      // ✅ Voice notes (from msg.voiceNoteUrl if present, plus fallback from attachments)
      final voiceNoteUrl = _extractVoiceNotesFromList(msg.voiceNoteUrl);
      final attachments = msg.attachedMultimediaUrls;
      final voiceFromAttachments = _extractVoiceNotesFromAttachments(attachments);

      // merge + de-dupe
      final voiceNotes = <String>{
        ...voiceNoteUrl,
        ...voiceFromAttachments,
      }.toList();

      return ChatModel(
        msg: msg.textContent,
        isSender: isMe,
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: msg.sender.imgUrl.isEmpty ? null : msg.sender.imgUrl,
        attachments: attachments,
        voiceNotes: voiceNotes,
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

      // ✅ Voice notes (if your emp model has m.voiceNoteUrl, it’ll be used; otherwise fallback to attachments)
      final voiceNoteUrl = _extractVoiceNotesFromList(m.voiceNoteUrl);
      final attachments = m.attachedMultimediaUrl;
      final voiceFromAttachments = _extractVoiceNotesFromAttachments(attachments);

      final voiceNotes = <String>{
        ...voiceNoteUrl,
        ...voiceFromAttachments,
      }.toList();

      return ChatModel(
        msg: m.textContent,
        isSender: m.isMine,
        time: dt,
        senderName: senderName.isEmpty ? null : senderName,
        senderAvatarUrl: (m.sender.imgUrl.isEmpty) ? null : m.sender.imgUrl,
        attachments: attachments,
        voiceNotes: voiceNotes,
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
  Future<File> _bytesToTempFile(Uint8List bytes, String fileName) async {
    // create a temp file (keeps original extension if provided)
    final dir = await getTemporaryDirectory();
    final safeName = fileName.isEmpty
        ? 'file_${DateTime.now().millisecondsSinceEpoch}'
        : fileName;

    final file = File('${dir.path}/$safeName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
  Future<void> _handleSend() async {
    final text = sendMessageController.text.trim();

    final bool hasAttachments =
        selectedFiles.isNotEmpty && selectedFileNames.length == selectedFiles.length;

    // ✅ allow send if either text OR attachments exist
    if (text.isEmpty && !hasAttachments) return;

    final tempId = '${DateTime.now().microsecondsSinceEpoch}';

    // optimistic shows text; if text empty, show "Attachment" label (optional)
    final optimistic = ChatModel(
      msg: text.isEmpty && hasAttachments ? "Attachment" : text,
      isSender: true,
      time: DateTime.now(),
      localTempId: tempId,
      attachments: const [],
      voiceNotes: const [],
    );

    _pendingLocal.insert(0, optimistic);
    sendMessageController.clear();

    try {
      // =========================
      // 1) SEND MESSAGE FIRST
      // =========================
      final ApiData res;
      if (widget.isGroup) {
        res = await controller.postSendChatData(
          ptGroupId: controller.groupChatData.value!.groupInfo.ptGroupId,
          textContent: text, // can be empty if only attachment
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: 0,
          empTextContent: '',
          isGroup: true,
        );
      } else {
        res = await controller.postSendChatData(
          ptGroupId: 0,
          textContent: '',
          restrictPatientFromView: false,
          sentAsSms: false,
          receiverEmpId: controller.empChatData.value!.empInfoData.employeeId,
          empTextContent: text, // can be empty if only attachment
          isGroup: false,
        );
      }

      if (!(res.statusCode == 200 || res.statusCode == 201)) {
        _pendingLocal.removeWhere((m) => m.localTempId == tempId);
        Get.snackbar('Failed', 'Message not sent');
        return;
      }

      // ✅ IMPORTANT:
      // You MUST have chatId to upload attachments.
      // Your postSendChatData should return chatId (pt_chat_id / emp_chat_id).
      // If your ApiData already has it, use it. Otherwise add it in ApiData.
      final int? chatId = res.chatId; // <-- make sure ApiData contains this

      if (hasAttachments && (chatId == null || chatId == 0)) {
        // message sent but cannot upload attachments without chatId
        Get.snackbar('Error', 'ChatId missing for attachments');
        return;
      }

      // =========================
      // 2) UPLOAD ATTACHMENTS
      // =========================
      if (hasAttachments) {
        for (int i = 0; i < selectedFiles.length; i++) {
          final Uint8List bytes = selectedFiles[i];
          final String name = selectedFileNames[i];

          final File tempFile = await _bytesToTempFile(bytes, name);

          final attachRes = await controller.postSendAttachmentUrl(
            chatId: chatId!,
            base64File: tempFile,
            documentName: name,
            isGroup: widget.isGroup,
          );

          if (!(attachRes.statusCode == 200 || attachRes.statusCode == 201)) {
            Get.snackbar('Attachment Failed', attachRes.message);
            // continue uploading remaining OR stop — your choice
            // break;
          }
        }

        // ✅ clear selected after upload attempt
        setState(() {
          selectedFiles.clear();
          selectedFileNames.clear();
        });
      }

      // optional: remove optimistic once real message comes from socket/poll
      // _pendingLocal.removeWhere((m) => m.localTempId == tempId);

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
        resizeToAvoidBottomInset: true,
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
                            AppAsset.profilePicImg,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset(
                          AppAsset.profilePicImg,
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
                            participentId: controller.groupChatData
                                .value!.participants
                                .map((e) => e.userId)
                                .where((id) => id != widget.userId)
                                .toList(),
                            callType: 'GROUP',
                            isVideo: true,
                          )
                              : InitiateClass().CallInitiateFunction(
                            context: context,
                            participentId: [
                              controller.empChatData.value!
                                  .empInfoData.userId
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
                                .groupChatData
                                .value!
                                .participants
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

                return controller.isLoadingChatScreen.value
                    ? Container(
                  color: Colors.white.withValues(alpha: 0.25),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ),
                )
                    : ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  itemCount: merged.length,
                  itemBuilder: (context, index) {
                    final element = merged[index];

                    // ✅ voiceNoteUrl.map(...) rendering (your requested style)
                    final voiceNoteUrl = element.voiceNotes;

                    return Column(
                      crossAxisAlignment: element.isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        ChatElementWidget(
                          isGroup: widget.isGroup,
                          chat: element,
                        ),

                        // ✅ Add voice bubbles under the message
                        if (voiceNoteUrl.isNotEmpty)
                          ...voiceNoteUrl.map(
                                (url) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: VoiceNoteBubble(
                                url: url,
                                isMe: element.isSender,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                );
              }),
            ),

            // ===================== BOTTOM (SAME UI) =====================
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                if (showFilePick)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: ConstFilepickerAndMediaPicker(
                      pickDocuments: () async {
                        showFilePick = false;
                        FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                          allowMultiple: false,
                          withData: true,
                        );
                        final fileSize = result?.files.first.size;
                        final isAbove20MB = fileSize! > (20 * 1024 * 1024);
                        if (result != null) {
                          setState(() {
                            for (final f in result.files) {
                              if (f.bytes != null) {
                                selectedFiles.add(Uint8List.fromList(f.bytes!));
                                selectedFileNames.add(f.name);
                                _fileAbove20Mb = !isAbove20MB;
                              }
                            }
                            final existingText =
                            sendMessageController.text.trim();

                            final fileText = selectedFileNames.join(', ');

                            if (existingText.isEmpty) {
                              sendMessageController.text = fileText;
                            } else {
                              sendMessageController.text =
                              '$existingText, $fileText';
                            }

                            sendMessageController.selection =
                                TextSelection.fromPosition(
                                  TextPosition(
                                      offset: sendMessageController.text.length),
                                );
                          });
                        }
                      },
                      pickGallery: () async {
                        showFilePick = false;
                        FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['png', 'jpg', 'jpeg'],
                          allowMultiple: false,
                          withData: true,
                        );
                        final fileSize = result?.files.first.size;
                        final isAbove20MB = fileSize! > (20 * 1024 * 1024);
                        if (result != null) {
                          setState(() {
                            for (final f in result.files) {
                              if (f.bytes != null) {
                                selectedFiles.add(
                                    Uint8List.fromList(f.bytes!)); // canonical
                                selectedFileNames.add(f.name);
                                _fileAbove20Mb = !isAbove20MB;
                              }
                            }
                            final existingText =
                            sendMessageController.text.trim();

                            final fileText = selectedFileNames.join(', ');

                            if (existingText.isEmpty) {
                              sendMessageController.text = fileText;
                            } else {
                              sendMessageController.text =
                              '$existingText, $fileText';
                            }

                            sendMessageController.selection =
                                TextSelection.fromPosition(
                                  TextPosition(
                                      offset: sendMessageController.text.length),
                                );
                          });
                        }
                      },
                      pickCamera: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo = await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 80,
                        );
                        if (photo == null) return;

                        final dynamic imageBytes = await photo.readAsBytes();
                        final String fileName =
                            "captured_${DateTime.now().millisecondsSinceEpoch}.jpg";

                        setState(() {
                          selectedFiles.add(imageBytes);
                          selectedFileNames.add(fileName);
                          _fileAbove20Mb = true;
                          _appendSelectedNamesToInput();
                        });
                      },
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: _isRecording ? 56 : 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _isRecording
                      ? Row(
                    children: [
                      const Icon(Icons.mic, color: Colors.red),
                      const SizedBox(width: 8),
                      const Icon(Icons.circle,
                          size: 10, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(
                        _formatTime(_recordSeconds),
                        style:
                        const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: cancel,
                        child: const Text(
                          "CANCEL",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
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
                            prefixIcon: IconButton(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                showEmojiPicker
                                    ? Icons.keyboard
                                    : Icons.sentiment_satisfied_alt_outlined,
                              ),
                              onPressed: _toggleEmojiKeyboard,
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(2, (index) {
                                  final list = [
                                    AppAsset.attachSvgIcon,
                                    AppAsset.sendMsgSvgIcon,
                                  ];
                                  return InkWell(
                                    onTap: list[index]
                                        .contains(AppAsset.sendMsgSvgIcon)
                                        ? () {
                                      if (showEmojiPicker) {
                                        setState(() {
                                          showEmojiPicker = false;
                                          showFilePick = false;
                                        });
                                      }
                                      _handleSend();
                                    }
                                        : list[index]
                                        .contains(AppAsset.attachSvgIcon)
                                        ? () {
                                      setState(() {
                                        showFilePick = !showFilePick;
                                      });
                                    }
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
                        decoration: BoxDecoration(
                          color: _isRecording ? Colors.red : Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onLongPress: () => onStartRecording(),
                          onTapUp: (_) => stopRecording(),
                          onTapCancel: cancel,
                          child: isLoadingVoiceSend
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                              : Icon(
                            _isRecording ? Icons.stop : Icons.mic,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
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
// ChatModel
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
// ===========================
// chat_screen.dart  (FULL - FINAL + Voice Bubble + Strict One-at-a-time Send)
// ✅ Keeps SAME UI
// ✅ EmojiPicker WhatsApp style
// ✅ Attachments upload after message
// ✅ Voice note upload after message using postSendVoiceNoteAttachmentUrl
// ✅ STRICT SEND RULES:
//    1) While current message/attachment/voice is sending -> BLOCK any other send/attach/voice
//    2) DO NOT send empty message (text empty AND no attachments)
// ✅ Voice Bubble support:
//    - Extracts .mpeg urls from message.voiceNoteUrl and also from attachments (fallback)
//    - Renders VoiceNoteBubble below ChatElementWidget
// ===========================

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:clinician_app/pages/home/widget/chat_group_info.dart';
import 'package:clinician_app/pages/home/widget/clinitian_info.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

// ✅ Voice bubble playback
// Add if missing: just_audio: ^0.9.38
import 'package:just_audio/just_audio.dart';

import '../../controller/chat_controller.dart';
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

  // ✅ recording
  bool _isRecording = false;
  int _recordSeconds = 0;
  Timer? _timer;
  final AudioRecorder _recorder = AudioRecorder();
  String? _filePath;

  // ✅ attachments picked
  final List<Uint8List> selectedFiles = [];
  final List<String> selectedFileNames = [];
  bool _fileAbove20Mb = true;

  // ✅ loading states
  bool isLoadingVoiceSend = false;

  // ✅ ONE GLOBAL LOCK
  bool _sendInProgress = false;
  bool get _isBusySending =>
      _sendInProgress ||
          isLoadingVoiceSend ||
          controller.isChatSendLoading.value; // if your controller uses this

  // ✅ Focus node
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
  // Emoji Toggle
  // ===========================
  Future<void> _toggleEmojiKeyboard() async {
    if (_isBusySending) return;

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
  // Helpers
  // ===========================
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

  Future<File> _bytesToTempFile(Uint8List bytes, String fileName) async {
    final dir = await getTemporaryDirectory();
    final safeName = fileName.isEmpty
        ? 'file_${DateTime.now().millisecondsSinceEpoch}'
        : fileName;

    final file = File('${dir.path}/$safeName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<File> _ensureFile(String path) async {
    final f = File(path);
    if (await f.exists()) return f;
    final dir = await getTemporaryDirectory();
    return File('${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.mpeg');
  }

  // ===========================
  // Recording
  // ===========================
  Future<void> startRecording() async {
    if (_isBusySending) return;
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
    if (_isBusySending) return;

    setState(() {
      _isRecording = true;
      _recordSeconds = 0;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _recordSeconds++);
    });

    await startRecording();
  }

  Future<String?> stopRecording() async {
    if (_isBusySending) return null;

    _timer?.cancel();
    setState(() => _isRecording = false);

    final path = await _recorder.stop();
    if (path != null) {
      await sendVoiceNote(path);
    }
    return path;
  }

  Future<void> cancel() async {
    _timer?.cancel();
    setState(() => _isRecording = false);
    await _recorder.cancel();
  }

  // ===========================
  // Voice Send (LOCKED)
  // ===========================
  Future<void> sendVoiceNote(String audioPath) async {
    if (_isBusySending) {
      Get.snackbar("Please wait", "Current message is still sending...");
      return;
    }

    // ✅ don’t send too short voice
    if (_recordSeconds <= 0) {
      Get.snackbar("Oops", "Voice note is too short");
      return;
    }

    setState(() {
      _sendInProgress = true;
      isLoadingVoiceSend = true;
    });

    try {
      final File audioFile = await _ensureFile(audioPath);
      final String fileName =
          "voice_${DateTime.now().millisecondsSinceEpoch}.mpeg";

      // A) Create chat row for chatId (backend requirement)
      final ApiData msgRes;
      if (widget.isGroup) {
        msgRes = await controller.postSendChatData(
          ptGroupId: controller.groupChatData.value!.groupInfo.ptGroupId,
          textContent: "",
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

      final int? chatId = msgRes.chatId;
      if (chatId == null || chatId == 0) {
        Get.snackbar('Error', 'ChatId missing for voice upload');
        return;
      }

      // B) Upload voice
      final ApiData uploadRes =
      await controller.postSendVoiceNoteAttachmentUrl(
        chatId: chatId,
        base64File: audioFile,
        documentName: fileName,
        isGroup: widget.isGroup,
        duration: _recordSeconds,
      );

      if (!(uploadRes.statusCode == 200 || uploadRes.statusCode == 201)) {
        Get.snackbar('Failed', uploadRes.message);
        return;
      }

      if (!mounted) return;
      setState(() {
        _recordSeconds = 0;
        showEmojiPicker = false;
        showFilePick = false;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      if (mounted) {
        setState(() {
          isLoadingVoiceSend = false;
          _sendInProgress = false;
        });
      }
    }
  }

  // ===========================
  // Chip color
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
  // ✅ Voice Notes extractor (.mpeg only)
  // ===========================
  List<String> _extractVoiceNotesFromList(List<String>? urls) {
    if (urls == null || urls.isEmpty) return const [];
    return urls.where((url) {
      final lower = url.toLowerCase().trim();
      return lower.endsWith('.mpeg');
    }).toList();
  }

  List<String> _extractVoiceNotesFromAttachments(List<String> attachments) {
    return attachments.where((url) {
      final lower = url.toLowerCase().trim();
      return lower.endsWith('.mpeg');
    }).toList();
  }

  // ===========================
  // Group mapper
  // ===========================
  List<ChatModel> _mapGroupMessages(PatientGroupChatData? data) {
    if (data == null) return [];
    return data.messages.map((msg) {
      final dt = DateTime.tryParse(msg.dateCreated) ?? DateTime.now();

      final bool isMe = (msg.ptUserId == 0)
          ? (msg.ptEmpUserId == widget.userId)
          : (msg.sender.userId == widget.userId);

      final senderName = '${msg.sender.firstName} ${msg.sender.lastName}'.trim();

      final voiceFromField = _extractVoiceNotesFromList(msg.voiceNoteUrl);
      final attachments = msg.attachedMultimediaUrls;
      final voiceFromAttachments = _extractVoiceNotesFromAttachments(attachments);

      final voiceNotes = <String>{...voiceFromField, ...voiceFromAttachments}.toList();

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
  // Emp mapper
  // ===========================
  List<ChatModel> _mapEmpMessages(ChatDepartmentGroupCommunicationData? data) {
    if (data == null) return [];
    return data.messages.map((m) {
      final dt = DateTime.tryParse(m.dateCreated) ?? DateTime.now();
      final senderName = '${m.sender.firstName} ${m.sender.lastName}'.trim();

      final voiceFromField = _extractVoiceNotesFromList(m.voiceNoteUrl);
      final attachments = m.attachedMultimediaUrl;
      final voiceFromAttachments = _extractVoiceNotesFromAttachments(attachments);

      final voiceNotes = <String>{...voiceFromField, ...voiceFromAttachments}.toList();

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
  // Merge API + local (keeps your logic)
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
    final merged = <ChatModel>[...apiMessages, ...keptLocal];
    merged.sort((a, b) => b.time.compareTo(a.time));
    return merged;
  }

  // ===========================
  // SEND (Text + Attachments) LOCKED + no empty
  // ===========================
  Future<void> _handleSend() async {
    if (_isBusySending) {
      Get.snackbar("Please wait", "Current message is still sending...");
      return;
    }

    final text = sendMessageController.text.trim();
    final bool hasAttachments =
        selectedFiles.isNotEmpty && selectedFileNames.length == selectedFiles.length;

    // ✅ don’t send empty msg
    if (text.isEmpty && !hasAttachments) return;

    setState(() => _sendInProgress = true);

    final tempId = '${DateTime.now().microsecondsSinceEpoch}';

    // ✅ optimistic only if text exists (prevents empty bubbles)
    if (text.isNotEmpty) {
      _pendingLocal.insert(
        0,
        ChatModel(
          msg: text,
          isSender: true,
          time: DateTime.now(),
          localTempId: tempId,
          attachments: const [],
          voiceNotes: const [],
        ),
      );
    }

    // capture attachments, then clear UI to prevent re-send duplicates
    final filesToSend = List<Uint8List>.from(selectedFiles);
    final namesToSend = List<String>.from(selectedFileNames);

    sendMessageController.clear();
    setState(() {
      selectedFiles.clear();
      selectedFileNames.clear();
      showFilePick = false;
      showEmojiPicker = false;
    });

    try {
      // 1) send message (text can be empty if attachments exist)
      final ApiData res;
      if (widget.isGroup) {
        res = await controller.postSendChatData(
          ptGroupId: controller.groupChatData.value!.groupInfo.ptGroupId,
          textContent: text,
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
          empTextContent: text,
          isGroup: false,
        );
      }

      if (!(res.statusCode == 200 || res.statusCode == 201)) {
        _pendingLocal.removeWhere((m) => m.localTempId == tempId);
        Get.snackbar('Failed', 'Message not sent');
        return;
      }

      final int? chatId = res.chatId;

      if (filesToSend.isNotEmpty && (chatId == null || chatId == 0)) {
        Get.snackbar('Error', 'ChatId missing for attachments');
        return;
      }

      // 2) upload attachments
      for (int i = 0; i < filesToSend.length; i++) {
        final File tempFile = await _bytesToTempFile(filesToSend[i], namesToSend[i]);
        final attachRes = await controller.postSendAttachmentUrl(
          chatId: chatId!,
          base64File: tempFile,
          documentName: namesToSend[i],
          isGroup: widget.isGroup,
        );

        if (!(attachRes.statusCode == 200 || attachRes.statusCode == 201)) {
          Get.snackbar('Attachment Failed', attachRes.message);
        }
      }
    } catch (e) {
      _pendingLocal.removeWhere((m) => m.localTempId == tempId);
      Get.snackbar('Error', e.toString());
    } finally {
      if (mounted) setState(() => _sendInProgress = false);
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
                            : Image.asset(AppAsset.profilePicImg, fit: BoxFit.cover),
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
                              final abbr = (p.employeeTypeAbbreviation ?? '').toString().trim();
                              final colorHex = p.employeeTypeColor?.toString();
                              if (abbr.isNotEmpty) {
                                chips.add(AbbrChipModel(abbr: abbr, color: hexToColor(colorHex)));
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
                              separatorBuilder: (_, __) => SizedBox(width: 4.w),
                              itemBuilder: (context, index) {
                                final chip = chips[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
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
                final icons = [
                  AppAsset.videoCallSvgIcon,
                  AppAsset.audioCallSvgIcon,
                  AppAsset.threeDotSvgIcon,
                ];

                // 1) Video call
                if (index == 0) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
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
                        participentId: [
                          controller.empChatData.value!.empInfoData.userId
                        ],
                        callType: 'ONE_TO_ONE',
                        isVideo: true,
                      );
                    },
                    child: Container(
                      width: 29.w,
                      height: 29.h,
                      margin: EdgeInsets.only(right: 6.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF3F3F3),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(icons[index]),
                    ),
                  );
                }

                // 2) Audio call
                if (index == 1) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
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
                        participentId: [
                          controller.empChatData.value!.empInfoData.userId
                        ],
                        callType: 'ONE_TO_ONE',
                        isVideo: false,
                      );
                    },
                    child: Container(
                      width: 29.w,
                      height: 29.h,
                      margin: EdgeInsets.only(right: 6.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF3F3F3),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(icons[index]),
                    ),
                  );
                }

                // 3) Three-dot menu (PopupMenuButton must be in the tree)
                return Theme(
                  data: Theme.of(context).copyWith(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: PopupMenuButton<String>(
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    splashRadius: 0,
                    offset: const Offset(0, 32),
                    onSelected: (value) async{
                      if (widget.isGroup) {
                        if (value == 'Group Info') {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Get.off(
                              GroupInfoScreen(
                                groupId: controller.groupChatData.value!.groupInfo.ptGroupId,
                                onClose: () => Get.back(),
                              ),
                            );
                          });
                        } else if (value == 'Clear Chat') {
                          if (controller.groupChatData.value == null) return;
                        final responseChat =
                            await controller.clearPatientGropChatPatch(
                          id: controller.groupChatData.value!.groupInfo.ptGroupId,
                        );

                          // TODO: clear group chat
                        } else if (value == 'Exit Group') {
                          if (controller.groupChatData.value == null) return;
                          final response = await controller.patchexitPatientGrop(
                            patientId:controller.groupChatData.value!.groupInfo.ptGroupId,
                          );
                          if ((response.statusCode == 200 ||
                              response.statusCode == 201) &&
                              mounted) {
                            Get.back();
                          }
                          // TODO: exit group
                        }
                      } else {
                        if (value == 'Info') {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Get.off(
                              ClinitianInfoScreen(
                                empId: controller.empChatData.value!.empInfoData.employeeId,
                                onClose: () => Get.back(),
                              ),
                            );
                          });
                        } else if (value == 'Clear Chat') {
                          var responseChat = await controller.deleteEmployeeChat(otherEmpId: controller.empChatData.value!.empInfoData.employeeId);
                          if(responseChat.statusCode == 200 || responseChat.statusCode == 201){
                            // showTopRightToast(context, message: "Clinical chat clear successfully!", isSuccess: true);
                          }else{
                            // showTopRightToast(context, message: "Something went wrong!", isSuccess: false);
                          }
                          // TODO: clear one-to-one chat
                        }
                      }
                    },
                    itemBuilder: (context) => widget.isGroup
                        ? <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Group Info',
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/chat/Iicon.png',
                              height: 20,
                              width: 20,
                              color: AppColors.mediumgrey,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Group Info',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mediumgrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear Chat',
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/chat/chat.png',
                              height: 20,
                              width: 20,
                              color: AppColors.mediumgrey,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Clear Chat',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mediumgrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Exit Group',
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/chat/exitGrp.png',
                              height: 20,
                              width: 20,
                              color: AppColors.mediumgrey,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Exit Group',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mediumgrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                        : <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Info',
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/chat/Iicon.png',
                              height: 20,
                              width: 20,
                              color: AppColors.mediumgrey,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Info',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mediumgrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear Chat',
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/chat/chat.png',
                              height: 20,
                              width: 20,
                              color: AppColors.mediumgrey,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Clear Chat',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mediumgrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      width: 29.w,
                      height: 29.h,
                      margin: EdgeInsets.only(right: 6.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF3F3F3),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(icons[index]),
                    ),
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

            // ===================== MESSAGES UI + Voice bubbles =====================
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
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                  itemCount: merged.length,
                  itemBuilder: (context, index) {
                    final element = merged[index];
                    final voiceNoteUrl = element.voiceNotes;

                    return Column(
                      crossAxisAlignment: element.isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        ChatElementWidget(isGroup: widget.isGroup, chat: element),

                        // ✅ Voice bubbles below message
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

            // ===================== BOTTOM =====================
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
                          sendMessageController.selection = TextSelection.fromPosition(
                            TextPosition(offset: sendMessageController.text.length),
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
                                  TextPosition(offset: sendMessageController.text.length),
                                );
                          }
                        });
                      },
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform == TargetPlatform.iOS
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
                        if (_isBusySending) return;
                        showFilePick = false;

                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                          allowMultiple: false,
                          withData: true,
                        );

                        final fileSize = result?.files.first.size ?? 0;
                        final isAbove20MB = fileSize > (20 * 1024 * 1024);

                        if (result != null) {
                          setState(() {
                            for (final f in result.files) {
                              if (f.bytes != null) {
                                selectedFiles.add(Uint8List.fromList(f.bytes!));
                                selectedFileNames.add(f.name);
                                _fileAbove20Mb = !isAbove20MB;
                              }
                            }
                            _appendSelectedNamesToInput();
                          });
                        }
                      },
                      pickGallery: () async {
                        if (_isBusySending) return;
                        showFilePick = false;

                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['png', 'jpg', 'jpeg'],
                          allowMultiple: false,
                          withData: true,
                        );

                        final fileSize = result?.files.first.size ?? 0;
                        final isAbove20MB = fileSize > (20 * 1024 * 1024);

                        if (result != null) {
                          setState(() {
                            for (final f in result.files) {
                              if (f.bytes != null) {
                                selectedFiles.add(Uint8List.fromList(f.bytes!));
                                selectedFileNames.add(f.name);
                                _fileAbove20Mb = !isAbove20MB;
                              }
                            }
                            _appendSelectedNamesToInput();
                          });
                        }
                      },
                      pickCamera: () async {
                        if (_isBusySending) return;

                        final ImagePicker picker = ImagePicker();
                        final XFile? photo = await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 80,
                        );
                        if (photo == null) return;

                        final bytes = await photo.readAsBytes();
                        final fileName =
                            "captured_${DateTime.now().millisecondsSinceEpoch}.jpg";

                        setState(() {
                          selectedFiles.add(Uint8List.fromList(bytes));
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
                      const Icon(Icons.circle, size: 10, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(
                        _formatTime(_recordSeconds),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: cancel,
                        child: const Text("CANCEL", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                ),

                // INPUT
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
                            focusNode: _focusNode,
                            controller: sendMessageController,
                            onTap: () {
                              if (showEmojiPicker) setState(() => showEmojiPicker = false);
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
                                InkWell(
                                  onTap: _isBusySending
                                      ? null
                                      : () => setState(() => showFilePick = !showFilePick),
                                  child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    margin: EdgeInsets.only(right: 9.w),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(AppAsset.attachSvgIcon),
                                  ),
                                ),
                                InkWell(
                                  onTap: _isBusySending ? null : _handleSend,
                                  child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    margin: EdgeInsets.only(right: 9.w),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(AppAsset.sendMsgSvgIcon),
                                  ),
                                ),
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
                          onLongPress: _isBusySending ? null : () => onStartRecording(),
                          onTapUp: _isBusySending ? null : (_) => stopRecording(),
                          onTapCancel: _isBusySending ? null : cancel,
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
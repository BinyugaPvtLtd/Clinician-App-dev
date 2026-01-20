// ===========================
// chat_data_controller.dart
// ===========================

import 'dart:async';
import 'dart:convert';

import 'package:clinician_app/controller/repository/chat_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/chatScreen/chatList_model.dart';
import '../model/chatScreen/empChat_model.dart';
import '../model/chatScreen/groupChat_model.dart';
import '../services/auth_api_services/auth_services.dart';

class ChatDataController extends GetxController {
  final ApiService _api = Get.put(ApiService());

  // ===================== CHAT LIST =====================
  final isLoadingChatList = false.obs;
  final error = ''.obs;
  final chatListItem = <ChatListItem>[].obs;

  Timer? _timer;
  bool _isFirstLoad = true;

  void startChatListListening({required int clinicianId}) {
    stopChatListListening();

    fetchChatListAllData(clinicianId: clinicianId, showLoader: true);

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await fetchChatListAllData(clinicianId: clinicianId, showLoader: false);
    });
  }

  void stopChatListListening() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> fetchChatListAllData({
    required int clinicianId,
    required bool showLoader,
  }) async {
    final data = await getChatListData(
      clinicianId: clinicianId,
      showLoader: showLoader,
    );
    chatListItem.assignAll(data);
  }

  Future<List<ChatListItem>> getChatListData({
    required int clinicianId,
    required bool showLoader,
  }) async {
    List<ChatListItem> itemData = [];

    DateTime? parseDateTime(dynamic value) {
      if (value == null) return null;
      final String s = value.toString().trim();
      if (s.isEmpty) return null;
      return DateTime.tryParse(s);
    }

    String formatTimeToAMPM(String? dateTimeString) {
      if (dateTimeString == null || dateTimeString.isEmpty) return '';

      try {
        final DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
        return DateFormat('h.mm a').format(dateTime).replaceAll(' ', '');
      } catch (e) {
        return '';
      }
    }

    try {
      if (showLoader && _isFirstLoad) {
        isLoadingChatList.value = true;
      }

      error.value = '';

      final res = await _api.get(
        ChatRepository.getChatList(clinicianId: clinicianId),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        for (var items in res.data) {
          final DateTime? dt = parseDateTime(items['lastMessageTimestamp']);

          itemData.add(
            ChatListItem(
              isGroup: items['is_group'] ?? false,
              unseenMessageCount: items['unseenMessageCount'] ?? 0,
              lastMessageText: items['lastMessageText'] ?? '',
              lastMessageTimestamp: items['lastMessageTimestamp'] != null ? formatTimeToAMPM(items['lastMessageTimestamp']) : '',

              partnerEmpId: items['partner_emp_id'] ?? 0,
              userId: items['userId'] ?? 0,
              firstName: items['firstName'] ?? '',
              lastName: items['lastName'] ?? '',
              imgUrl: items['imgurl'] ?? '',

              ptGroupId: items['pt_group_id']??0,
              groupName: items['group_name'] ?? '',
              groupDescription: items['group_description'] ?? '',
              groupProfileUrl: items['group_profile_url'] ?? '',
              isActive: items['is_active'] ?? false,

              groupMembers: items['groupMembers'] != null
                  ? (items['groupMembers'] as List)
                  .map(
                    (m) => GroupMember(
                  memberId: m['memberId'] ?? 0,
                  firstName: m['firstName'] ?? '',
                  lastName: m['lastName'] ?? '',
                  imgUrl: m['imgurl'] ?? '',
                  userId: m['userId'] ?? 0,
                ),
              )
                  .toList()
                  : null,
            ),
          );
        }

        _isFirstLoad = false;
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoadingChatList.value = false;
    }

    return itemData;
  }

  // ===================== HELPERS =====================
  List<String> parseAttachments(dynamic value) {
    if (value == null) return [];

    if (value is List) {
      return value.map((e) => e.toString().trim()).toList();
    }

    if (value is String && value.trim().startsWith('[')) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is List) {
          return decoded.map((e) => e.toString().trim()).toList();
        }
      } catch (_) {}
    }

    if (value is String) {
      if (value.trim().isEmpty) return [];
      return [value.trim()];
    }

    return [];
  }

  List<String> parseAttachedMultimediaUrl(dynamic raw) {
    if (raw == null) return const [];

    if (raw is List) {
      return raw.map((e) => e.toString()).toList();
    }

    if (raw is String) {
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return const [];

      try {
        final decoded = json.decode(trimmed);

        if (decoded is List) {
          return decoded.map((e) => e.toString()).toList();
        }

        if (decoded is String) {
          return [decoded];
        }
      } catch (_) {
        return trimmed
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }
    }

    return const [];
  }

  // ===================== GROUP CHAT API =====================
  Future<PatientGroupChatData?> getPatientChats({
    required int ptGroupId,
    required int pageNbr,
    required int NbrofRow,
  }) async {
    try {
      final response = await _api.get(
        ChatRepository.getChatsScreenList(
          ptGroupId: ptGroupId,
          pageNbr: pageNbr,
          NbrofRow: NbrofRow,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final groupInfo = GroupInfo(
          ptGroupId: data['groupInfo']['pt_group_id'],
          groupName: data['groupInfo']['group_name'] ?? '',
          groupDescription: data['groupInfo']['group_description'] ?? '',
          groupProfileUrl: data['groupInfo']['group_profile_url'] ?? '',
          isActive: data['groupInfo']['is_active'] ?? false,
          createdAt: DateTime.parse(data['groupInfo']['created_at']),
        );

        final participants = <Participant>[];
        if (data['participants'] != null) {
          for (var p in data['participants']) {
            participants.add(
              Participant(
                participantId: p['participantId'],
                participantType: p['participantType'] ?? '',
                firstName: p['firstName'] ?? '',
                lastName: p['lastName'] ?? '',
                fullName: p['fullName'] ?? '',
                imgurl: p['imgurl'] ?? '',
                email: p['email'] ?? '',
                userId: p['userId'],
                isOnline: p['isOnline'] ?? false,
                lastOnline:
                p['lastOnline'] != null ? DateTime.parse(p['lastOnline']) : null,
                willReceiveSms: p['willReceiveSms'] ?? false,
                employeeTypeAbbreviation: p['employeeTypeAbbreviation'],
                employeeTypeColor: p['employeeTypeColor'],
                employeeTypeId: p['employeeTypeId'],
                employeeTypeName: p['employeeTypeName'],
              ),
            );
          }
        }

        List<Message> messages = [];
        if (data["messages"] != null) {
          for (var m in data["messages"]) {
            final sender = m["sender"] ?? {};

            List<String> attachments = parseAttachments(m["attached_multimedia_url"]);
            List<String> voiceNote = parseAttachments(m['voice_note_url']);

            messages.add(
              Message(
                ptUserId: m["pt_user_id"] ?? 0,
                ptEmpUserId: m["pt_user_emp_id"] ?? 0,
                ptChatId: m["pt_chat_id"] ?? 0,
                textContent: m["text_content"] ?? "",
                dateCreated: m["date_created"] ?? "",
                dateModified: m["date_modified"],
                unsend: m["unsend"] ?? false,
                seenByPatient: m["seen_by_patient"] ?? false,
                seenByClinicians: List<int>.from(m["seen_by_clinicians"] ?? []),
                attachedMultimediaUrls: attachments,
                stickerMultimediaUrl: m["sticker_multimedia_url"] ?? "",
                voiceNoteUrl: voiceNote,
                sentAsSms: m["sent_as_sms"] ?? false,
                sender: Sender(
                  userId: sender["userId"] ?? 0,
                  senderId: sender["senderId"] ?? 0,
                  senderType: sender["senderType"] ?? "",
                  firstName: sender["firstName"] ?? "",
                  lastName: sender["lastName"] ?? "",
                  imgUrl: sender["imgurl"] ?? "",
                ),
              ),
            );
          }
        }

        final pagination = Pagination(
          currentPage: data['pagination']['currentPage'] ?? 1,
          totalPages: data['pagination']['totalPages'] ?? 1,
          totalMessages: data['pagination']['totalMessages'] ?? 0,
          hasNextPage: data['pagination']['hasNextPage'] ?? false,
          hasPreviousPage: data['pagination']['hasPreviousPage'] ?? false,
        );

        return PatientGroupChatData(
          groupInfo: groupInfo,
          participants: participants,
          messages: messages,
          pagination: pagination,
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ===================== EMP CHAT API =====================
  Future<ChatDepartmentGroupCommunicationData?> chatClinicalGroupCommunication(
      final int otherEmpId,
      final int pageNo,
      final int rowNo,
      ) async {
    try {
      final response = await _api.get(
        ChatRepository.getAllEmployeeChat(
          pageNo: pageNo,
          rows: rowNo,
          otherEmpid: otherEmpId,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final empInfo = data["employee_info"] ?? {};
        final empInfoData = EmployeeClinicalInfoData(
          employeeId: empInfo['employeeId'] ?? 0,
          userId: empInfo['user_id'] ?? 0,
          fullName: empInfo['fullName'] ?? '',
          imageUrl: empInfo['imgurl'] ?? '',
          isOnline: empInfo['isOnline'] ?? false,
        );

        List<ParticipantData> participants = [];
        if (data["participants"] != null) {
          for (var p in data["participants"]) {
            participants.add(
              ParticipantData(
                fullName: p["fullName"] ?? "",
                imgUrl: p["imgurl"] ?? "",
                email: p["email"] ?? "",
                isOnline: p["isOnline"] ?? false,
                willReceiveSms: p["willReceiveSms"] ?? false,
                departmentId: p['departmentId'] ?? 0,
                departmentName: p['departmentName'] ?? '',
                role: p['role'] ?? '',
                employeeId: p['employeeId'] ?? 0,
                userId: p['user_id'] ?? 0,
                position: p['position'] ?? '',
              ),
            );
          }
        }

        List<EmpMessage> messages = [];
        if (data["messages"] != null) {
          for (var m in data["messages"]) {
            final sender = m["sender"] ?? {};
            List<String> voiceNoteUrls = parseAttachedMultimediaUrl(m['voice_note_url']);

            messages.add(
              EmpMessage(
                voiceNoteUrl: voiceNoteUrls,
                textContent: m["text_content"] ?? "",
                dateCreated: m["date_created"] ?? "",
                dateModified: m["date_modified"],
                unsend: m["unsend"] ?? false,
                seenByEmployees:
                List<int>.from(m["seen_by_employees"] ?? const <int>[]),
                attachedMultimediaUrl:
                parseAttachedMultimediaUrl(m["attached_multimedia_url"]),
                stickerMultimediaUrl: m["sticker_multimedia_url"] ?? "",
                sender: EmpSender(
                  senderId: sender["senderId"] ?? 0,
                  senderType: sender["senderType"] ?? "",
                  firstName: sender["firstName"] ?? "",
                  lastName: sender["lastName"] ?? "",
                  imgUrl: sender["imgurl"] ?? "",
                ),
                sendAsSms: m["sent_as_sms"] ?? false,
                isMine: m["isMine"] ?? false,
                empChatId: m["emp_chat_id"] ?? 0,
                senderEmpId: m["sender_emp_id"] ?? 0,
                receiverEmpId: m["receiver_emp_id"] ?? 0,
              ),
            );
          }
        }

        final paginationData = data["pagination"] ?? {};
        final pagination = EmpPagination(
          currentPage: paginationData["currentPage"] ?? 1,
          totalPages: paginationData["totalPages"] ?? 1,
          totalMessages: paginationData["totalMessages"] ?? 0,
          hasNextPage: paginationData["hasNextPage"] ?? false,
          hasPreviousPage: paginationData["hasPreviousPage"] ?? false,
        );

        return ChatDepartmentGroupCommunicationData(
          participants: participants,
          messages: messages,
          pagination: pagination,
          empInfoData: empInfoData,
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ===================== CHAT SCREEN (POLLING) =====================
  final isLoadingChatScreen = false.obs;
  final chatScreenError = ''.obs;

  final Rxn<PatientGroupChatData> groupChatData = Rxn<PatientGroupChatData>();
  final Rxn<ChatDepartmentGroupCommunicationData> empChatData =
  Rxn<ChatDepartmentGroupCommunicationData>();

  Timer? _chatScreenTimer;
  bool _chatScreenFirstLoad = true;

  void startChatScreenListening({
    required bool isGroup,
    int? ptGroupId,
    int? otherEmpId,
    int pageNo = 1,
    int rows = 50,
  }) {
    stopChatScreenListening();

    _loadChatScreenOnce(
      isGroup: isGroup,
      ptGroupId: ptGroupId,
      otherEmpId: otherEmpId,
      pageNo: pageNo,
      rows: rows,
      showLoader: true,
    );

    _chatScreenTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await _loadChatScreenOnce(
        isGroup: isGroup,
        ptGroupId: ptGroupId,
        otherEmpId: otherEmpId,
        pageNo: pageNo,
        rows: rows,
        showLoader: false,
      );
    });
  }

  void stopChatScreenListening() {
    _chatScreenTimer?.cancel();
    _chatScreenTimer = null;
  }

  Future<void> _loadChatScreenOnce({
    required bool isGroup,
    required bool showLoader,
    int? ptGroupId,
    int? otherEmpId,
    required int pageNo,
    required int rows,
  }) async {
    try {
      if (showLoader && _chatScreenFirstLoad) {
        isLoadingChatScreen.value = true;
      }
      chatScreenError.value = '';

      if (isGroup) {
        if (ptGroupId == null) {
          chatScreenError.value = "ptGroupId is required for group chat";
          return;
        }

        final data = await getPatientChats(
          ptGroupId: ptGroupId,
          pageNbr: pageNo,
          NbrofRow: rows,
        );

        if (data != null) groupChatData.value = data;
      } else {
        if (otherEmpId == null) {
          chatScreenError.value = "otherEmpId is required for employee chat";
          return;
        }

        final data = await chatClinicalGroupCommunication(
          otherEmpId,
          pageNo,
          rows,
        );

        if (data != null) empChatData.value = data;
      }

      _chatScreenFirstLoad = false;
    } catch (e) {
      chatScreenError.value = e.toString();
    } finally {
      isLoadingChatScreen.value = false;
    }
  }

  @override
  void onClose() {
    stopChatListListening();
    stopChatScreenListening();
    super.onClose();
  }
}

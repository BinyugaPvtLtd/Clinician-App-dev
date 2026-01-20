class PatientGroupChatData {
  GroupInfo groupInfo;
  List<Participant> participants;
  List<Message> messages;
  Pagination pagination;

  PatientGroupChatData({
    required this.groupInfo,
    required this.participants,
    required this.messages,
    required this.pagination,
  });
}

class GroupInfo {
  int ptGroupId;
  String groupName;
  String groupDescription;
  String groupProfileUrl;
  bool isActive;
  DateTime createdAt;

  GroupInfo({
    required this.ptGroupId,
    required this.groupName,
    required this.groupDescription,
    required this.groupProfileUrl,
    required this.isActive,
    required this.createdAt,
  });
}

class Participant {
  int participantId;
  String participantType;
  String firstName;
  String lastName;
  String fullName;
  String imgurl;
  String email;
  int userId;
  bool isOnline;
  DateTime? lastOnline;
  bool willReceiveSms;
  String? employeeTypeAbbreviation;
  String? employeeTypeColor;
  int? employeeTypeId;
  String? employeeTypeName;

  Participant({
    required this.participantId,
    required this.participantType,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.imgurl,
    required this.email,
    required this.userId,
    required this.isOnline,
    this.lastOnline,
    required this.willReceiveSms,
    this.employeeTypeAbbreviation,
    this.employeeTypeColor,
    this.employeeTypeId,
    this.employeeTypeName,
  });
}

class Message {
  final int ptChatId;
  final String textContent;
  final String dateCreated;
  final String? dateModified;
  final bool unsend;
  final bool seenByPatient;
  final List<int> seenByClinicians;
  final List<String> attachedMultimediaUrls; // ✅ List of URLs now
  final String stickerMultimediaUrl;
  final List<String>? voiceNoteUrl;
  final bool sentAsSms;
  final Sender sender;
  final int ptUserId;
  final int ptEmpUserId;

  Message({
    required this.ptUserId,
    required this.ptEmpUserId,
    required this.ptChatId,
    required this.textContent,
    required this.dateCreated,
    this.dateModified,
    required this.unsend,
    required this.seenByPatient,
    required this.seenByClinicians,
    required this.attachedMultimediaUrls,
    required this.stickerMultimediaUrl,
    this.voiceNoteUrl,
    required this.sentAsSms,
    required this.sender,
  });
}

class Sender {
  final int senderId;
  final String senderType;
  final String firstName;
  final String lastName;
  final String imgUrl;
  final int userId;

  Sender({
    required this.userId,
    required this.senderId,
    required this.senderType,
    required this.firstName,
    required this.lastName,
    required this.imgUrl,
  });
}

class Pagination {
  int currentPage;
  int totalPages;
  int totalMessages;
  bool hasNextPage;
  bool hasPreviousPage;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalMessages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });
}




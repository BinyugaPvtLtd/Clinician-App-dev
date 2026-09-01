class ChatRepository {
  // Add your methods and properties here
  static String chatList = "/chat-list";
  static String chatPatientGrpChat = "/patient-group-chat/chat-screen";

  static String empChat = 'employees-chat';
  static String empChatList = "chat-list";
  static String empdetails = 'employee-details';
  static String empAllMsgChat = 'chat-screen';
  static String postChat = "clinicians_chat";
  static String attachmentMedia = "/clinicians_chat";
  static String attachVoiceNote = "/clinicians_chat";
  static String patientGroup = "/patient-group";
  static String groupInfo = "/group-info";
  static String patientGroupChat = "/patient-group-chat";
  static String empChatImages = "/clinicians_chat/images";
  static String patientGroupChatImages = "/patient-group-chat/images";

  static String getChatImagesBasePath({required bool isGroup}) {
    return isGroup ? patientGroupChatImages : empChatImages;
  }

  static String getChatList({required int clinicianId,}) {
    return '$chatList/$clinicianId';
  }

  static String postSendChat({required bool isGroup,}) {
    return '$postChat/$isGroup';
  }

  static String getChatsScreenList({required int ptGroupId,required int pageNbr,required int NbrofRow}){
    return "$chatPatientGrpChat/$ptGroupId/$pageNbr/$NbrofRow";
  }

  static String getAllEmployeeChat({required int pageNo, required int rows, required int otherEmpid,}) {
    return "/$empChat/$empAllMsgChat/$otherEmpid/$pageNo/$rows";
  }
  static String postAttachMedia({required bool isGroup, required int chatId}) {
    return '$attachmentMedia/$isGroup/$chatId/attachment';
  }
  static String postAttachVoiceNoteMedia({required bool isGroup, required int chatId}) {
    return '$attachVoiceNote/$isGroup/$chatId/voice-note';
  }

  static String getGroupInfoPatientsChats({required int id}) {
    return "$patientGroup/$groupInfo/$id";
  }
  static String getEmployeeDetailsCom({required int empId}) {
    return "$empChat/$empdetails/$empId";
  }
  static String patchClearPatientGroupChat({required int id}) {
    return "$patientGroupChat/clear-chat/$id";
  }
  static String patchExitPatientGrp({required int id}) {
    return "$patientGroup/$id/leave";
  }
  static String deleteEmpChat({required int otherEmpId}) {
    return "$empChat/clear-chat/$otherEmpId";
  }
}
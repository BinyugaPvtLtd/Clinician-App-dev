class ChatRepository {
  // Add your methods and properties here
  static String chatList = "/chat-list";
  static String chatPatientGrpChat = "/patient-group-chat/chat-screen";

  static String empChat = 'employees-chat';
  static String empChatList = "chat-list";
  static String empdetails = 'employee-details';
  static String empAllMsgChat = 'chat-screen';

  static String getChatList({required int clinicianId,}) {
    return '$chatList/$clinicianId';
  }

  static String getChatsScreenList({required int ptGroupId,required int pageNbr,required int NbrofRow}){
    return "$chatPatientGrpChat/$ptGroupId/$pageNbr/$NbrofRow";
  }

  static String getAllEmployeeChat({required int pageNo, required int rows, required int otherEmpid,}) {
    return "/$empChat/$empAllMsgChat/$otherEmpid/$pageNo/$rows";
  }
}
class EmpDepartmentChatdetails {
  final int partnerEmpId;
  final int userId;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final int unseenCount;
  EmpDepartmentChatdetails({required this.userId,
    required this.partnerEmpId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unseenCount});
}

class EmpDetailsDataClass{
  final int employeeId;
  final int userId;
  final String firstName;
  final String lastName;
  final String profileUrl;
  final int departmentId;
  final int employeeTypeId;
  final String employeeTypeAbbreviation;
  final String employeeTypeColor;
  final List<String> media;
  EmpDetailsDataClass({required this.employeeId, required this.userId, required this.firstName, required this.lastName,
    required this.profileUrl, required this.departmentId, required this.employeeTypeId, required this.employeeTypeAbbreviation,
    required this.employeeTypeColor, required this.media});
}
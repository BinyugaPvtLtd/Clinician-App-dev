class TimeOffType{
  final int id;
  final String name;
  TimeOffType({
    required this.id,
    required this.name,
  });
}

class LeaveType{
  final int id;
  final String name;
  LeaveType({
    required this.id,
    required this.name,
  });
}

class TimeOffHistory{
  final List<TimeOffData> timeOffData;
  TimeOffHistory({
    required this.timeOffData,
  });
}

class TimeOffData{
  final int timeOffRequestId;
  final int employeeId;
  final String employeeName;
  final int timeOffTypeId;
  final String timeOffTypeName;
  final String startDate;
  final String endDate;
  final String reason;
  final String status;
  final String createdAt;
  TimeOffData({
    required this.timeOffRequestId,
    required this.employeeId,
    required this.employeeName,
    required this.timeOffTypeId,
    required this.timeOffTypeName,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.status,
    required this.createdAt,
  });
}

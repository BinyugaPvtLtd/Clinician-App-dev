class CalenderListModel{
  final List<VisitsListData> visits;
  CalenderListModel({
    required this.visits,
  });
}

class VisitsListData {
  final int visitId;
  final int employeeTypeId;
  final String visitType;
  final String patientName;
  final String patientImgUrl;
  final String primaryDiagnosis;
  final String address;
  final String timeFrom;
  final String timeTo;
  final bool inZone;
  final double distance;
  final double visitCharge;

  VisitsListData({
    required this.employeeTypeId,
    required this.distance,
    required this.visitCharge,
    required this.visitId,
    required this.visitType,
    required this.patientName,
    required this.patientImgUrl,
    required this.primaryDiagnosis,
    required this.address,
    required this.timeFrom,
    required this.timeTo,
    required this.inZone,
  });
}

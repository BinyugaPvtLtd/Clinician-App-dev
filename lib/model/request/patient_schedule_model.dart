class PatientScheduleModel {
  final String imageUrl;
  final String patientName;
  final String diagnosisName;
  final String zoneName;
  final bool inZone;
  final String visitTypeName;
  final String address;
  final double visitCharge;
  final List<WeekSchedule> weeks;

  PatientScheduleModel({
    required this.imageUrl,
    required this.patientName,
    required this.diagnosisName,
    required this.zoneName,
    required this.inZone,
    required this.visitTypeName,
    required this.address,
    required this.visitCharge,
    required this.weeks,
  });
}

class WeekSchedule {
  final int week;
  final List<VisitScheduleItem> visits;

  WeekSchedule({
    required this.week,
    required this.visits,
  });
}

class VisitScheduleItem {
  final int visitId;
  final String visitName;
  final String visitDate; // "yyyy-MM-dd"
  final String visitTimeFrom; // "HH:mm"
  final String visitTimeTo;   // "HH:mm"
  final int employeeTypeId;
  final String employeeTypeAbbreviation;
  final String employeeTypeColor;

  VisitScheduleItem({
    required this.visitId,
    required this.visitName,
    required this.visitDate,
    required this.visitTimeFrom,
    required this.visitTimeTo,
    required this.employeeTypeId,
    required this.employeeTypeAbbreviation,
    required this.employeeTypeColor,
  });
}

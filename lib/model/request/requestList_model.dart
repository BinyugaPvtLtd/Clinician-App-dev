class TodayVisitsModel {
  final String todaysDate;
  final List<PatientVisitModel> visits;

  TodayVisitsModel({
    required this.todaysDate,
    required this.visits,
  });
}

class PatientVisitModel {
  final int ptId;
  final String patientName;
  final String patientImage;
  final int patientGenderId;
  final String genderName;
  final int patientAge;
  final int primaryDiagnosisId;
  final String primaryDiagnosisName;
  final bool inZone;
  final int zoneId;
  final String zoneName;
  final String patientAddress;
  final String visitNote;
  final double visitCharge;
  final List<VisitDetailsModel> visitList;

  PatientVisitModel({
    required this.ptId,
    required this.patientName,
    required this.patientImage,
    required this.patientGenderId,
    required this.genderName,
    required this.patientAge,
    required this.primaryDiagnosisId,
    required this.primaryDiagnosisName,
    required this.inZone,
    required this.zoneId,
    required this.zoneName,
    required this.patientAddress,
    required this.visitNote,
    required this.visitCharge,
    required this.visitList,
  });
}

class VisitDetailsModel {
  final int visitId;
  final String visitDateFrom;
  final String visitDateTo;
  final int employeeTypeId;
  final String employeeTypeAbbreviation;
  final String employeeTypeColor;
  final String visitStartTime;
  final String visitEndTime;

  VisitDetailsModel({
    required this.visitStartTime,
    required this.visitEndTime,
    required this.visitId,
    required this.visitDateFrom,
    required this.visitDateTo,
    required this.employeeTypeId,
    required this.employeeTypeAbbreviation,
    required this.employeeTypeColor,
  });
}

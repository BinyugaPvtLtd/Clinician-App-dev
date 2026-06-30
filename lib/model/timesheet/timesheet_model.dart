class RecordTypeData{
  final int recordId;
  final String recordName;
  RecordTypeData({
    required this.recordId,
    required this.recordName});
}
class PatientNameData{
  final int ptId;
  final String ptName;
  final String ptAddress;
  PatientNameData({required this.ptId, required this.ptName,
     required this.ptAddress});
}
class VisitMasterData{
  final int visitMasterId;
  final String typeOfVisit;
  final String serviceId;
  final List<EligibleClinician> eligibleClinicians;

  VisitMasterData({
    required this.visitMasterId,
    required this.typeOfVisit,
    required this.serviceId,
    required this.eligibleClinicians,});
}
class EligibleClinician{
  final int empTypeId;
  final String empName;
  final String color;
  EligibleClinician({required this.empTypeId, required this.color,required this.empName});
}

class TimeSheetAllData {
  final int visitId;
  final int ptId;
  final int employeeId;
  final int employeeTypeId;
  final int visitType;
  final String visiteDateTimeFrom;
  final String visitDateTimeTo;
  final bool isVisitCompleted;
  final bool isVisitMissed;
  final bool onWay;
  final int? recordTypeId;
  final bool inZone;
  final String? eligibility;
  final String patientName;
  final String location;
  final int visitTypeId;
  final String visitTypeName;
  final int typeOfVisitId;
  final String typeOfVisitName;
  final String? recordTypeName;
  final String ptFirstName;
  final String ptLastName;
  final String ptAddress;
  final String ptImgUrl;
  final int fkPtPrimaryDiagnosis;
  final String fkPtPrimaryDiagnosisName;
  final String date;

  TimeSheetAllData({
    required this.visitId,
    required this.ptId,
    required this.employeeId,
    required this.employeeTypeId,
    required this.visitType,
    required this.visiteDateTimeFrom,
    required this.visitDateTimeTo,
    required this.isVisitCompleted,
    required this.isVisitMissed,
    required this.onWay,
    this.recordTypeId,
    required this.inZone,
    this.eligibility,
    required this.patientName,
    required this.location,
    required this.visitTypeId,
    required this.visitTypeName,
    required this.typeOfVisitId,
    required this.typeOfVisitName,
    this.recordTypeName,
    required this.ptFirstName,
    required this.ptLastName,
    required this.ptAddress,
    required this.ptImgUrl,
    required this.fkPtPrimaryDiagnosis,
    required this.fkPtPrimaryDiagnosisName,
    required this.date,
  });
}
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
  final int dataId;
  final int employeeId;
  final int employeeTypeId;
  final int ptId;
  final int recordTypeId;
  final String source;
  final String recordTypeName;
  final String visiteDateTimeFrom;
  final String visitDateTimeTo;
  final String status;
  final String location;
  final double visitRate;
  final String patientName;
  final String patientImgUrl;

  TimeSheetAllData({
    required this.dataId,
    required this.employeeId,
    required this.employeeTypeId,
    required this.ptId,
    required this.recordTypeId,
    required this.source,
    required this.recordTypeName,
    required this.visiteDateTimeFrom,
    required this.visitDateTimeTo,
    required this.status,
    required this.location,
    required this.visitRate,
    required this.patientName,
    required this.patientImgUrl,
  });
}
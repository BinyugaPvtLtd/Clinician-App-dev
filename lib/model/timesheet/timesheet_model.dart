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
  final String visitName;
  final String visitDescription;

  VisitMasterData({
    required this.visitMasterId,
    required this.visitName,
    required this.visitDescription});
}

class TimeSheetAllData{
  final int ptId;
  final String ptFirstName;
  final String ptLastName;
  final String ptAddress;
  final String ptImage;
  final int fkPtDiagnosisId;
  final String fkPtDiagnosisName;
  final bool isVisitCompleted;
  final bool onWay;
  final int recrdTypeId;
  final String recordTypeName;
  final String date;
  final String visitDateTimeFrom;
  final String visitDateTimeto;
  TimeSheetAllData({required this.ptId, required this.ptFirstName, required this.ptLastName, required this.ptAddress,
      required this.ptImage, required this.fkPtDiagnosisId, required this.fkPtDiagnosisName,
      required this.isVisitCompleted, required this.onWay, required this.recrdTypeId, required this.recordTypeName,
      required this.date, required this.visitDateTimeFrom, required this.visitDateTimeto});
}
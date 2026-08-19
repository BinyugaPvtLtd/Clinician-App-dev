class PatientVisitsNoteModel{
  final int employeeId;
  final String date;
  final List<PatientVisitItems> items;

  PatientVisitsNoteModel({
    required this.employeeId,
    required this.date,
    required this.items});
}

class PatientVisitItems{
  final int visitId;
  final int employeeId;
  final int pt_id;
  final int employeeTypeId;
  final String patientName;
  final String imageUrl;
  final PrimaryDiagnosis primaryDiagnosis;
  final VisitType visitType;
  final String visiteDateTimeFrom;
  final String visitDateTimeTo;
  final bool isVisitCompleted;
  final bool isVisitMissed;
  final bool isVisitAccepted;
  final bool isSecondLastEpisodeVisit;
  final double visitCharge;
  PatientVisitItems({
    required this.isSecondLastEpisodeVisit,
    required this.isVisitAccepted,
    required this.employeeTypeId,
    required this.visitCharge,
    required this.visitId,
    required this.employeeId,
    required this.pt_id,
    required this.patientName,
    required this.imageUrl,
    required this.primaryDiagnosis,
    required this.visitType,
    required this.visiteDateTimeFrom,
    required this.visitDateTimeTo,
    required this.isVisitCompleted,
    required this.isVisitMissed});
}

class PrimaryDiagnosis{
  final int id;
  final String name;
  final String code;
  PrimaryDiagnosis({
    required this.id,
    required this.name,
    required this.code});
}

class VisitType{
  final int id;
  final String name;
  VisitType({
    required this.id,
    required this.name});
}


// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ZoneType { warning, inZone, outOfZone , unknown }

class RequestDataModel {
  final String? status;
  final String? statusTxt;
  final DateTime? dateTime;
  final ZoneType? zone;
  final String? noteTxt;
  RequestDataModel({
    this.status,
    this.statusTxt,
    this.dateTime,
    this.zone,
    this.noteTxt,
  });
}

class ApiData{
  final bool success;
  final String message;
  final int statusCode;
  final Object? data;
  final int? chatId;
  final String? roleName;
  final String? userStatus;
  int? supervisoryNoteFormID;
  int? nextPatientFormId;
  String? nextFormName;
  int? ptFormId;
  int? ptId;
  bool? visitTypeSelection;
  bool? episodeEndDecision;
  List<int>? pendingFormsIds;
  String? lastVisitPerformedBy;
  int? missVisitFormID;
  bool? requiredEpisodEnd;
  int? lastVisitId;
  int? dischardeFormPatientId;
  bool? patientDischarged;
  ApiData({
    this.missVisitFormID,
    this.requiredEpisodEnd,
    this.lastVisitId,
    this.dischardeFormPatientId,
    this.patientDischarged,
    this.ptId,
    this.nextPatientFormId,
    this.pendingFormsIds,
    this.ptFormId,
    this.episodeEndDecision,
    this.lastVisitPerformedBy,
    this.visitTypeSelection,
    this.nextFormName,
    this.supervisoryNoteFormID,
    this.userStatus,
    this.roleName,
    this.chatId,required this.success, required this.message, required this.statusCode, this.data});
}


class CompanyListResponse {
  final List<Company> companies;
  final int statusCode;
  final String message;
  final bool success;
  CompanyListResponse({required this.companies, required this.statusCode, required this.message, required this.success});
}

class Company {
  final int companyId;
  final String name;
  final String companyAlias;

  Company({
    required this.companyId,
    required this.name,
    required this.companyAlias,
  });
}
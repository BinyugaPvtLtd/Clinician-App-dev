// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ZoneType { warning, inZone, outOfZone }

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
  ApiData({this.chatId,required this.success, required this.message, required this.statusCode, this.data});
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
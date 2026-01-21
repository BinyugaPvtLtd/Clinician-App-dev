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

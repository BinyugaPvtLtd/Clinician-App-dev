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

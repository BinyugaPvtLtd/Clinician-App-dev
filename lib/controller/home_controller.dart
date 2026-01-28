import 'package:clinician_app/controller/repository/request_repo.dart';
import 'package:clinician_app/core/constant/list_content.dart';
import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/request/patient_schedule_model.dart';
import '../model/request/requestList_model.dart';
import '../services/auth_api_services/auth_services.dart';

class HomeController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isRequestLoading = false.obs;
  final isScheduleLoading = false.obs;
  final error = ''.obs;
  final todayVisitsModel = TodayVisitsModel(
      todaysDate: '', visits: []).obs;
  final patientScheduleModel = PatientScheduleModel(
    imageUrl: '',
    patientName: '',
    diagnosisName: '',
    zoneName: '',
    inZone: false,
    visitTypeName: '',
    address: '',
    visitCharge: 0.0,
    weeks: [],
  ).obs;
  @override
  void onInit() {
    super.onInit();
    requestList.value = List.from(ListContent.requestDataList);
    requestList.refresh();
  }

  RxInt homeIndex = 0.obs;
  RxString statusVal = 'Pending'.obs;

  RxBool isLiveView = false.obs;
  RxList<RequestDataModel> requestList = <RequestDataModel>[].obs;
  RxList<RequestDataModel> get selectedReqTypeList =>
      requestList
          .where(
            (val) =>
                val.status?.toLowerCase().contains(
                  statusVal.value.toLowerCase(),
                ) ??
                false,
          )
          .toList()
          .obs;

  /// Method
  Future<void> fetchListAllDetails({required int clinicianId,
    required String visitStatus,
    required String patientName,}) async {
    todayVisitsModel.value = await getRequestListData(clinicianId: clinicianId, visitStatus: visitStatus, patientName: patientName);
  }

  Future<void> fetchPatientScheduleData({required int visitId,}) async {
    patientScheduleModel.value = await getVisitScheduleData(visitId: visitId);
  }
  Future<TodayVisitsModel> getRequestListData({
    required int clinicianId,
    required String visitStatus,
    required String patientName,

  }) async {
    TodayVisitsModel? itemData;

    String formatIOSDate(String iosDate) {
      if (iosDate.isEmpty) return '';

      DateTime dateTime = DateTime.parse(iosDate);

      return DateFormat('dd MMM yyyy')
          .format(dateTime)
          .toLowerCase();
    }
    String formatTimeToAMPM(String? dateTimeString) {
      if (dateTimeString == null || dateTimeString.isEmpty) return '';

      try {
        final DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
        return DateFormat('h.mm a').format(dateTime).replaceAll(' ', '');
      } catch (e) {
        return '';
      }
    }

    try {
      isRequestLoading.value = true;
      error.value = '';

      final res = await _api.get(
        RequestTabRepo.getRequestAllData(clinicianId: clinicianId, visitStatus: visitStatus, patientName: patientName
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        List<PatientVisitModel> allVisits = [];

        for (var v in res.data['visits']) {
          List<VisitDetailsModel> visitDetails = [];

          for (var x in v['visitList']) {
            visitDetails.add(
              VisitDetailsModel(
                visitId: x['visitId'] ?? 0,
                visitDateFrom: x['visitDateFrom'] != null ? formatIOSDate(x['visitDateFrom']) :  '',
                visitDateTo: x['visitDateTo'] != null ? formatIOSDate(x['visitDateTo']) :  '',
                employeeTypeId: x['employeeTypeId'] ?? 0,
                employeeTypeAbbreviation: x['employeeTypeAbbreviation'] ?? '',
                employeeTypeColor: x['employeeTypeColor'] ?? '',
                visitStartTime: x['visitDateFrom'] != null ? formatTimeToAMPM(x['visitDateFrom']) : '',
                visitEndTime: x['visitDateTo'] != null ? formatTimeToAMPM(x['visitDateTo']) : '',
              ),
            );
          }

          allVisits.add(
            PatientVisitModel(
              visitId: v['visitId'] ?? 0,
              visitDateTime: v['visitDateTime'] != null ?formatIOSDate(v['visitDateTime']):'',
              visitStatus: v['visitStatus'] ?? '',
              visitTime:  v['visitDateTime'] != null ?formatTimeToAMPM(v['visitDateTime']):'',
              ptId: v['pt_id'] ?? 0,
              patientName: v['patientName'] ?? '',
              patientImage: v['patientImage'] ?? '',
              patientGenderId: v['patientGenderId'] ?? 0,
              genderName: v['genderName'] ?? '',
              patientAge: v['patientAge'] ?? 0,
              primaryDiagnosisId: v['primaryDiagnosisId'] ?? 0,
              primaryDiagnosisName: v['primaryDiagnosisName'] ?? '--',
              inZone: v['inZone'] ?? '',
              warning: v['warning'] ?? '',
              zoneId: v['zoneId'] ?? 0,
              zoneName: v['zoneName'] ?? '--',
              patientAddress: v['patientAddress'] ?? '--',
              visitNote: v['visit_note'] ?? '',
              visitCharge:  double.parse(((v['visit_charge'] as num?)?.toDouble() ?? 0.0).toStringAsFixed(2)),
              visitList: visitDetails,
            ),
          );
        }
        itemData = TodayVisitsModel(
          todaysDate: res.data['todaysDate'] ?? '',
          visits: allVisits,
        );
      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isRequestLoading.value = false;
    }

    // ✅ GUARANTEED NON-NULL RETURN
    return itemData ?? TodayVisitsModel(todaysDate: '', visits: []);
  }

  Future<PatientScheduleModel> getVisitScheduleData({
    required int visitId,
  }) async {
    PatientScheduleModel? itemData;

    try {
      isScheduleLoading.value = true;
      error.value = '';

      final res = await _api.get(
        RequestTabRepo.getRequestSchedule(visitId: visitId)
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        // ✅ Weeks mapping
        final List<WeekSchedule> weeksList = [];

        if (data['weeks'] != null) {
          for (var w in data['weeks']) {
            final List<VisitScheduleItem> visitList = [];

            if (w['visits'] != null) {
              for (var v in w['visits']) {
                visitList.add(
                  VisitScheduleItem(
                    visitId: v['visitId'] ?? 0,
                    visitName: v['visitName'] ?? '',
                    visitDate: v['visitDate'] ?? '',
                    visitTimeFrom: v['visitTimeFrom'] ?? '',
                    visitTimeTo: v['visitTimeTo'] ?? '',
                    employeeTypeId: v['employeeTypeId'] ?? 0,
                    employeeTypeAbbreviation: v['employeeTypeAbbreviation'] ?? '',
                    employeeTypeColor: v['employeeTypeColor'] ?? '',
                  ),
                );
              }
            }

            weeksList.add(
              WeekSchedule(
                week: w['week'] ?? 0,
                visits: visitList,
              ),
            );
          }
        }

        // ✅ Final Model
        itemData = PatientScheduleModel(
          imageUrl: data['imageUrl'] ?? '',
          patientName: data['patientName'] ?? '',
          diagnosisName: data['diagnosisName'] ?? '',
          zoneName: data['zoneName'] ?? '',
          inZone: data['inZone'] ?? false,
          visitTypeName: data['visitTypeName'] ?? '',
          address: data['address'] ?? '',
          visitCharge: (data['visitCharge'] ?? 0).toDouble(),
          weeks: weeksList,
        );
      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isScheduleLoading.value = false;
    }

    // ✅ guaranteed return
    return itemData ??
        PatientScheduleModel(
          imageUrl: '',
          patientName: '',
          diagnosisName: '',
          zoneName: '',
          inZone: false,
          visitTypeName: '',
          address: '',
          visitCharge: 0.0,
          weeks: [],
        );
  }

}

import 'package:clinician_app/controller/repository/request_repo.dart';
import 'package:clinician_app/core/constant/list_content.dart';
import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/request/requestList_model.dart';
import '../services/auth_api_services/auth_services.dart';

class HomeController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isRequestLoading = false.obs;
  final error = ''.obs;
  final todayVisitsModel = TodayVisitsModel(
      todaysDate: '', visits: []).obs;
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
    todayVisitsModel.value = await getSubDocumentListDropdown(clinicianId: clinicianId, visitStatus: visitStatus, patientName: patientName);
  }
  Future<TodayVisitsModel> getSubDocumentListDropdown({
    required int clinicianId,
    required String visitStatus,
    required String patientName,

  }) async {
    TodayVisitsModel? itemData;

    String formatIOSDate(String iosDate) {
      if (iosDate.isEmpty) return '';

      DateTime dateTime = DateTime.parse(iosDate);

      return DateFormat('dd-MM-yyyy')
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
              ptId: v['pt_id'] ?? 0,
              patientName: v['patientName'] ?? '',
              patientImage: v['patientImage'] ?? '',
              patientGenderId: v['patientGenderId'] ?? 0,
              genderName: v['genderName'] ?? '',
              patientAge: v['patientAge'] ?? 0,
              primaryDiagnosisId: v['primaryDiagnosisId'] ?? 0,
              primaryDiagnosisName: v['primaryDiagnosisName'] ?? '--',
              inZone: v['inZone'] ?? false,
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
}

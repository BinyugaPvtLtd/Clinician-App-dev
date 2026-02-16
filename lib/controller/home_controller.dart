import 'dart:async';

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

  final todayVisitsModel = TodayVisitsModel(todaysDate: '', visits: []).obs;

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

  RxInt homeIndex = 0.obs;
  RxString statusVal = 'Pending'.obs;

  RxBool isLiveView = false.obs;
  RxList<RequestDataModel> requestList = <RequestDataModel>[].obs;

  RxList<RequestDataModel> get selectedReqTypeList => requestList
      .where(
        (val) =>
    val.status?.toLowerCase().contains(statusVal.value.toLowerCase()) ??
        false,
  )
      .toList()
      .obs;

  // ✅ NEW: first time loader control (UI should use this)
  final RxBool showFirstLoader = true.obs;

  // ✅ NEW: optional thin refresh indicator (not blocking UI)
  final RxBool isSilentRefreshing = false.obs;

  // ✅ NEW: store latest params for polling/search/filter
  int _lastClinicianId = 0;
  String _lastVisitStatus = 'Pending';
  String _lastPatientName = 'all';

  // ✅ NEW: polling + debounce + overlap protection
  Timer? _pollTimer;
  Timer? _debounceTimer;
  bool _isFetching = false;

  @override
  void onInit() {
    super.onInit();

    requestList.value = List.from(ListContent.requestDataList);
    requestList.refresh();

    ever(todayVisitsModel, (v) {
      // ignore: avoid_print
      print("✅ todayVisitsModel updated. total visits: ${v.visits.length}");
    });
  }

  // ✅ NEW: start polling every 2 seconds
  void startAutoRefresh({Duration interval = const Duration(seconds: 1)}) {
    stopAutoRefresh();
    _pollTimer = Timer.periodic(interval, (_) async {
      // silent poll (no first loader)
      await fetchListAllDetails(
        clinicianId: _lastClinicianId,
        visitStatus: _lastVisitStatus,
        patientName: _lastPatientName,
        isPollingCall: true,
      );
    });
  }

  // ✅ NEW: stop polling
  void stopAutoRefresh() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  // ✅ NEW: debounce search (call this from UI onChanged)
  void debounceSearch({
    required String patientName,
    Duration delay = const Duration(milliseconds: 500),
  }) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, () async {
      // update patient name and fetch (not polling)
      await fetchListAllDetails(
        clinicianId: _lastClinicianId,
        visitStatus: _lastVisitStatus,
        patientName: patientName.trim().isEmpty ? 'all' : patientName.trim(),
        isPollingCall: false,
      );

      // keep polling with latest params
      startAutoRefresh();
    });
  }

  @override
  void onClose() {
    stopAutoRefresh();
    _debounceTimer?.cancel();
    super.onClose();
  }

  /// ---------------- FETCH METHODS ----------------
  /// ✅ CHANGED ONLY THIS METHOD (others Future methods untouched)
  Future<void> fetchListAllDetails({
    required int clinicianId,
    required String visitStatus,
    required String patientName,

    /// ✅ NEW: if true -> this is background refresh (no first loader)
    bool isPollingCall = false,
  }) async {
    // store latest params for polling/search/filter
    _lastClinicianId = clinicianId;
    _lastVisitStatus = visitStatus;
    _lastPatientName = patientName.trim().isEmpty ? 'all' : patientName.trim();

    // avoid overlapping calls (very important for 2 sec polling)
    if (_isFetching) return;
    _isFetching = true;

    try {
      // ✅ show small indicator only for polling refresh
      if (isPollingCall && !showFirstLoader.value) {
        isSilentRefreshing.value = true;
      }

      todayVisitsModel.value = await getRequestListData(
        clinicianId: clinicianId,
        visitStatus: visitStatus,
        patientName: _lastPatientName,
      );

      // ✅ After first successful load, disable first loader forever
      if (showFirstLoader.value) {
        showFirstLoader.value = false;
      }
    } finally {
      isSilentRefreshing.value = false;
      _isFetching = false;
    }
  }

  Future<void> fetchPatientScheduleData({required int visitId}) async {
    patientScheduleModel.value = await getVisitScheduleData(visitId: visitId);
  }

  /// ---------------- API METHODS ----------------
  /// ✅ UNCHANGED BELOW (as you requested)

  Future<TodayVisitsModel> getRequestListData({
    required int clinicianId,
    required String visitStatus,
    required String patientName,
  }) async {
    TodayVisitsModel? itemData;

    String formatIOSDate(String iosDate) {
      if (iosDate.isEmpty) return '';
      final DateTime dateTime = DateTime.parse(iosDate);
      return DateFormat('dd MMM yyyy').format(dateTime).toLowerCase();
    }

    String formatTimeToAMPM(String? dateTimeString) {
      if (dateTimeString == null || dateTimeString.isEmpty) return '';
      try {
        final DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
        return DateFormat('h.mm a').format(dateTime).replaceAll(' ', '');
      } catch (_) {
        return '';
      }
    }

    try {
      isRequestLoading.value = true;
      error.value = '';

      final res = await _api.get(
        RequestTabRepo.getRequestAllData(
          clinicianId: clinicianId,
          visitStatus: visitStatus,
          patientName: patientName,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<PatientVisitModel> allVisits = [];

        final visitsRaw = (res.data['visits'] as List?) ?? [];
        for (final v in visitsRaw) {
          final List<VisitDetailsModel> visitDetails = [];

          final visitListRaw = (v['visitList'] as List?) ?? [];
          for (final x in visitListRaw) {
            visitDetails.add(
              VisitDetailsModel(
                visitId: x['visitId'] ?? 0,
                visitDateFrom: x['visitDateFrom'] != null
                    ? formatIOSDate(x['visitDateFrom'])
                    : '',
                visitDateTo: x['visitDateTo'] != null
                    ? formatIOSDate(x['visitDateTo'])
                    : '',
                employeeTypeId: x['employeeTypeId'] ?? 0,
                employeeTypeAbbreviation: x['employeeTypeAbbreviation'] ?? '',
                employeeTypeColor: x['employeeTypeColor'] ?? '',
                visitStartTime: x['visitDateFrom'] != null
                    ? formatTimeToAMPM(x['visitDateFrom'])
                    : '',
                visitEndTime: x['visitDateTo'] != null
                    ? formatTimeToAMPM(x['visitDateTo'])
                    : '',
              ),
            );
          }

          allVisits.add(
            PatientVisitModel(
              visitId: v['visitId'] ?? 0,
              visitDateTime: v['visitDateTime'] != null
                  ? formatIOSDate(v['visitDateTime'])
                  : '',
              visitStatus: v['visitStatus'] ?? '',
              visitTime: v['visitDateTime'] != null
                  ? formatTimeToAMPM(v['visitDateTime'])
                  : '',
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
              distance: v['distance'] ?? 0.0,
              visitCharge: double.parse(
                (((v['visit_charge'] as num?)?.toDouble() ?? 0.0)
                    .toStringAsFixed(2)),
              ),
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

    return itemData ?? TodayVisitsModel(todaysDate: '', visits: []);
  }

  Future<PatientScheduleModel> getVisitScheduleData({
    required int visitId,
  }) async {
    PatientScheduleModel? itemData;

    try {
      isScheduleLoading.value = true;
      error.value = '';

      final res = await _api.get(RequestTabRepo.getRequestSchedule(visitId: visitId));

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        final List<WeekSchedule> weeksList = [];
        final weeksRaw = (data['weeks'] as List?) ?? [];

        for (final w in weeksRaw) {
          final List<VisitScheduleItem> visitList = [];
          final visitsRaw = (w['visits'] as List?) ?? [];

          for (final v in visitsRaw) {
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

          weeksList.add(
            WeekSchedule(
              week: w['week'] ?? 0,
              visits: visitList,
            ),
          );
        }

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

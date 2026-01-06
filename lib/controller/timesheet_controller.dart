import 'dart:async';

import 'package:clinician_app/controller/repository/timesheet_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/app_string.dart';
import '../model/request/request_data_model.dart';
import '../model/timesheet/timesheet_model.dart';
import '../services/auth_api_services/auth_services.dart';

class TimeSheetController extends GetxController {
  final ApiService _api = Get.put(ApiService());

  final isLoading = false.obs;
  final isVisitSaveLoading = false.obs;
  final error = ''.obs;
  // ✅ store record types here (dropdown list)
  final recordTypes = <RecordTypeData>[].obs;
  final visitMaster = <VisitMasterData>[].obs;
  final timeSheetRecord = <TimeSheetAllData>[].obs;
  final patientMaster = <PatientNameData>[].obs;

  // ✅ selected dropdown value (use id)
  final selectedRecordTypeId = 0.obs;
  final selectedRecordName = ''.obs;

  // selecte master visit
  final selectedMasterVisitId = 0.obs;
  final selectedMasterVisitName = ''.obs;

  // selecte master patient
  final selectedPatientId = 0.obs;
  final selectedPatientName = ''.obs;
  final selectedPatientAddress = ''.obs;

  // select time sheet date text
  final isInitialLoading = true.obs; // ✅ only for first load
  final isFetching = false.obs;
  final selectedTypeRecord = 'All'.obs;
  final selectedDate = ''.obs;
  final searchText = 'all'.obs;
  TimeOfDay _selectedTime = TimeOfDay.now();
  Timer? _pollTimer;
  @override
  void onInit() {
    super.onInit();
    fetchRecordType();
    fetchVisitMaster();
    fetchPatientMaster();
    selectedDate.value = _todayDate();
    everAll(
      [selectedTypeRecord, selectedDate, searchText],
          (_) => fetchTimeSheetRecord(),
    );
    // First load (shows loader)
    fetchTimeSheetRecord();

    // Polling (silent)
    _pollTimer = Timer.periodic(
      const Duration(seconds: 5),
          (_) => fetchTimeSheetRecord(silent: true),
    );
  }




  Future<void> fetchTimeSheetRecord({bool silent = false}) async {
    if (isFetching.value) return;
    isFetching.value = true;

    if (!silent) {
      isInitialLoading.value = true; // show loader only first time
    }

    try {
      final list = await getAllTimeSheetData(
        recordType: selectedTypeRecord.value,
        selectDate: selectedDate.value,
        searchText: searchText.value,
      );

      // update only if changed (optional)
      if (list.toString() != timeSheetRecord.toString()) {
        timeSheetRecord.assignAll(list);
      }
    } catch (_) {
      // handle error silently
    } finally {
      isFetching.value = false;
      isInitialLoading.value = false;
    }
  }
  Future<void> fetchRecordType() async {
    final list = await getRecordType();
    recordTypes.assignAll(list);

    // if (recordTypes.isNotEmpty) {
    //   selectedRecordTypeId.value = recordTypes.first.recordId; // int
    //   selectedRecordName.value = recordTypes.first.recordName ?? '';
    // } else {
    //   selectedRecordTypeId.value = 0;
    //   selectedRecordName.value = '';
    // }
  }
  Future<void> fetchVisitMaster() async {
    final list = await getAllVisitMaster();
    visitMaster.assignAll(list);

    // if (visitMaster.isNotEmpty) {
    //   selectedMasterVisitId.value = visitMaster.first.visitMasterId; // int
    //   selectedMasterVisitName.value = visitMaster.first.visitName ?? '';
    // } else {
    //   selectedMasterVisitId.value = 0;
    //   selectedMasterVisitName.value = '';
    // }
  }
  Future<void> fetchPatientMaster() async {
    final list = await getAllPatientMaster(search: 'all');
    patientMaster.assignAll(list);
  }

  // Common method //
  String formatSmartDate(String yyyyMMdd) {
    final DateTime selected = DateTime.parse(yyyyMMdd);
    final DateTime now = DateTime.now();

    final DateTime today =
    DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime yesterday = today.subtract(const Duration(days: 1));

    final String day = selected.day.toString().padLeft(2, '0');
    final String month = _monthName(selected.month);
    final String year = selected.year.toString();
    final String weekday = _weekdayName(selected.weekday);

    final DateTime selectedOnly =
    DateTime(selected.year, selected.month, selected.day);

    if (selectedOnly == today) {
      return "Today , $day $month $year";
    } else if (selectedOnly == tomorrow) {
      return "Tomorrow , $day $month $year";
    } else if (selectedOnly == yesterday) {
      return "Yesterday , $day $month $year";
    } else {
      return "$weekday , $day $month $year";
    }
  }
  String _weekdayName(int weekday) {
    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return days[weekday - 1];
  }
  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
  String formatTimeRange(String from, String to) {
    final fromDate = DateTime.parse(from);
    final toDate = DateTime.parse(to);

    return "${_formatTime(fromDate)}-${_formatTime(toDate)}";
  }
  String _formatTime(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String _todayDate() {
    final now = DateTime.now();
    return "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}";
  }
  Future<void> selectStartTime(
      BuildContext context,
      TextEditingController controller,
      ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: _selectedTime,
      builder: (context, child) {
        // ✅ Force 24-hour format in the picker UI also
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      _selectedTime = picked;

      final String hh = picked.hour.toString().padLeft(2, '0');
      final String mm = picked.minute.toString().padLeft(2, '0');

      controller.text = "$hh:$mm"; // ✅ 09:20 / 14:55
    }
  }




  //// API calls ////

  /// Record type
  Future<List<RecordTypeData>> getRecordType() async {
    List<RecordTypeData> itemData = [];
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.get(TimeSheetRepository.recordType);

      if (res.statusCode == 200 || res.statusCode == 201) {
        for (var i in res.data) {
          itemData.add(
            RecordTypeData(
              recordId: i['recordTypeId'] ?? 0,
              recordName: i['recordTypeName'] ?? '',
            ),
          );
        }
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }

    // ✅ return ONLY here
    return itemData;
  }

  /// Visit master
  Future<List<VisitMasterData>> getAllVisitMaster() async {
    List<VisitMasterData> itemData = [];
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.get(TimeSheetRepository.visitMaster);

      if (res.statusCode == 200 || res.statusCode == 201) {
        for (var i in res.data) {
          itemData.add(
            VisitMasterData(
              visitMasterId: i['visitMasterId'] ?? 0,
              visitName: i['visitName'] ?? '',
              visitDescription: i['visitDescription'] ?? '',
            ),
          );
        }
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }

    // ✅ return ONLY here
    return itemData;
  }
  Future<List<PatientNameData>> getAllPatientMaster(
  {required String search}
      ) async {
    List<PatientNameData> itemData = [];
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.get(TimeSheetRepository.getPatientNameData(search: search));
      if (res.statusCode == 200 || res.statusCode == 201) {
        for (var i in res.data) {
          itemData.add(
            PatientNameData(
                ptId: i['pt_id'] ?? 0,
                ptName: "${i['pt_first_name']??''} ${i['pt_last_name']??''}",
                ptAddress: i['pt_address'] ??''
            ),
          );
        }
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }

    // ✅ return ONLY here
    return itemData;
  }
  Future<ApiData> postAddVisitData({
    required int ptId,
    required int recordTypeId,
    required int visitMasterId,
    required String visitDate,
    required String startTime,
    required String endTime,
    required String status,
  }) async {
    try {
      isVisitSaveLoading.value = true;
      error.value = '';

      final res = await _api.post(TimeSheetRepository.visitAdd, {
          "pt_id": ptId,
          "recordTypeId": recordTypeId,
          "visitMasterId": visitMasterId,
          "visitDate": visitDate,
          "startTime": startTime,
          "endTime": endTime,
          "status": status

      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = res.statusMessage!;
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isVisitSaveLoading.value = false;
    }
  }

  /// time sheet main data
  Future<List<TimeSheetAllData>> getAllTimeSheetData({
    required String recordType,
    required String selectDate,
    required String searchText
}) async {
    List<TimeSheetAllData> itemData = [];
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.get(TimeSheetRepository.getTimeSheetData(
          recordType: recordType,
          chooseData: selectDate,
          search: searchText));

      if (res.statusCode == 200 || res.statusCode == 201) {
        for (var i in res.data) {
          itemData.add(
            TimeSheetAllData(
                ptId: i['pt_id'] ?? 0,
                ptFirstName: i['pt_first_name'] ?? '',
                ptLastName: i['pt_last_name'] ?? '',
                ptAddress: i['pt_address'] ?? '',
                ptImage: i['pt_img_url'] ?? '',
                fkPtDiagnosisId: i['fk_pt_primary_diagnosis'] ?? 0,
                fkPtDiagnosisName: i['fk_pt_primary_diagnosis_name'] ?? '',
                isVisitCompleted: i['isVisitCompleted'] ?? false,
                onWay: i['onWay'] ?? false,
                recrdTypeId: i['recordTypeId'] ?? 0,
                recordTypeName: i['recordTypeName'] ?? '',
                date: i['date'] ?? '',
                visitDateTimeFrom: i['visiteDateTimeFrom'] ?? '',
                visitDateTimeto: i['visitDateTimeTo'] ?? ''

            ),
          );
        }
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }

    // ✅ return ONLY here
    return itemData;
  }
}



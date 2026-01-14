import 'package:clinician_app/controller/repository/calender_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/calender/list_model.dart';
import '../services/auth_api_services/auth_services.dart';

class CalenderListController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isListLoading = false.obs;
  final error = ''.obs;
  final calenderListModel = CalenderListModel(
      visits: []).obs;
  RxInt contentTypeInx = 0.obs;
  Rx<DateTime> currentDate = DateTime.now().obs;
  final calController = CalendarController().obs;

  String get formattedDate =>
      DateFormat('yyyy-MM-dd').format(currentDate.value);
  String get formattedDateReadable =>
      DateFormat('MMMM d, yyyy').format(currentDate.value);

  void changeDate(int day) {
    currentDate.value = currentDate.value.add(Duration(days: day));
    if (contentTypeInx.value == 1) {
      calController.value.displayDate = currentDate.value;
    }
  }

  Future<void> fetchCalenderListDetails({required String status, required String date}) async {
    calenderListModel.value = await getCalenderListData(status: status, date: date);
  }

  Future<CalenderListModel> getCalenderListData({
    required String status,
    required String date,
  }) async {
    CalenderListModel? itemData;

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
      isListLoading.value = true;
      error.value = '';

      final res = await _api.get(
        CalenderRepository.getListCalender(
          status: status,
          date: date,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        List<VisitsListData> visitDataList = [];

        if (res.data["visits"] != null) {
          for (var v in res.data["visits"]) {
            visitDataList.add(
              VisitsListData(
                visitId: v['visitId'] ?? 0,
                patientName: v['patientName'] ?? '',
                patientImgUrl: v['patientImgUrl'] ?? '',
                address: v['address'] ?? '--',
                visitType: v['visitType'] ?? '',
                primaryDiagnosis: v['primaryDiagnosis'] ?? '',
                timeFrom: v['timeFrom'] != null
                    ? formatTimeToAMPM(v['timeFrom'])
                    : '',
                timeTo: v['timeTo'] != null
                    ? formatTimeToAMPM(v['timeTo'])
                    : '',
                inZone: v['inZone'] ?? false,
              ),
            );
          }
        }

        itemData = CalenderListModel(visits: visitDataList);
        print("calendar data ${itemData.visits.length}");
      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isListLoading.value = false;
    }

    // ✅ GUARANTEED NON-NULL RETURN
    return itemData ?? CalenderListModel(visits: []);
  }

}
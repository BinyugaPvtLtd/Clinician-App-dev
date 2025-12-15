import 'package:clinician_app/core/constant/list_content.dart';
import 'package:clinician_app/model/request/request_data_model.dart';
import 'package:get/get.dart';

class VisitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    requestList.value = List.from(ListContent.requestDataList);
    requestList.refresh();
  }

  RxInt homeIndex = 0.obs;
  RxString statusVal = 'Traveling'.obs;
  RxString recordType = ''.obs;
  RxString zoneType = ''.obs;
  RxString status = 'Ongoing'.obs;

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
}

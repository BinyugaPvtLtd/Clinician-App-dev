import 'package:clinician_app/controller/repository/profile_repo.dart';
import 'package:get/get.dart';

import '../model/profile/my_earning_model.dart';
import '../services/auth_api_services/auth_services.dart';

class EarningsController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isEarningLoading = false.obs;
  final isTimeOffSaveLoading = false.obs;
  final error = ''.obs;
  final myTotalEarningModel = MyTotalEarningModel(
      total: 0, thisWeek: 0, thisMonth: 0).obs;
  List<PriceDurationModel> earningsList = [
    PriceDurationModel(duration: "Total", price: "\$22,187"),
    PriceDurationModel(duration: "Today", price: "\$1,342"),
    PriceDurationModel(duration: "This Week", price: "\$7,258"),
    PriceDurationModel(duration: "This Month", price: "\$22,871"),
  ];
  List<PriceDurationModel> visitsList = [

  ];

  RxInt selectedVisit = 0.obs;

  Future<void> fetchMyTotalEarningData() async {
    myTotalEarningModel.value = await getMyTotalEarningData();
    visitsList = [
      PriceDurationModel(duration: "Total", price: "\$${myTotalEarningModel.value.total}"),
      PriceDurationModel(duration: "This Week", price: "\$${myTotalEarningModel.value.thisWeek}"),
      PriceDurationModel(duration: "This Month", price: "\$${myTotalEarningModel.value.thisMonth}"),
    ];
  }


  Future<MyTotalEarningModel> getMyTotalEarningData() async {
    MyTotalEarningModel? itemData ;
    try {
      isEarningLoading.value = true;
      error.value = '';

      final res = await _api.get(ProfileRepository.getMyEarning());

      if (res.statusCode == 200 || res.statusCode == 201) {
        itemData = MyTotalEarningModel(
            total: res.data['total'] ?? 0,
            thisWeek: res.data['thisWeek'] ?? 0,
            thisMonth: res.data['thisMonth'] ?? 0

        );
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isEarningLoading.value = false;
    }

    // ✅ return ONLY here
    return itemData ?? MyTotalEarningModel(total: 0, thisWeek: 0, thisMonth: 0);
  }

}

class PriceDurationModel {
  final String price;
  final String duration;

  PriceDurationModel({required this.price, required this.duration});
}

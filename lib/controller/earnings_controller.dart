import 'package:get/get.dart';

class EarningsController extends GetxController {
  List<PriceDurationModel> earningsList = [
    PriceDurationModel(duration: "Total", price: "\$22,187"),
    PriceDurationModel(duration: "Today", price: "\$1,342"),
    PriceDurationModel(duration: "This Week", price: "\$7,258"),
    PriceDurationModel(duration: "This Month", price: "\$22,871"),
  ];
  List<PriceDurationModel> visitsList = [
    PriceDurationModel(duration: "Total", price: "8"),
    PriceDurationModel(duration: "This Week", price: "58"),
    PriceDurationModel(duration: "This Month", price: "103"),
  ];

  RxInt selectedVisit = 0.obs;
}

class PriceDurationModel {
  final String price;
  final String duration;

  PriceDurationModel({required this.price, required this.duration});
}

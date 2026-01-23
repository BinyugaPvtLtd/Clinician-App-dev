import 'package:clinician_app/controller/repository/notification_repo.dart';
import 'package:clinician_app/model/notification/notification_model.dart';
import 'package:clinician_app/services/token_manager/token_manager_service.dart';
import 'package:get/get.dart';

import '../services/auth_api_services/auth_services.dart';

class NotificationController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isNotificationList = false.obs;
  final error = ''.obs;
  final notificationModelData = <NotificationModelData>[].obs;

  Future<void> fetchNotificationListData() async {
    notificationModelData.value = await getNotificationDataById();
  }

  Future<List<NotificationModelData>> getNotificationDataById() async {
    List<NotificationModelData> itemData = [];
    String timeAgo(String dateTimeString) {
      try {
        final dateTime = DateTime.parse(dateTimeString).toLocal();
        final now = DateTime.now();

        final diff = now.difference(dateTime);

        if (diff.inSeconds < 60) return "Just now";
        if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
        if (diff.inHours < 24) return "${diff.inHours}h ago";
        if (diff.inDays < 7) return "${diff.inDays}d ago";

        final weeks = (diff.inDays / 7).floor();
        if (weeks < 4) return "${weeks}w ago";

        final months = (diff.inDays / 30).floor();
        if (months < 12) return "${months}mo ago";

        final years = (diff.inDays / 365).floor();
        return "${years}y ago";
      } catch (e) {
        // fallback if date parsing fails
        return dateTimeString;
      }
    }

    try {
      isNotificationList.value = true;
      error.value = '';
      final userId = await TokenManager.getUserId();
      final res = await _api.get(
          NotificationRepository.getNotificationList(userId: userId)
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        for(var item in res.data){
          itemData.add(NotificationModelData(
              notifyId: item['notificationId'] ?? 0,
              userId: item['userId'] ?? 0,
              type: item['type'] ?? '',
              title: item['title'] ?? '',
              body: item['body'] ?? '',
              data: item['data'] ?? '',
              isRead: item['isRead'] ?? false,
              callId: item['callId'] ?? 0,
              createdAt: item['createdAt'] != null ? timeAgo(item['createdAt']) : '',
              updatedAt: item['updatedAt'] ?? ''));
        }
      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isNotificationList.value = false;
    }

    // ✅ guaranteed return
    return itemData;
  }
}
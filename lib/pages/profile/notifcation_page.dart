import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationController notificationController =
  Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    notificationController.fetchNotificationListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "Notifications",
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
            Expanded(
              child: Obx(() {
                // ✅ Loading
                if (notificationController.isNotificationList.value) {
                  return const Center(child: CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ));
                }
                if(notificationController.notificationModelData.isEmpty){
                  return Center(
                    child: Text(
                      "No notifications",
                      style: AppTextStyle.regular12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  );
                }
                // ✅ Error
                if (notificationController.error.value.isNotEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            notificationController.error.value,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular12style.copyWith(
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          TextButton(
                            onPressed: () {
                              notificationController.fetchNotificationListData();
                            },
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // ✅ Empty State
                if (notificationController.notificationModelData.isEmpty) {
                  return Center(
                    child: Text(
                      "No notifications",
                      style: AppTextStyle.regular12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  );
                }

                // ✅ Convert API data -> NotificationItem (UI model)
                final notifications = notificationController.notificationModelData
                    .map((i) => NotificationItem(
                  icon: i.callId != 0 ? Icons.call:Icons.notifications,
                  color: Colors.blue,
                  title: i.type,
                  subtitle: i.title,
                  time: i.createdAt,
                  // buttonText: i.type == "certificate_expired" ? "Update" : null, // optional
                ))
                    .toList();

                // ✅ Render list
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationTile(notifications[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- UI CLASSES (UNCHANGED) ----------------

class NotificationItem {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;
  final String? buttonText;

  NotificationItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
    this.buttonText,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  const NotificationTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: item.color.withValues(alpha: 0.15),
              child: Icon(item.icon, color: item.color),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyle.bold14style.copyWith(
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                  customHeight(4.h),
                  Text(
                    item.subtitle,
                    style: AppTextStyle.regular10style.copyWith(
                      color: AppColors.defaultTxtGrey,
                    ),
                  ),
                  if (item.buttonText != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue.shade50,
                          foregroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 21.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ),
                        child: Text(
                          item.buttonText!,
                          style: AppTextStyle.normal10style.copyWith(
                            color: Color(0xff65BCE8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              item.time,
              style: AppTextStyle.regular10style.copyWith(
                color: AppColors.defaultTxtGrey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

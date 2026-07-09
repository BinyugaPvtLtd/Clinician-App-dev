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
            // ------- Appbar with "Mark all read" -------
            Row(
              children: [
                Expanded(
                  child: CommonAppbar(
                    label: "Notifications",
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 15.h,
                      bottom: 8.h,
                    ),
                  ),
                ),
                // ✅ Mark all read button (only shows if there are unread)
                Obx(() {
                  final hasUnread = notificationController
                      .notificationModelData
                      .any((n) => n.isRead == false);
                  if (!hasUnread) return const SizedBox.shrink();
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w, top: 8.h),
                    child: InkWell(
                      onTap: () => notificationController.markAllAsRead(),
                      child: Text(
                        "Mark all read",
                        style: AppTextStyle.regular12style.copyWith(
                          color: AppColors.primaryAppColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            Divider(),
            Expanded(
              child: Obx(() {
                // ✅ Loading
                if (notificationController.isNotificationList.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryAppColor,
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
                            "Server error occurred. Please try again later.",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular12style.copyWith(
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          TextButton(
                            onPressed: () {
                              notificationController
                                  .fetchNotificationListData();
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
                      "No notifications found!",
                      style: AppTextStyle.regular12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                      ),
                    ),
                  );
                }

                // ✅ Render list directly from model (so isRead updates reflect)
                final data = notificationController.notificationModelData;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final i = data[index];
                    return Dismissible(
                      key: ValueKey(i.notifyId),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.w),
                        margin: EdgeInsets.only(bottom: 20.h),
                        color: Colors.red.shade50,
                        child: Icon(Icons.delete_outline,
                            color: Colors.red, size: 22),
                      ),
                      // ✅ Only remove row if delete API succeeds
                      confirmDismiss: (_) async {
                        final deleted = await notificationController
                            .removeNotification(i.notifyId);
                        if (deleted && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Row(
                                children: [
                                  Expanded(
                                    child: Text("Notification deleted"),
                                  ),
                                ],
                              ),
                              backgroundColor: AppColors.redBackGColor,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(12),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                        return deleted;
                      },
                      child: NotificationTile(
                        NotificationItem(
                          icon: i.callId != 0
                              ? Icons.call
                              : Icons.notifications,
                          color: Colors.blue,
                          title: i.type,
                          subtitle: i.title,
                          time: i.createdAt,
                          isRead: i.isRead,
                        ),
                        // ✅ Tap to mark as read
                        onTap: () =>
                            notificationController.markAsRead(i.notifyId),
                      ),
                    );
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

// ---------------- UI CLASSES ----------------

class NotificationItem {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;
  final String? buttonText;
  final bool isRead;

  NotificationItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
    this.buttonText,
    this.isRead = false,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap;
  const NotificationTile(this.item, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // ✅ subtle highlight for unread notifications
        color: item.isRead
            ? Colors.white
            : AppColors.primaryAppColor.withValues(alpha: 0.05),
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
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.time,
                    style: AppTextStyle.regular10style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  // ✅ unread dot
                  if (!item.isRead)
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryAppColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
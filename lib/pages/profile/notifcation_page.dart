import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationItem(
        icon: Icons.traffic,
        color: Colors.grey.shade800,
        title: "Route Updated Due to Traffic Conditions",
        subtitle:
            "Your route has been adjusted based on real-time traffic and daily congestion for an optimized visit schedule.",
        time: "1h ago",
      ),
      NotificationItem(
        icon: Icons.check_circle,
        color: Colors.teal,
        title: "Visits Completed",
        subtitle: "5 done, 3 remaining",
        time: "1h ago",
      ),
      NotificationItem(
        icon: Icons.verified,
        color: Colors.blue,
        title: "Certificate updated",
        subtitle:
            "Your certificate has been successfully updated and saved in the system.",
        time: "1h ago",
      ),
      NotificationItem(
        icon: Icons.warning,
        color: Colors.purple,
        title: "Your certificate has expired",
        subtitle: "Access may be restricted until it's updated",
        time: "1h ago",
        buttonText: "Update",
      ),
      NotificationItem(
        icon: Icons.hourglass_empty,
        color: Colors.indigo,
        title: "Visits Pending",
        subtitle: "3 remaining",
        time: "2:35 PM",
      ),
      NotificationItem(
        icon: Icons.attach_money,
        color: Colors.orange,
        title: "\$ Earning",
        subtitle: "\$250 earned, \$150 expected",
        time: "3:20 PM",
      ),
      NotificationItem(
        icon: Icons.calendar_month,
        color: Colors.blue.shade100,
        title: "Rescheduled Appointment",
        subtitle:
            "Your visit with Christina William has been rescheduled to 9:00 pm",
        time: "5:58 PM",
      ),
    ];

    return Scaffold(
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
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationTile(notifications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                            // vertical: 2.h,
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

import 'package:clinician_app/controller/home_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final notifications = [
      _ItemModel(
        icon: AppAsset.clockSvgIcon,
        color: Color(0xffF3994A),
        title: "You'll be 10 min early at John Scott's place.",
        time: "5m ago",
      ),
      _ItemModel(
        icon: AppAsset.largeCalenderSvgIcon,
        color: Color(0xff57CCF2),
        title:
            "John Smith wants to Reschedule his Appointment to Date - 01/05/2024",
        time: "20m ago",
        botttomWidget: Row(
          children: [
            PrimaryOutlinedButton(
              width: 95.w,
              height: 27.h,
              radius: 6.r,
              borderWidth: 1.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
              text: 'Accept',
              textStyle: AppTextStyle.normal12style.copyWith(
                color: AppColors.primaryAppColor,
              ),
              onPressed: () {},
            ),
            customWidth(10.w),
            PrimaryOutlinedButton(
              width: 95.w,
              height: 27.h,
              radius: 6.r,
              borderWidth: 1.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
              text: 'Reject',
              textStyle: AppTextStyle.normal12style.copyWith(
                color: AppColors.primaryAppColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      _ItemModel(
        icon: AppAsset.onTimeClockSvgIcon,
        color: Color(0xffF1519C),
        title:
            "Doesn't look like you'll make it on time for Mary Ann's visit, call her?",
        time: "34m ago",
        botttomWidget: Row(
          children: [
            PrimaryOutlinedButton(
              width: 70.w,
              height: 23.h,
              radius: 6.r,
              borderWidth: 1.w,
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 2.h),
              text: 'Yes',
              textStyle: AppTextStyle.normal12style.copyWith(
                color: AppColors.primaryAppColor,
              ),
              onPressed: () {},
            ),
            customWidth(10.w),
            PrimaryOutlinedButton(
              width: 70.w,
              height: 23.h,
              radius: 6.r,
              borderWidth: 1.w,
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 2.h),
              text: 'No',
              textStyle: AppTextStyle.normal12style.copyWith(
                color: AppColors.primaryAppColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      _ItemModel(
        icon: AppAsset.tickCalenderSvgIcon,
        color: Color(0xffBB6BCF),
        title: "On time for Jennifer Lawrence",
        time: "1h ago",
      ),
      _ItemModel(
        icon: AppAsset.stopWatchSvgIcon,
        color: Color(0xff00B779),
        title: "You'll reach 15 minutes early.",
        time: "2:35 PM",
      ),
      _ItemModel(
        icon: AppAsset.locationRouteSvgIcon,
        color: Color(0xff9853E3),
        title:
            '''There is congestion on the road ahead. We recommend taking an alternate route to avoid delays.''',
        time: "3:20 PM",
        botttomWidget: PrimaryOutlinedButton(
          width: 120.w,
          height: 30.h,
          radius: 6.r,
          borderWidth: 1.w,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          text: 'Open Map',
          icon: Image.asset(AppAsset.googleMapIcon),
          textStyle: AppTextStyle.normal14style.copyWith(
            color: AppColors.primaryAppColor,
            fontWeight: FontWeight.w600,
          ),
          onPressed: () {},
        ),
      ),
    ];

    return Scaffold(
      floatingActionButton: ChatFABWidget(),
      body: SafeArea(
        child: Column(
          children: [
            CommonAppbar(
              label: "Live",
              onTap: () {
                homeController.homeIndex.value = 2;
                homeController.isLiveView.value = false;
              },
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

class _ItemModel {
  final String icon;
  final Color color;
  final String title;
  final String time;
  final Widget? botttomWidget;

  _ItemModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
    this.botttomWidget,
  });
}

class NotificationTile extends StatelessWidget {
  final _ItemModel item;
  const NotificationTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: item.color,
              child: SvgPicture.asset(item.icon),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyle.bold12style.copyWith(
                      color: AppColors.textGreyColor,
                    ),
                  ),
                  customHeight(4.h),
                  // Text(
                  //   item.subtitle,
                  //   style: AppTextStyle.regular10style.copyWith(
                  //     color: AppColors.defaultTxtGrey,
                  //   ),
                  // ),
                  if (item.botttomWidget != null) item.botttomWidget!,
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              item.time,
              style: AppTextStyle.regular10style.copyWith(
                color: Colors.black,
                fontSize: 9.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:clinician_app/pages/home/widget/clinician_info_dialog.dart';
import 'package:clinician_app/pages/home/widget/home_appbar_widget.dart';
import 'package:clinician_app/pages/home/widget/see_route_dialog.dart';
import 'package:clinician_app/pages/home/widget/visit_overlay_widget.dart';
import 'package:clinician_app/utils/global_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_stack/image_stack.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  RxInt mapInx = 0.obs;
  final List<UserProgress> users = [
    UserProgress('Ralph Edwards', '\$55.00', true, true),
    UserProgress('Devon Lane', '\$55.00', true, true),
    UserProgress('Jerome Bell', '\$55.00', true, true),
    UserProgress('Eleanor Pena', '\$55.00', true, false, isCurrent: true),
    UserProgress('Wade Warren', '\$55.00', false, false),
    UserProgress('Bessie Cooper', '\$55.00', false, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbarWidget(),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Obx(
                  () => Visibility(
                    visible: mapInx.value == 0,
                    // list view
                    replacement: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          customHeight(140.h),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: userList.length,
                              itemBuilder: (_, index) {
                                final user = userList[index];
                                return CustomTimelineCard(
                                  name: user.name,
                                  time: '1:00 PM 1:34 PM',
                                  amount: '\$55.00',
                                  index: index,
                                  isDone: index < 3,
                                  isCurrent: index == 3,
                                  imageUrl: user.imageUrl,
                                  length: userList.length,
                                );
                              },
                            ),
                          ),
                          customHeight(110.h),
                          // Flexible(
                          //   child: Timeline.tileBuilder(
                          //     builder: TimelineTileBuilder(
                          //       itemCount: 6,
                          //       itemExtent: 60.h,
                          //       startConnectorBuilder:
                          //           (context, index) =>
                          //               index > 0
                          //                   ? DashedLineConnector(
                          //                     thickness: 2.w,
                          //                     dash: 4,
                          //                     color: Colors.black,
                          //                     gap: 2,
                          //                   )
                          //                   : null,
                          //       endConnectorBuilder:
                          //           (context, index) =>
                          //               index < 5
                          //                   ? DashedLineConnector(
                          //                     thickness: 2.w,
                          //                     dash: 4,
                          //                     color: Colors.black,
                          //                     gap: 2,
                          //                   )
                          //                   : null,
                          //       indicatorBuilder: (_, index) {
                          //         final user = users[index];
                          //         if (user.isCurrent) {
                          //           return DotIndicator(
                          //             color: Colors.transparent,
                          //             child: SvgPicture.asset(
                          //               AppAsset.locationPinSvgIcon,
                          //               width: 13.w,
                          //             ),
                          //           );
                          //         } else if (user.isDone) {
                          //           return DotIndicator(
                          //             // color: Colors.green,
                          //             color: Colors.transparent,
                          //             child: SizedBox(
                          //               width: 18.w,
                          //               height: 18.h,
                          //               child: Radio(
                          //                 value: true,
                          //                 groupValue: true,
                          //                 onChanged: (value) {},
                          //                 fillColor: WidgetStatePropertyAll(
                          //                   Colors.green,
                          //                 ),
                          //                 activeColor: Colors.green,
                          //               ),
                          //             ),
                          //           );
                          //         } else {
                          //           return OutlinedDotIndicator(
                          //             borderWidth: 2,
                          //             color: Colors.black,
                          //             backgroundColor: Colors.white,
                          //           );
                          //         }
                          //       },
                          //       contentsBuilder: (_, index) {
                          //         final user = users[index];
                          //         return Container(
                          //           width: double.maxFinite,
                          //           decoration: BoxDecoration(
                          //             color: Colors.amber,
                          //           ),
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: ListTile(
                          //             tileColor:
                          //                 user.isCurrent
                          //                     ? Colors.blue.shade50
                          //                     : Colors.white,
                          //             title: Text(
                          //               user.name,
                          //               style: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //                 color:
                          //                     user.isCurrent
                          //                         ? Colors.black
                          //                         : Colors.grey.shade800,
                          //               ),
                          //             ),
                          //             subtitle: Text('1:00 PM  1:34 PM'),
                          //             trailing: Text(
                          //               user.amount,
                          //               style: TextStyle(
                          //                 color:
                          //                     user.isCurrent
                          //                         ? Colors.blue
                          //                         : Colors.green,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize: 16,
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // Map view
                    child: InkWell(
                      onTap: () {
                        GlobalOverlay().show(
                          context: context,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          child: Positioned(
                            right: 0,
                            top: 200.h,
                            child: VisitOverlayWidget(),
                          ),
                        );
                      },
                      child: Image.asset(AppAsset.mapImg, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    customHeight(10.h),
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          ClinicianInfoDialog(),
                          barrierColor: Colors.white38,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2.w, 2.h),
                              blurRadius: 4.r,
                              color: Colors.black.withValues(alpha: 0.16),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 51.h,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 46.h,
                                    width: 46.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: GradientBoxBorder(
                                        width: 1.w,
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Color(0xffCE9E2F),
                                            Color(0xffE4AC31),
                                            Color(0xff9F7302),
                                            Color(0xffC08503),
                                            Color(
                                              0xffBB720A,
                                            ).withValues(alpha: 0.69),
                                            Color(0xffBE892F),
                                            Color(
                                              0xffC47B13,
                                            ).withValues(alpha: 0.69),
                                            Color(
                                              0xffC58413,
                                            ).withValues(alpha: 0.807),
                                            Color(0xffB8830F),
                                            Color(0xffDD9D34),
                                            Colors.black,
                                          ],
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2.w, 2.h),
                                          blurRadius: 4.r,
                                          color: Colors.black.withValues(
                                            alpha: 0.16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(AppAsset.avatarImg),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                        color: AppColors.appYellowColor,
                                      ),
                                      child: Text(
                                        'OT',
                                        style: AppTextStyle.normal10style
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            customWidth(10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Christina William',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                customHeight(6.h),
                                Text(
                                  'Potential Earning  -  \$451',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            customWidth(30.w),
                            Column(
                              children: [
                                ImageStack.providers(
                                  providers: [
                                    AssetImage(AppAsset.avatarImg),
                                    AssetImage(AppAsset.avatarImg),
                                    AssetImage(AppAsset.avatarImg),
                                  ],
                                  extraCountBorderColor: Colors.transparent,
                                  extraCountTextStyle: AppTextStyle
                                      .normal10style
                                      .copyWith(fontWeight: FontWeight.w600),
                                  imageBorderColor: AppColors.primaryAppColor,
                                  totalCount: 9,
                                  imageRadius: 20.r,
                                  imageCount: 3,
                                  imageBorderWidth: 0.5.w,
                                ),
                                customHeight(4.h),
                                Text(
                                  'Active Patients',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    customHeight(10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 27.w,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: AppColors.primaryAppColor,
                            width: 1.w,
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            2,
                            (index) => InkWell(
                              onTap: () {
                                mapInx.value = index;
                              },
                              child: Obx(
                                () => Container(
                                  width: 45.w,
                                  height: 27.h,
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color:
                                        mapInx.value == index
                                            ? AppColors.primaryAppColor
                                            : Colors.white,
                                  ),
                                  child: Text(
                                    index == 0 ? 'Map' : 'List',
                                    style: AppTextStyle.normal14style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          mapInx.value == index
                                              ? Colors.white
                                              : AppColors.primaryAppColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 68.h,
                child: InkWell(
                  onTap: () {
                    Get.dialog(SeeRouteDialog());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 9.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryAppColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6.r),
                        bottomRight: Radius.circular(6.r),
                      ),
                    ),
                    child: Text(
                      'See Route',
                      style: AppTextStyle.normal14style.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(right: 25.w, bottom: 58.h, child: ChatFABWidget()),
            ],
          ),
        ),
      ],
    );
  }
}

class UserProgress {
  final String name;
  final String amount;
  final bool isDone;
  final bool showCheck;
  final bool isCurrent;

  UserProgress(
    this.name,
    this.amount,
    this.isDone,
    this.showCheck, {
    this.isCurrent = false,
  });
}

class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

final List<User> userList = [
  User(name: 'Ralph Edwards', imageUrl: 'https://i.pravatar.cc/100?img=1'),
  User(name: 'Devon Lane', imageUrl: 'https://i.pravatar.cc/100?img=2'),
  User(name: 'Jerome Bell', imageUrl: 'https://i.pravatar.cc/100?img=3'),
  User(name: 'Eleanor Pena', imageUrl: 'https://i.pravatar.cc/100?img=4'),
  User(name: 'Wade Warren', imageUrl: 'https://i.pravatar.cc/100?img=5'),
  User(name: 'Bessie Cooper', imageUrl: 'https://i.pravatar.cc/100?img=6'),
];

class CustomTimelineCard extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final int index;
  final bool isDone;
  final bool isCurrent;
  final String imageUrl;
  final int length;

  const CustomTimelineCard({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    required this.index,
    required this.isDone,
    required this.isCurrent,
    required this.imageUrl,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container with decoration
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 18.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color:
                isCurrent
                    ? Colors.white
                    : isDone
                    ? Color(0xffF3F3F3)
                    : Color(0xffE8F7FE),
            border: Border.all(
              color: isCurrent ? Colors.blue : Colors.transparent,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              customWidth(35.w),
              Text(
                '${index + 1}',
                style: AppTextStyle.normal12style.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(backgroundImage: AssetImage(AppAsset.avatarImg)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.normal12style.copyWith(
                      fontWeight: FontWeight.w700,
                      color:
                          isCurrent
                              ? Colors.black
                              : isDone
                              ? AppColors.textGreyColor
                              : AppColors.iconGreyColor,
                    ),
                  ),
                  customHeight(4.h),
                  Text(
                    time,
                    style: AppTextStyle.normal10style.copyWith(
                      fontWeight: FontWeight.w300,
                      color:
                          isCurrent
                              ? Colors.black
                              : isDone
                              ? AppColors.textGreyColor
                              : AppColors.iconGreyColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                amount,
                style: AppTextStyle.normal12style.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color:
                      isCurrent
                          ? AppColors.primaryAppColor
                          : isDone
                          ? Color(0xff008000)
                          : Colors.black,
                ),
              ),
              customWidth(10.w),
            ],
          ),
        ),

        // Timeline Circle and Line
        Positioned(
          left: 28,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              // Top dotted line
              // if (index > 0)
              Expanded(
                child: Dash(
                  dashColor: index > 0 ? Colors.black : Colors.transparent,
                  direction: Axis.vertical,
                  dashThickness: 2.w,
                  dashLength: 5,
                  dashGap: 2,
                  dashBorderRadius: 2.r,
                  length: 25.h,
                ),
                // child: Container(
                //   width: 2,
                //   color: index > 0 ? Colors.black : Colors.transparent,
                //   height: 20,
                // ),
              ),
              // Circle or pin icon
              Container(
                width: 22.w,
                margin: EdgeInsets.only(bottom: 2.h),
                child:
                    isCurrent
                        ? SvgPicture.asset(
                          AppAsset.locationPinSvgIcon,
                          width: 13.w,
                        )
                        : isDone
                        ? SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: Radio(
                            value: true,
                            groupValue: true,
                            onChanged: (value) {},
                            fillColor: WidgetStatePropertyAll(
                              Color(0xff3A9A40),
                            ),
                            activeColor: Color(0xff3A9A40),
                          ),
                        )
                        : Container(
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2.w, color: Colors.black),
                            color: Colors.white,
                          ),
                        ),
              ),
              // Bottom line
              Expanded(
                child: Column(
                  children: [
                    Dash(
                      dashColor:
                          index < length - 1
                              ? Colors.black
                              : Colors.transparent,
                      direction: Axis.vertical,
                      dashThickness: 2.w,
                      dashLength: 5,
                      dashGap: 2,
                      dashBorderRadius: 2.r,
                      length: 25.h,
                    ),
                    customHeight(1.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

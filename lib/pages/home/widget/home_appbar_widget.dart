import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/profile/notifcation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeAppbarWidget extends StatefulWidget {
  const HomeAppbarWidget({super.key});

  @override
  State<HomeAppbarWidget> createState() => _HomeAppbarWidgetState();
}

class _HomeAppbarWidgetState extends State<HomeAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      child: Row(
        children: [
          Icon(Icons.menu),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.symmetryLogoImg, width: 31.w),
                customWidth(6.w),
                Text(
                  'Symmetry',
                  style: AppTextStyle.normal16style.copyWith(
                    color: AppColors.secondaryAppColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NotificationPage());
            },
            child: SvgPicture.asset(
              AppAsset.notificationSvgIcon,
              colorFilter: ColorFilter.mode(
                AppColors.defaultTxtGrey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

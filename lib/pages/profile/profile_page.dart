import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/pages/profile/document.dart';
import 'package:clinician_app/pages/profile/edit_profile.dart';
import 'package:clinician_app/pages/profile/my_earnings_page.dart';
import 'package:clinician_app/pages/profile/pending_page.dart';
import 'package:clinician_app/pages/profile/time_off_page.dart';
import 'package:clinician_app/pages/profile/widgets/logout_dailog.dart';
import 'package:clinician_app/pages/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import '../../core/common/hex_color_decoder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppbar(
              label: "My Profile",
              trailing: InkWell(
                onTap: () {
                  controller.fetchRecordType();
                  Get.to(() => EditProfilePage(employeeId: controller.employeeId.value,));
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: AppColors.defaultTxtGrey),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
            customHeight(30.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),

                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: controller.clinitinaLoginDataModel.value.imageUrl.isEmpty ? 
                                AssetImage(AppAsset.profilePicImg) : NetworkImage(controller.clinitinaLoginDataModel.value.imageUrl),
                                radius: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 50.h, left: 50.w),
                                child: Container(
                                  height: 20.h,

                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: hexToColor(controller.clinitinaLoginDataModel.value.color),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.clinitinaLoginDataModel.value.abbreviation,
                                      style: AppTextStyle.normal10style
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          customWidth(20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.clinitinaLoginDataModel.value.clinicianFullName,
                                style: AppTextStyle.regular16style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                              Text(
                                "${controller.clinitinaLoginDataModel.value.gender} | ${controller.clinitinaLoginDataModel.value.age}y",
                                style: AppTextStyle.regular16style.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.defaultTxtGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    customHeight(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: textMenuWidget(
                        title: "Document Update",
                        ontap: () {
                          Get.to(() => DocumnetPage(empId: controller.employeeId.value,));
                        },
                        imageicon: AppAsset.document,
                      ),
                    ),
                    Divider(height: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: textMenuWidget(
                        ontap: () {
                          Get.to(() => TimeOffPage(employeeId: controller.employeeId.value,));
                        },
                        title: "Time Off",
                        imageicon: AppAsset.timer,
                      ),
                    ),
                    Divider(height: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: textMenuWidget(
                        title: "Pending Visit Notes/ Oasis",
                        imageicon: AppAsset.pending,
                        ontap: () {
                          Get.to(() => PendingVisits());
                        },
                      ),
                    ),
                    Divider(height: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: textMenuWidget(
                        ontap: () {
                          Get.to(() => MyEarningPage());
                        },
                        title: "My Earning",
                        imageicon: AppAsset.earning,
                      ),
                    ),
                    Divider(height: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: textMenuWidget(
                        ontap: () {
                          showLogoutConfirmationDialog(context);
                        },
                        title: "Logout",
                        imageicon: AppAsset.logout,
                      ),
                    ),
                    Divider(height: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

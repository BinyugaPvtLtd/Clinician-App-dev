

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

import '../../../controller/profile_controller.dart';
import '../../../model/profile/clinitina_data_model.dart';
import '../../../services/token_manager/token_manager_service.dart';
import '../../profile/widgets/logout_dailog.dart';

class TabletAppBar extends StatefulWidget {
  TabletAppBar(
      {super.key, required this.headingText, required this.openDrawer, this.showDrawer = true});

  final String headingText;
  final VoidCallback openDrawer;
  final bool showDrawer;

  @override
  State<TabletAppBar> createState() => _TabletAppBarState();
}

class _TabletAppBarState extends State<TabletAppBar> {


  String? loginName = '';
  String? loginEmail = '';

  //int loginUserId = 0;
  bool isLoggedIn = true;

  Future<String> user() async {
    loginName = await TokenManager.getUserName();
    //loginName = userName;
    print("UserName login ${loginName}");
    return loginName!;
  }

  Future<String> email() async {
    loginEmail = await TokenManager.getEmail();
    //loginName = userName;
    print("loginEmail login ${loginEmail}");
    return loginEmail!;
  }

  Future<ClinitinaLoginDataModel?> getAppBarDetails() async {
    final profileController = Get.put(ProfileController());
    await profileController.fetchClinitionLoginDetails();
    return profileController.clinitinaLoginDataModel.value;
  }

  // Future<void> setUserId() async {
  //   loginUserId = await TokenManager.getuserId();
  //   print("UserId for appbar: $loginUserId");
  //   setState(() {}); // Ensure UI updates with the new user ID
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          height: AppBar().preferredSize.height + 5.h,
          width: double.maxFinite,
          child: Row(
            children: [
              if (widget.showDrawer) sbw(5),
              if (widget.showDrawer)
                InkWell(
                  onTap: () {
                    widget.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 24.sp,
                    color: AppColors.primaryAppLightColor,
                  ),
                ),
        
              ///logo
              Container(
                width: 50.w,
                height: 50,
                margin: EdgeInsets.only(left: 5.w),
                child: Image.asset(
                  AppAsset.symmetryLogoImg,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.headingText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FormBuilderTextStyle.bold14style
                                .copyWith(fontSize: 14.sp, color: Colors.black),
                          ),
                        ),
                        sbw(10),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MouseRegion(
                                onEnter: (_) {},
                                onExit: (_) {},
                                child: FutureBuilder<ClinitinaLoginDataModel?>(
                                  future: getAppBarDetails(),
                                  builder: (context, snapshot) {
                                    final imageUrl = snapshot.data?.imageUrl;
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        snapshot.hasError ||
                                        imageUrl == null ||
                                        imageUrl.isEmpty) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.grey[100],
                                        radius: 13.r,
                                        backgroundImage: const AssetImage(
                                            "assets/png/profilepic.png"),
                                      );
                                    }
                                    return CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 13.r,
                                      backgroundImage: NetworkImage(imageUrl),
                                    );
                                  },
                                ),
                              ),
                              sbw(5),
                              Flexible(
                                child: FutureBuilder(
                                  future: user(),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return const SizedBox();
                                    }
        
                                    return MouseRegion(
                                      onEnter: (_) {
                                        showMenu(
                                          context: context,
                                          position: RelativeRect.fromLTRB(
                                              70.w, 70.h, 0, 0),
                                          items: [
                                            PopupMenuItem(
                                              padding: EdgeInsets.zero,
                                              height: 30.h,
                                              child: GestureDetector(
                                                onTap: () {
                                                  // if (isLoggedIn) {
                                                    showLogoutConfirmationDialog(
                                                        context);
                                                  // }
                                                },
                                                child: Container(
                                                  height: 25.h,
                                                  width: 90.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                      vertical: 5.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.logout,
                                                        size: 12.sp,
                                                        color: Colors.black,
                                                      ),
                                                      Text(
                                                        'Log Out',
                                                        style: FormBuilderTextStyle
                                                            .normal10style
                                                            .copyWith(
                                                          fontSize: 12.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      child: Text(
                                        loginName ?? '',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: FormBuilderTextStyle
                                            .normal10style
                                            .copyWith(
                                          fontSize: 12.sp,
                                          color: const Color(0XFF2EA3D4),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              sbw(4),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 18.sp,
                                color: const Color(0xFF2EA3D4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



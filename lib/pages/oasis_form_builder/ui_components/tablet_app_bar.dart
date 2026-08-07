

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
      child: SizedBox(
        height: AppBar().preferredSize.height + 5,
        width: double.maxFinite,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(widget.showDrawer)sbw(5),
            if(widget.showDrawer)InkWell(
              onTap: () {
                widget.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: AppColors.primaryAppLightColor,
              ),
            ),

            ///logo
            Container(
              width: 120,
              //color: Colors.red,
              margin: const EdgeInsets.only(
                left: 5,
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Image.asset(
                'images/logo_login.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width - 242,
                margin: const EdgeInsets.only(
                    left: 10, right: 0, top: 5, bottom: 5),
                child: Material(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///ask klip
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.headingText,
                                style: FormBuilderTextStyle.bold14style.copyWith(color: Colors.black),
                              ),
                            ),

                            Expanded(
                              flex: 3,
                              child: Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MouseRegion(
                                    onEnter: (_) {},
                                    onExit: (_) {
                                      // Handle mouse leave
                                    },
                                    child: FutureBuilder<ClinitinaLoginDataModel?>(
                                      future: getAppBarDetails(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircleAvatar(
                                            backgroundColor: Colors.grey[100],
                                            radius: 13,
                                            backgroundImage: AssetImage(
                                                "images/profilepic.png"),
                                          );
                                        } else if (snapshot.hasError ||
                                            snapshot.data == null ||
                                            snapshot.data!.imageUrl.isEmpty) {
                                          return CircleAvatar(
                                            backgroundColor: Colors.grey[100],
                                            radius: 13,
                                            backgroundImage: AssetImage(
                                                "images/profilepic.png"),
                                          );
                                        } else {
                                          return CircleAvatar(
                                            backgroundColor:
                                                Colors.transparent,
                                            radius:
                                                13, // Adjust size as needed
                                            backgroundImage: NetworkImage(
                                              snapshot.data!.imageUrl,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  FutureBuilder(
                                    future: user(),
                                    builder: (context, snap) {
                                      if (snap.connectionState ==
                                          ConnectionState.waiting) {
                                        print("User data is loading...");
                                        return SizedBox();
                                      }

                                      return MouseRegion(
                                        onEnter: (_) {
                                          // Show logout popup when hovering over username
                                          print("Showing logout menu...");
                                          showMenu(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                70, 70, 0, 0),
                                            // Adjust position as needed
                                            items: [
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                height: 30,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (isLoggedIn) {
                                                      showLogoutConfirmationDialog(
                                                          context);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 90,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 5),
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
                                                          size: 12,
                                                          color: Colors.black,
                                                        ),
                                                        Text(
                                                          'Log Out',
                                                          style: TextStyle(
                                                            fontSize: 12,
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
                                        child: Text(loginName!,
                                            textAlign: TextAlign.center,
                                            style: FormBuilderTextStyle
                                                .normal10style
                                                .copyWith(
                                              color: Color(0XFF2EA3D4),
                                            )),
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF2EA3D4),
                                  )
                                ],
                              ),
                            )
                          ],
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
    );
  }
}

class AppBarDropdown extends StatefulWidget {
  final String? initialValue;
  final Function(String)? onChange;
  final bool? isEnabled;

  const AppBarDropdown(
      {super.key, this.initialValue, this.onChange, this.isEnabled});

  @override
  State<AppBarDropdown> createState() => _AppBarDropdownState();
}

class _AppBarDropdownState extends State<AppBarDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  void _showCustomDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy + size.height,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 150,

                  decoration: BoxDecoration(
                    color: AppColors.primaryAppColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 200, // Limit height for scrolling
                  ),
                  child: SingleChildScrollView(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: ['Super User', 'Admin', 'Staff', 'Patient']
                          .map((String item) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue = item;
                              widget.onChange?.call(item);
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                                // border: Border(
                                //   bottom: BorderSide(color: Colors.white54, width: 0.5),
                                // ),
                                ),
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // SingleChildScrollView(
                  //   child: ListView(
                  //     padding: EdgeInsets.zero,
                  //     shrinkWrap: true,
                  //     children: ['Super User','Admin','Staff','Patient'].map((String item) {
                  //       return ListTile(
                  //         title: Text(
                  //           item,
                  //           style: TextStyle(
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         onTap: () {
                  //           setState(() {
                  //             _selectedValue = item;
                  //             widget.onChange?.call(item);
                  //           });
                  //           Navigator.pop(context);
                  //         },
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCustomDropdown,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 160),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  _selectedValue ?? 'Super User',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//                                   flex: 2,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       MouseRegion(
//                                         onEnter: (_) {},
//                                         onExit: (_) {
//                                           // Handle mouse leave
//                                         },
//                                         // child: FutureBuilder<UserAppBar>(
//                                         //   future: getAppBarDetails(context),
//                                         //   builder: (context, snapshot) {
//                                         //     if (snapshot.connectionState == ConnectionState.waiting) {
//                                         //       return SizedBox(
//                                         //         width: 15,
//                                         //         height: 15,
//                                         //         child: CircularProgressIndicator(
//                                         //           strokeWidth: 2,
//                                         //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                                         //         ),
//                                         //       );
//                                         //     }
//                                         //     String imageUrl = snapshot.hasData && snapshot.data?.imgUrl != null && snapshot.data!.imgUrl.isNotEmpty
//                                         //         ? snapshot.data!.imgUrl
//                                         //         : "images/profilepic.png"; // Local asset fallback
//                                         //
//                                         //     return GestureDetector(
//                                         //       child: CircleAvatar(
//                                         //         backgroundColor: Colors.transparent, // Optional: Background color
//                                         //         radius: 13,
//                                         //         backgroundImage: imageUrl.startsWith("http")
//                                         //             ? NetworkImage(imageUrl) as ImageProvider
//                                         //             : AssetImage(imageUrl), // Fallback to asset image
//                                         //       ),
//                                         //       onTap: () {
//                                         //         print("User ID: ${snapshot.data?.userId}");
//                                         //         print("Employee ID: ${snapshot.data?.employeeId}");
//                                         //         print("Image URL: ${snapshot.data?.imgUrl}");
//                                         //         print("Company ID: ${snapshot.data?.companyId}");
//                                         //       },
//                                         //     );
//                                         //   },
//                                         // ),
//                                         child: FutureBuilder<UserAppBar>(
//                                           future: getAppBarDetails(context),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.connectionState == ConnectionState.waiting) {
//                                               return
//                                                 // SizedBox(
//                                                 //     width: 15, // Adjust size according to your requirement
//                                                 //     height: 15,
//                                                 //     child: CircularProgressIndicator(
//                                                 //       strokeWidth: 2,
//                                                 //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Change color if needed
//                                                 //     ),
//                                                 //   );
//                                                   GestureDetector(
//                                                     child: CircleAvatar(
//                                                       backgroundColor: Colors.grey[100],
//                                                       radius: 13,
//                                                       backgroundImage: AssetImage("images/profilepic.png"),
//                                                     ),
//                                                     onTap: () {
//                                                       print("userid appbar : ${snapshot.data?.userId}");
//                                                       print(snapshot.data?.employeeId);
//                                                       print(snapshot.data?.imgUrl);
//                                                       print(snapshot.data?.companyId);
//                                                       print(snapshot.data?.userId);
//                                                       // Optional: Handle tap on the profile image
//                                                     },
//                                                   );
//
//                                             } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.imgUrl.isEmpty || snapshot.data == "") {
//                                               return
//                                               // SizedBox(
//                                               //   width: 15, // Adjust size according to your requirement
//                                               //   height: 15,
//                                               //   child: CircularProgressIndicator(
//                                               //     strokeWidth: 2,
//                                               //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Change color if needed
//                                               //   ),
//                                               // );
//                                                 GestureDetector(
//                                                 child: CircleAvatar(
//                                                   backgroundColor: Colors.grey[100],
//                                                   radius: 12,
//                                                   backgroundImage: AssetImage("images/profilepic.png"),
//                                                 ),
//                                                 onTap: () {
//                                                   print("userid appbar : ${snapshot.data?.userId}");
//                                                   print(snapshot.data?.employeeId);
//                                                   print(snapshot.data?.imgUrl);
//                                                   print(snapshot.data?.companyId);
//                                                   print(snapshot.data?.userId);
//                                                   // Optional: Handle tap on the profile image
//                                                 },
//                                               );
//                                             } else if(snapshot.hasData) {
//                                             return GestureDetector(
//                                             child: CircleAvatar(
//                                               backgroundColor: Colors.transparent,
//                                             backgroundImage: NetworkImage(snapshot.data!.imgUrl),
//                                             radius: 13, // Adjust size as needed
//                                             ),
//                                             onTap: () {
//                                             print("userid appbar : ${snapshot.data?.userId}");
//                                             print(snapshot.data?.employeeId);
//                                             print(snapshot.data?.imgUrl);
//                                             print(snapshot.data?.companyId);
//                                             print(snapshot.data?.userId);
//                                             // Optional: Handle tap on the profile image
//                                             },
//                                             );
//                                             }
//                                             else {
//                                               return
//                                                 GestureDetector(
//                                                 child: CircleAvatar(
//                                                   backgroundColor: Colors.grey[100],
//                                                   radius: 13,
//                                                   backgroundImage: AssetImage("images/profilepic.png"),
//                                                 ),
//                                                 onTap: () {},
//                                               );
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                      const SizedBox(height: AppSize.s5),
//                                       FutureBuilder(
//                                         future: user(),
//                                         builder: (context, snap) {
//                                           if (snap.connectionState == ConnectionState.waiting) {
//                                             return SizedBox();
//                                           }
//
//                                           return MouseRegion(
//                                             onEnter: (_) {
//                                               // Show logout popup when hovering over username
//                                               showMenu(
//                                                 context: context,
//                                                 position: RelativeRect.fromLTRB(
//                                                     70,
//                                                     70,
//                                                     0,
//                                                     0), // Adjust position as needed
//                                                 items: [
//                                                   PopupMenuItem(
//                                                     padding: EdgeInsets.zero,
//                                                     height: 30,
//                                                     child: GestureDetector(
//                                                       onTap: () {
//                                                         if (isLoggedIn) {
//                                                           // Replace 'value' with 'isLoggedIn'
//                                                           print("User logged out");
//                                                           showDialog(
//                                                             context: context,
//                                                             builder: (context) =>
//                                                                     DeletePopup(
//                                                               onCancel: () {
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               onDelete: () {
//                                                                 TokenManager
//                                                                     .removeAccessToken();
//                                                                 Navigator
//                                                                     .pushNamedAndRemoveUntil(
//                                                                   context,
//                                                                   LoginScreen
//                                                                       .routeName,
//                                                                   (route) =>
//                                                                       false,
//                                                                 );
//                                                               },
//                                                               btnText:
//                                                                   "Log Out",
//                                                               title: "Log Out",
//                                                               text:
//                                                                   "Do you really want to logout?",
//                                                             ),
//                                                           );
//                                                         }
//                                                         print('Logging out');
//                                                       },
//                                                       child: Container(
//                                                         height:
//                                                             25, // Reduced height for the logout button
//                                                         width: 90,
//                                                         // margin: EdgeInsets.symmetric(vertical: 10),
//                                                         padding: EdgeInsets
//                                                             .symmetric(
//                                                                 horizontal: 5,
//                                                                 vertical: 5),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceAround,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Icon(
//                                                               Icons.logout,
//                                                               size:
//                                                                   12, // Set icon size
//                                                               color:
//                                                                   Colors.black,
//                                                             ),
//                                                             // SizedBox(width: 8),
//                                                             Text(
//                                                               'Log Out',
//                                                               style: TextStyle(
//                                                                   fontSize:
//                                                                       12, // Set font size
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                             child: Text(
//                                               loginName!,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 8,//FontSize.s10,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),

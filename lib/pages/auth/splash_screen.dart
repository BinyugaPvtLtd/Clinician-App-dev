import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:clinician_app/pages/auth/register_screen.dart';
import 'package:clinician_app/pages/home/home_screen.dart';
import 'package:clinician_app/services/token_manager/token_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../controller/profile_controller.dart';
import '../../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3), () async{
    //   var authToken = await TokenManager.getAccessToken();
    //   print('Auth token ${authToken}');
    //   Get.offAll(() => authToken.isEmpty ? LoginScreen() : HomeScreen());
    // });
  }
  ProfileController profileController = Get.put(ProfileController());
  final SplashController controller = Get.put(SplashController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAsset.splashScreen, height: 160.w),
            customHeight(10.h),
            Text(
              "Symmetry",
              style: AppTextStyle.bold12style.copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff3979B2),
              ),
            ),
            Text(
              "For Clinicians",
              style: AppTextStyle.bold12style.copyWith(
                fontSize: 23.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff3979B2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

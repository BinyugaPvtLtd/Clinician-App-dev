import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const ClinicalApp());
}

class ClinicalApp extends StatelessWidget {
  const ClinicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      enableScaleText: () => true,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Clinician App',
          defaultTransition: Transition.cupertino,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryAppColor,
            ),
            fontFamily: AppTextStyle.fontFamily,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

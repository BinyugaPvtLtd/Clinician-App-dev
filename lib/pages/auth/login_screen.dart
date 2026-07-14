import 'package:clinician_app/controller/profile_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/forgot_pass_screen.dart';
import 'package:clinician_app/pages/auth/password_screen.dart';
import 'package:clinician_app/pages/auth/register_screen.dart';
import 'package:clinician_app/pages/auth/widget/error_dailog.dart';
import 'package:clinician_app/pages/home/home_screen.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../core/constant/api_app_constant.dart';
import 'company_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = Get.put(AuthController());
  final profileController = Get.put(ProfileController());

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 3),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customHeight(10.h),
                  Image.asset(AppAsset.loginBgImg, height: 243.h),
                  customHeight(46.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: AppTextStyle.normal14style.copyWith(
                        color: AppColors.defaultTxtGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  customHeight(3.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Using credentials from Pro Health',
                      style: AppTextStyle.normal12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  customHeight(24.h),
                  PrimaryTextField(
                    controller: emailController,
                    hintText: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.emailSvgIcon,width: 20,      // ← explicit size
                        height: 20,     // ← explicit size
                        fit: BoxFit.scaleDown,),
                    ),
                  ),
                  // customHeight(20.h),
                  // PrimaryTextField(
                  //   controller: passwordController,
                  //   hintText: 'Password',
                  //   textInputAction: TextInputAction.done,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   validator:
                  //       (value) => Validators.validatePassword(value ?? ''),
                  //   prefixIcon: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                  //     child: SvgPicture.asset(AppAsset.passwordSvgIcon),
                  //   ),
                  // ),
                  customHeight(10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ForgotPassScreen());
                      },
                      child: Text(
                        'Forgot password?',
                        style: AppTextStyle.normal10style.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryAppColor,
                        ),
                      ),
                    ),
                  ),
                  customHeight(64.h),
              Obx(() => auth.isLoading.value ? Padding(
                padding:  EdgeInsets.symmetric(vertical:12.h ),
                child: CircularProgressIndicator(
                  color: AppColors.primaryAppColor,
                ),
              ):PrimaryButton(
                    onTap: () async{
                      if (auth.isLoading.value) return;
                      final email = emailController.text.trim();
                      if (email.isEmpty) {
                        _showErrorSnackBar('Email is required');
                        return;
                      }
                      final emailError = Validators.validateEmail(email);
                      if (emailError != null) {
                        _showErrorSnackBar(emailError);
                        return;
                      }
                      final response = await auth.getCompanyList(email);
                      if (response.success) {
                        if (response.companies.length == 1) {
                          String companyAlias = response.companies.first.companyAlias;
                          print("Auto selected company: $companyAlias");
                          String endWith = await ApiAppConstant.endPointByAlias(3, "dev");
                          print("Endpoint set to: ${ApiAppConstant.domain}");
                          await Get.to(
                            () => PasswordScreen(email: email),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 400),
                          );
                        } else {
                          Get.to(() => CompanyListScreen(email: email, companyList: response.companies));
                        }
                      } else {
                        print('Error');
                        showErrorDialog(
                          context: context,
                          title: "Invalid credentials!",
                          subtitle: "Unable to retrieve credentials for authorizing user.",
                        );
                      }
                    },
                    label: 'Login',
                  )),
                  // customHeight(20.h),
                  // PrimaryOutlinedButton(
                  //   text: 'Login with Face ID',
                  //   icon: SvgPicture.asset(AppAsset.faceRecognitionSvgIcon),
                  //   textStyle: AppTextStyle.normal16style.copyWith(
                  //     color: AppColors.primaryAppColor,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  //   onPressed: () {},
                  // ),
                  // customHeight(20.h),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Don\'t have a Account? ',
                  //     style: AppTextStyle.normal14style.copyWith(
                  //       color: AppColors.textGreyColor,
                  //     ),
                  //     children: [
                  //       WidgetSpan(
                  //         child: InkWell(
                  //           onTap: () {
                  //             Get.off(() => RegisterScreen());
                  //           },
                  //           child: Text(
                  //             'Register',
                  //             style: AppTextStyle.normal14style.copyWith(
                  //               color: AppColors.primaryAppColor,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  customHeight(20.h),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

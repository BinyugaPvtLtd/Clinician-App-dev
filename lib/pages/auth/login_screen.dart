import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/forgot_pass_screen.dart';
import 'package:clinician_app/pages/auth/register_screen.dart';
import 'package:clinician_app/pages/auth/widget/error_dailog.dart';
import 'package:clinician_app/pages/home/home_screen.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            physics: BouncingScrollPhysics(),
            child: Form(
              key:_formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customHeight(10.h),
                  Image.asset(AppAsset.loginPageImg, height: 243.h),
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
                    validator: (value) => Validators.validateEmail(value),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.emailSvgIcon),
                    ),
                  ),
                  customHeight(20.h),
                  PrimaryTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator:
                        (value) => Validators.validatePassword(value ?? ''),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.passwordSvgIcon),
                    ),
                  ),
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
                      if (_formKey.currentState!.validate()) {
                        // Form is valid
                        final response = await auth.signInAuth(
                            email: emailController.text,
                            password: passwordController.text);
                        if (response.success) {
                          print('Form validated successfully');
                          Get.offAll(() => HomeScreen());
                        }else{
                          print('Error');
                          showErrorDialog(context);
                        }
                        //Get.to(() => HomeScreen());

                      } else {
                        // Form is invalid
                        print('Validation failed');
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
      ),
    );
  }
}

import 'package:clinician_app/controller/profile_controller.dart';
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

class PasswordScreen extends StatefulWidget {
  final String email;
  const PasswordScreen({super.key, required this.email});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = Get.put(AuthController());
  final profileController = Get.put(ProfileController());
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
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
                  Image.asset(AppAsset.passwordImg, height: 243.h),
                  customHeight(46.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
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
                      'Enter your password to login',
                      style: AppTextStyle.normal12style.copyWith(
                        color: AppColors.defaultTxtGrey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  // customHeight(24.h),
                  // PrimaryTextField(
                  //   controller: emailController,
                  //   hintText: 'Your Email',
                  //   keyboardType: TextInputType.emailAddress,
                  //   validator: (value) => Validators.validateEmail(value),
                  //   prefixIcon: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                  //     child: SvgPicture.asset(AppAsset.emailSvgIcon),
                  //   ),
                  // ),
                  customHeight(20.h),
                  PrimaryTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscurePassword,
                    validator:
                        (value) => Validators.validatePassword(value ?? ''),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.passwordSvgIcon,width: 20,      // ← explicit size
                        height: 20,     // ← explicit size
                        fit: BoxFit.scaleDown,),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  // customHeight(10.h),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Get.to(() => ForgotPassScreen());
                  //     },
                  //     child: Text(
                  //       'Forgot password?',
                  //       style: AppTextStyle.normal10style.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: AppColors.primaryAppColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                            email: widget.email,
                            password: passwordController.text);
                        if (response.success) {
                          if (response.roleName == "Clinical") {
                            await profileController.fetchRecordType();
                            await profileController.fetchClinitionLoginDetails();
                            print('Form validated successfully');
                            await Get.offAll(
                                  () => HomeScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOutCubic,
                            );
                          } else {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Row(
                                    children: [
                                      Icon(Icons.error_outline, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text("Only Clinical users are allowed to log in."),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(12),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          }
                        } else {
                          print('Error');
                          showErrorDialog(
                              context: context,
                              title: "Invalid credentials!",
                              subtitle: "Unable to retrieve credentials for authorizing user.");
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

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/widget/pass_reset_email_sent_bottomsheet.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../home/home_screen.dart';
import '../login_screen.dart';
import 'error_dailog.dart';


class ChangePasswordScreen extends StatefulWidget {
  final String email;
  final String validOtp;
  const ChangePasswordScreen({super.key, required this.email, required this.validOtp});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confiemPasswordController = TextEditingController();
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
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customHeight(10.h),
                  Image.asset(AppAsset.forgotPassImg, height: 243.h),
                  customHeight(40.h),
                  Text(
                    'Reset Your Password?',
                    style: AppTextStyle.normal14style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  customHeight(3.h),
                  Text(
                    AppString.resetPassPageTxt,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal12style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  customHeight(50.h),
                  PrimaryTextField(
                    controller: newPasswordController,
                    hintText: 'New Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator:
                        (value) => Validators.validatePassword(value ?? 'New'),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.passwordSvgIcon),
                    ),
                  ),
                  customHeight(20.h),
                  PrimaryTextField(
                    controller: confiemPasswordController,
                    hintText: 'Confirm new Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator:
                        (value) => Validators.validateConfirmPassword(value ?? '',newPasswordController.text),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.passwordSvgIcon),
                    ),
                  ),
                  customHeight(34.h),
                  Obx(() => auth.isLoading.value ? CircularProgressIndicator(
                    color: AppColors.primaryAppColor,
                  ):PrimaryButton(
                    label: 'Save',
                    onTap: () async{
                      if (_formKey.currentState!.validate()) {
                        // Form is valid
                        final response = await auth.changePasswordAuth(
                            email: widget.email,
                            otp: widget.validOtp,
                            newPassword: confiemPasswordController.text);
                        if (response.success) {
                          Get.offAll(() => LoginScreen());
                        }else{
                          showErrorDialog(
                              context:context,
                              title: "Something went wrong!",
                              subtitle:"Unable to retrieve credentials for authorizing user.");
                        }
                      } else {
                        // Form is invalid
                      }
                    },
                  )),
                  customHeight(5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

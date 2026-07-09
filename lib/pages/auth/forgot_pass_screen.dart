import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/widget/pass_reset_email_sent_bottomsheet.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final auth = Get.put(AuthController());
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
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customHeight(10.h),
                  Image.asset(AppAsset.forgotPassImg, height: 243.h),
                  customHeight(40.h),
                  Text(
                    'Forgot Your Password?',
                    style: AppTextStyle.normal14style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  customHeight(3.h),
                  Text(
                    AppString.forgotPassPageTxt,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal12style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  customHeight(70.h),
                  PrimaryTextField(
                    controller: emailController,
                    hintText: 'Email ID',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validators.validateEmail(value),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SvgPicture.asset(AppAsset.emailSvgIcon,width: 20,      // ← explicit size
                        height: 20,     // ← explicit size
                        fit: BoxFit.scaleDown,),
                    ),
                  ),
                  customHeight(34.h),
              Obx(() => auth.isLoading.value ? CircularProgressIndicator(
                color: AppColors.primaryAppColor,
              ):PrimaryButton(
                    label: 'Send Email',
                    onTap: () async{
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        // Form is valid
                        final response = await auth.forgetPasswordAuth(
                            email: emailController.text);
                        print('Response: ${response.data}');
                        if (response.success) {
                          Get.bottomSheet(
                          PassResetEmailSentBottomsheet(email:emailController.text,),
                          barrierColor: Colors.white.withValues(alpha: 0.3),
                        );
                        }
                      } else {
                        // Form is invalid
                      }
                    },
                  )),
                  customHeight(5.h),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t receive? ',
                      style: AppTextStyle.normal14style.copyWith(
                        color: AppColors.textGreyColor,
                      ),
                      children: [
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              // Get.off(() => RegisterScreen());
                            },
                            child: Text(
                              'Resend',
                              style: AppTextStyle.normal14style.copyWith(
                                color: AppColors.primaryAppColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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

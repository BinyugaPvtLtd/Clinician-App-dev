import 'package:clinician_app/core/constant/api_app_constant.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/widget/error_dailog.dart';
import 'package:clinician_app/pages/auth/widget/pass_reset_email_sent_bottomsheet.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../services/token_manager/token_manager_service.dart';
import 'company_list_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController emailController = TextEditingController();
  final auth = Get.put(AuthController());

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
                onTap: () async {
                  if (auth.isLoading.value) return;
                  FocusScope.of(context).unfocus();

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

                  // Step 1: resolve which company/alias this email belongs to
                  final companyResponse = await auth.getCompanyList(email);

                  if (!companyResponse.success) {
                    showErrorDialog(
                      context: context,
                      title: "Invalid credentials!",
                      subtitle: "Unable to retrieve credentials for authorizing user.",
                    );
                    return;
                  }

                  if (companyResponse.companies.length == 1) {
                    // Single company -> auto-select alias and set domain
                    final companyAlias = companyResponse.companies.first.companyAlias;
                    await TokenManager.setCompanyAlias(companyAlias: companyResponse.companies.first.companyAlias);
                    ApiAppConstant.endPointByAlias(3, companyAlias);
                    print("Endpoint set to: ${ApiAppConstant.domain}");

                    // Step 2: now call forget password against the correct domain
                    final response = await auth.forgetPasswordAuth(email: email);
                    if (response.success) {
                      Get.bottomSheet(
                        PassResetEmailSentBottomsheet(email: email),
                        barrierColor: Colors.white.withValues(alpha: 0.3),
                      );
                    } else {
                      _showErrorSnackBar('Unable to send reset email');
                    }
                  } else {
                    // Multiple companies -> let user pick one first
                    Get.to(() => CompanyListScreen(
                      isForgotPasswordScreen: true,
                      email: email,
                      companyList: companyResponse.companies,
                      // pass a callback or route so that after selection,
                      // it sets the alias and then triggers forgetPasswordAuth
                    ));
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
    );
  }
}

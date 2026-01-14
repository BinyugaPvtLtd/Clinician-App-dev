import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../core/ui/primary_textfield.dart';
import '../../../utils/validator.dart';
import 'change_password_screen.dart';
import 'error_dailog.dart';

class PassResetEmailSentBottomsheet extends StatefulWidget {
  final String email;
  const PassResetEmailSentBottomsheet({super.key, required this.email});

  @override
  State<PassResetEmailSentBottomsheet> createState() =>
      _PassResetEmailSentBottomsheetState();
}

class _PassResetEmailSentBottomsheetState
    extends State<PassResetEmailSentBottomsheet> {

  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes =
  List.generate(6, (_) => FocusNode());
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAsset.emailSentImg, width: 85.w),
                customHeight(24.h),

                Text(
                  'Please Check Your Mailbox!',
                  style: AppTextStyle.normal14style.copyWith(
                    color: AppColors.defaultTxtGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                customHeight(3.h),

                Text(
                  AppString.emailSentTxt,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.normal12style.copyWith(
                    color: AppColors.defaultTxtGrey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                customHeight(12.h),
                /// OTP BOXES (6 DIGITS)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                        (index) => SizedBox(
                      width: 50.w,
                      child: RawKeyboardListener(
                        focusNode: FocusNode(), // required for keyboard events
                        onKey: (event) {
                          if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                            if (otpControllers[index].text.isEmpty && index > 0) {
                              otpControllers[index - 1].clear();
                              FocusScope.of(context)
                                  .requestFocus(otpFocusNodes[index - 1]);
                            }
                          }
                        },
                        child: PrimaryTextField(
                          controller: otpControllers[index],
                          focusNode: otpFocusNodes[index],
                          //validator: (value) => Validators.validateOtp(value!),
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.normal14style,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                          onChanged: (value) async{
                            if (value.isNotEmpty && index < 5) {
                              // Move focus to the next field
                              FocusScope.of(context)
                                  .requestFocus(otpFocusNodes[index + 1]);
                            } else if (value.isNotEmpty && index == 5) {
                              FocusScope.of(context).unfocus();
                              // Last field, perform action (e.g., verify OTP)
                              // final otp = otpControllers.map((e) => e.text).join();
                              // var responseOtp = await auth.verifyOTPAuth(email: widget.email, otp: otp);
                              // if(responseOtp.statusCode == 200 || responseOtp.statusCode == 201) {
                              //   print('OTP Verified Successfully ${otp}');
                              //   Get.to(ChangePasswordScreen(email: widget.email, validOtp: otp,));
                              // }else{
                              //   showErrorDialog(
                              //       context:context,
                              //       title: "Invalid otp!",
                              //       subtitle:"The OTP you entered is incorrect. Please try again.");
                              // }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                customHeight(10.h),
                Obx(()=> auth.otpError.isEmpty ? SizedBox.shrink() :Text(auth.otpError,
                style: TextStyle(color: AppColors.redColor),),),
                customHeight(10.h),

                /// OKAY BUTTON
              Obx(()=> auth.isLoading.value ? CircularProgressIndicator(
                color: AppColors.primaryAppColor,
              ):  PrimaryButton(
                  onTap: () async{
                    FocusScope.of(context).unfocus();
                    if(otpControllers.length == 6){
                      final otp = otpControllers.map((e) => e.text).join();
                      var responseOtp = await auth.verifyOTPAuth(email: widget.email, otp: otp);
                      if(responseOtp.statusCode == 200 || responseOtp.statusCode == 201) {
                        print('OTP Verified Successfully ${otp}');
                        Get.to(ChangePasswordScreen(email: widget.email, validOtp: otp,));
                      }else{
                        // showErrorDialog(
                        //     context:context,
                        //     title: "Invalid otp!",
                        //     subtitle:"The OTP you entered is incorrect. Please try again.");
                      }
                    }else{
                      auth.otpError = "Please enter valid otp";
                    }

                    // Get.back();
                  },
                  label: 'Okay',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

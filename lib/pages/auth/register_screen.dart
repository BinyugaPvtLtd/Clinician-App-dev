import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:clinician_app/pages/home/home_screen.dart';
import 'package:clinician_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.registerPageImg, height: 243.h),
                customHeight(46.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Register',
                    style: AppTextStyle.normal14style.copyWith(
                      color: AppColors.defaultTxtGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                customHeight(45.h),
                PrimaryTextField(
                  hintText: 'Your Email',

                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validators.validateEmail(value),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: SvgPicture.asset(AppAsset.emailSvgIcon),
                  ),
                ),
                customHeight(15.h),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        hintText: 'First Name',
                        keyboardType: TextInputType.name,
                        validator:
                            (value) => Validators.validateRequired(
                              value ?? "",
                              'First Name',
                            ),
                      ),
                    ),
                    customWidth(17.w),
                    Expanded(
                      child: PrimaryTextField(
                        hintText: 'Last Name',
                        keyboardType: TextInputType.name,
                        validator:
                            (value) => Validators.validateRequired(
                              value ?? "",
                              'Last Name',
                            ),
                      ),
                    ),
                  ],
                ),
                customHeight(15.h),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        hintText: 'Birth Date',
                        controller: birthDateController,
                        keyboardType: TextInputType.none,
                        textInputAction: TextInputAction.done,
                        validator:
                            (value) => Validators.validateRequired(
                              value ?? '',
                              'Birth Date',
                            ),
                        onTap: () async {
                          primaryFocus?.unfocus();
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            birthDateController.text = DateFormat(
                              'dd/MM/yyyy',
                            ).format(date);
                          }
                          primaryFocus?.unfocus();
                        },
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: SvgPicture.asset(
                            AppAsset.calenderSvgIcon,
                            colorFilter: ColorFilter.mode(
                              AppColors.defaultTxtGrey.withValues(alpha: 0.56),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                    customWidth(17.w),
                    Expanded(child: SizedBox.shrink()),
                  ],
                ),
                customHeight(34.h),
                PrimaryButton(
                  label: 'Register',
                  onTap: () {
                    Get.to(() => HomeScreen());
                  },
                ),
                customHeight(20.h),
                RichText(
                  text: TextSpan(
                    text: 'Already have a Account? ',
                    style: AppTextStyle.normal14style.copyWith(
                      color: AppColors.textGreyColor,
                    ),
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Get.off(() => LoginScreen());
                          },
                          child: Text(
                            'Login',
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

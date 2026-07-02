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
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../core/constant/api_app_constant.dart';
import '../../core/ui/primary_dropdown.dart';
import '../../model/request/request_data_model.dart';

class CompanyListScreen extends StatefulWidget {
  final String email;
  final List<Company> companyList;
  const CompanyListScreen({super.key, required this.email, required this.companyList});

  @override
  State<CompanyListScreen> createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedCompanyAlias = '';
  final auth = Get.put(AuthController());
  final profileController = Get.put(ProfileController());
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
                  PrimaryDropDown(
                    validator: (value) => Validators.validateRequired(selectedCompanyAlias,'Document'),
                    contentPadding: EdgeInsets.zero,
                    filled: false,
                    value: selectedCompanyAlias,
                    buttonStyleData: ButtonStyleData(
                      width: 120.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderGrey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    hintText:  "Select company",
                    // value: addVisitController.selectedRecordName.value == ''
                    //     ? 'Select type'
                    //     : addVisitController.selectedRecordName.value,
                    items: widget.companyList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.companyAlias ?? '',
                        child: Padding(
                          padding:  EdgeInsets.all(8.h),
                          child: Text(
                            item.companyAlias,
                            style: AppTextStyle.normal12style
                                .copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.defaultTxtGrey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // for (var a in docCtrl.docMetaList) {
                      //   if (a.documentName == value) {
                      //     docCtrl.selectedSubDocId.value = 0;
                      //     docCtrl.selectedSubDocName.value = '';
                      //     docCtrl.docSubList.clear();
                      //     docCtrl.selectedMasterMetaDocName.value = value ?? '';
                      //     docCtrl.selectedMasterMetaDocId.value = a.employeeDocumentTypeMetaDataId ?? 0;
                      //     docCtrl.fetchSubDocList(docMetaId:  a.employeeDocumentTypeMetaDataId );
                      //   }
                      // }
                      //

                    },
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
                        print("Auto selected company: $selectedCompanyAlias");
                        String endWith = await ApiAppConstant.endPointByAlias(3, selectedCompanyAlias);
                        print("Endpoint set to: ${ApiAppConstant.domain}");
                        await Get.offAll(() => PasswordScreen(email: widget.email));
                        //Get.to(() => HomeScreen());

                      } else {
                        // Form is invalid
                        print('Validation failed');
                      }
                    },
                    label: 'Continue',
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

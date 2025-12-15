import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppbar(
              label: "Edit Profile",
              trailing: PrimaryButton(
                label: "Save",
                padding: EdgeInsets.zero,
                labelStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
                height: 20.h,
                width: 60.w,
                borderRadius: 6,
              ),
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 15.h,
                bottom: 8.h,
              ),
            ),
            Divider(),
            customHeight(30.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAsset.avatarImg),
                              radius: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 70.h, left: 60.w),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12,
                                child: Center(
                                  child: Icon(
                                    Icons.mode_edit_outlined,
                                    size: 15,
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      customHeight(20.h),
                      Text("Your Information", style: AppTextStyle.bold14style),
                      customHeight(17.h),
                      PrimaryTextField(
                        filledColor: Colors.white,
                        hintText: "First Name",
                      ),
                      customHeight(23.h),
                      PrimaryTextField(
                        filledColor: Colors.white,
                        hintText: "Last Name",
                      ),
                      customHeight(23.h),
                      PrimaryTextField(
                        filledColor: Colors.white,
                        hintText: "Phone Number",
                      ),
                      customHeight(23.h),
                      PrimaryTextField(
                        filledColor: Colors.white,
                        hintText: "Email Address",
                      ),
                      customHeight(23.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

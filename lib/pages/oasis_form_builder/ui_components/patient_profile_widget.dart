import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';


class PatientProfileWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final DateTime dob;
  String? chartNumber;

  PatientProfileWidget(this.name,this.imageUrl, this.dob, {super.key,this.chartNumber});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        tablet: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryAppColor,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h, right: 10.w),
          child: Row(
            spacing: 10.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return Image.asset(
                        'assets/png/symmetry_logo.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    Text(
                      name,
                      style: FormBuilderTextStyle.bold10Style
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        desktop: Container(
          decoration: BoxDecoration(
            color: AppColors.patientProfileBColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withAlpha(64),
              ),
            ],
          ),
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              EdgeInsets.only(left: 3.w, top: 10.h, bottom: 10.h, right: 3.w),
          child: Row(
            spacing: 5.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 15.w,
                    height: 15.w,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return Image.asset(
                        'assets/png/profilepic.png',
                        width: 15.w,
                        height: 15.w,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    Text(
                      name,
                      style: FormBuilderTextStyle.bold10Style
                          .copyWith(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DOB',
                          style: FormBuilderTextStyle.normal10style,
                        ),
                        Text(
                          "${DateFormat('MM-dd-yyyy').format(dob)} (${calculateAge(dob)})",
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chart Number',
                          style: FormBuilderTextStyle.normal10style.copyWith(
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        Text(
                          chartNumber == null ? "1234": chartNumber!,
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  int calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;

    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age;
  }
}

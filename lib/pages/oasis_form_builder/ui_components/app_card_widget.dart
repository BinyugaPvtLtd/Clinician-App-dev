import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget(
      {super.key,
      this.title = '',
      this.children = const <Widget>[],
      this.backgroundColor,
      this.childrenSpacing = 0,
      this.margin});

  final String title;
  final List<Widget> children;
  final Color? backgroundColor;
  final double childrenSpacing;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 18.w : 20.w,
          vertical: 20.h),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.cardBackGColor,
          boxShadow: Responsive.isDesktop(context) ? [commonShadow] : null,
          borderRadius: !Responsive.isMobile(context)
              ? BorderRadius.circular(12.r)
              : null),
      clipBehavior: Clip.hardEdge,
      child: Column(
        spacing: childrenSpacing.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: FormBuilderTextStyle.normal10style.copyWith(
                  color: AppColors.textGreyColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600),
            ),
            customHeight(14.h)
          ],
          ...children
        ],
      ),
    );
  }
}

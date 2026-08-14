import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';

class StaticActionButton extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final VoidCallback? onTap;

  const StaticActionButton({super.key, required this.subQuestionWrapper,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null)
          {
            onTap!();
          }
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 150),
        decoration: BoxDecoration(
            color: AppColors.primaryAppLightColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(25))
            ]),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subQuestionWrapper.subQuestion.options.first.label,
              style: FormBuilderTextStyle.bold14style
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color buttonColor;
  final Color textColor;

  const CommonButton(
      {super.key,
      required this.onTap,
      required this.label,
       this.buttonColor=AppColors.primaryAppLightColor,
       this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        constraints: BoxConstraints(minWidth: 150.w),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(25))
            ]),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: FormBuilderTextStyle.bold14style
                  .copyWith(color: textColor, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

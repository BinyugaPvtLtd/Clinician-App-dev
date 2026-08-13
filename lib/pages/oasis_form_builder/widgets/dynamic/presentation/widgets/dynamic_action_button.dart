import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';

class DynamicActionButton extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const DynamicActionButton({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 150),
      decoration: BoxDecoration(
          color: AppColors.primaryAppLightColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withAlpha(25)
            )
          ]
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionWrapper.question.options!.first.label,
            style: FormBuilderTextStyle.bold14style
                .copyWith(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

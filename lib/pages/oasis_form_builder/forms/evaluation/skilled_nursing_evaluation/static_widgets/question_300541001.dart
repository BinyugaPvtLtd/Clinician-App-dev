import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';

import '../../../../provider/question_wapper_provider.dart';

class Question300541001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question300541001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: Center(
              child: Text(
            "Activities of Daily Living",
            style: FormBuilderTextStyle.bold10Style,
          )),
        ),
        ...questionWrapper.subQuestionWrappers.map((subQuestionWrapper) =>
            Column(
              children: [
                Divider(),
                StaticDropdownWidget(subQuestionWrapper: subQuestionWrapper),
              ],
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_action_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question440720005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question440720005({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaticInfoWidget(
          subQuestion: questionWrapper.subQuestionWrappers[0].subQuestion,
        ),
        Row(
          spacing: 20.w,
          children: [
            StaticActionButton(
              subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
            ),
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[2],
              ),
            ),
          ],
        )
      ],
    );
  }
}

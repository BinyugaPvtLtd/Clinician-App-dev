import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question661110005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  const Question661110005({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints:BoxConstraints(maxWidth: 400.w),
          child: StaticCheckBoxWidget(
            subQuestionWrapper: subQuestionWrappers[0],
          ),
        ),
        StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[1])
      ],
    );
  }
}

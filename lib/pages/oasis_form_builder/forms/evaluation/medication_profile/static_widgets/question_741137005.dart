import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';

class Question741137005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question741137005({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30.w,
      children: [
        Expanded(
          child: TitleDescription(
            title: questionWrapper.question.notice,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              StaticCheckBoxWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers.first),
            StaticCheckBoxWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers.last)
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question601096004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question601096004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
      spacing: 10.h,
            children: [
              StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers.first,
              ),
              StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers.last,
              ),
            ],
          )
        : Row(
            spacing: 30.w,
            children: [
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers.first,
                ),
              ),
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers.last,
                ),
              ),
            ],
          );
  }
}

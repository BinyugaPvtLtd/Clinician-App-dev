import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../../constants/responsive.dart';

class Question641104002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question641104002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile  =Responsive.isMobile(context);
    return isMobile?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        StaticRadioWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
        ),
        ...questionWrapper.subQuestionWrappers.sublist(1).map(
              (subQuestionWrapper) => StaticTextFieldWidget(
              subQuestionWrapper: subQuestionWrapper),
        ),
      ],
    ):Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        spacing: 20.w,
        children: [
          Expanded(
            child: StaticRadioWidget(
              subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ...questionWrapper.subQuestionWrappers.sublist(1).map(
                      (subQuestionWrapper) => StaticTextFieldWidget(
                          subQuestionWrapper: subQuestionWrapper),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

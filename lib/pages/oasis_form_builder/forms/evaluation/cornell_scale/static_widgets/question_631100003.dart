import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';

import '../../../../constants/responsive.dart';

class Question631100003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question631100003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
      spacing: 10.h,
            children: [
              ...questionWrapper.subQuestionWrappers.map((subquestionWrapper) {
                return StaticRadioWidget(
                    subQuestionWrapper: subquestionWrapper);
              }),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30.w,
            children: [
              ...questionWrapper.subQuestionWrappers.map((subquestionWrapper) {
                return Expanded(
                    child: StaticRadioWidget(
                        subQuestionWrapper: subquestionWrapper));
              })
            ],
          );
  }
}

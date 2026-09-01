

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:provider/provider.dart';

class Question140430002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140430002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers[0];
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        Expanded(
          child: ChangeNotifierProvider<SubQuestionWrapper>.value(
            value: subQuestionWrapper1,
            child: Consumer<SubQuestionWrapper>(
              builder:
                  (BuildContext context, subQuestionWrapper, Widget? child) {
                return StaticOptionWidget(
                    subQuestionWrapper: subQuestionWrapper);
              },
            ),
          ),
        ),
        if (!isMobile)
          SizedBox(
            width: 20.w,
          ),
        if (!isMobile)
          const Expanded(
            child: SizedBox(),
          ),
      ],
    );
  }
}

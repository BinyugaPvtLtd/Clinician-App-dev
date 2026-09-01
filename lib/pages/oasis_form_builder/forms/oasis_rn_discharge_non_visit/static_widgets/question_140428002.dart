import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';

class Question140428002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140428002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 7,
              child: StaticOptionWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
              ),
            ),
            if(!isMobile)Expanded(
              flex: 3,
              child: StaticDateFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
              ),
            ),
          ],
        ),
        if(isMobile)StaticDateFieldWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
        ),
      ],
    );
  }
}

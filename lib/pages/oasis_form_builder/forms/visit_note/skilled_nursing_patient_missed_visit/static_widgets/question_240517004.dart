import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../../constants/responsive.dart';

class Question240517004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question240517004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      spacing: 10,
      children: [
        if (!isMobile)
          Row(
            children: [
              Expanded(
                child: StaticDateFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
                ),
              ),
              Expanded(
                child: StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
                ),
              ),
            ],
          ),
        if (isMobile)
          Column(
            spacing: 10,
            children: [
              StaticDateFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
              ),
              StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
              ),
            ],
          ),
        StaticCheckBoxWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[2],
        ),
        StaticCheckBoxWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[3],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';

import '../../../../constants/responsive.dart';

class Question601096009 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question601096009({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        isMobile?Column(
          spacing: 10.h,
          children: [
            StaticTextFieldWidget(
              subQuestionWrapper: questionWrapper.subQuestionWrappers.first,
            ),StaticDateFieldWidget(
              subQuestionWrapper: questionWrapper.subQuestionWrappers.last,
            ),
          ],
        ):Row(
          spacing: 30.w,
          children: [
            Expanded(
              child: StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers.first,
              ),
            ),Expanded(
              child: StaticDateFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers.last,
              ),
            ),
          ],
        ),
        TitleDescription(title: questionWrapper.question.notice ,)
      ],
    );
  }
}

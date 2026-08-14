import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10004002 extends StatelessWidget {
  const Question10004002({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      runSpacing: 10.h,
      children: [
        SizedBox(
          width: 250.w,
          child: StaticDateFieldWidget(
              subQuestionWrapper: queWrapper.subQuestionWrappers[0]),
        ),
        customWidth(20.w),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: queWrapper.subQuestionWrappers[1],
          child: Consumer<SubQuestionWrapper>(builder: (context, subq, ch) {
            final subquestion = subq.subQuestion;
            return SubQuestionCheckbox(
              subQuestionWrapper: subq,
              optionIndex: 0,
              isEnabled: true,
            );
          }),
        )
      ],
    );
  }
}

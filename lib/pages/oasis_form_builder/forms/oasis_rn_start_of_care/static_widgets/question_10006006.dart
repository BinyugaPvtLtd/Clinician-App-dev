import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question10006006 extends StatelessWidget {
  const Question10006006({super.key, required this.questionWrapper});
  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[0]),
            customHeight(28.h),
            StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[1]),
            StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[2]),
          ],
        );
      }),
    );
  }
}

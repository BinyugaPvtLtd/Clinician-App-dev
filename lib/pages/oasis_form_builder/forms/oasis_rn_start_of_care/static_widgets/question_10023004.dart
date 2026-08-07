

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:provider/provider.dart';

class Question10023004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10023004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers[0];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[1];
    // log('id:->${questionWrapper.question.id}');
    // if (questionWrapper.question.id == 1023027) {
    //   log('-=-=-=-=>${questionWrapper.subQuestionWrappers.map((e) => e.subQuestion.options.map((e) => '${e.index}-${e.hint.toString()}'))}');
    // }
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
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: ChangeNotifierProvider<SubQuestionWrapper>.value(
            value: subQuestionWrapper2,
            child: Consumer<SubQuestionWrapper>(
              builder:
                  (BuildContext context, subQuestionWrapper, Widget? child) {
                return StaticOptionWidget(
                    subQuestionWrapper: subQuestionWrapper);
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:provider/provider.dart';

class Question510895002 extends StatelessWidget {
  const Question510895002({super.key, required this.questionWrapper});
  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers[0];
    // final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[1];
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
        // SizedBox(
        //   width: 20.w,
        // ),
        const Spacer()
      ],
    );
  }
}

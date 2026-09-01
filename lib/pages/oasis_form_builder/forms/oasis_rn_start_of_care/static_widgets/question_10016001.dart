import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

class Question10016001 extends StatelessWidget {
  const Question10016001({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          children: [
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[0]),
            Row(
              children: [
                Expanded(
                  child: StaticCheckBoxWidget(
                      subQuestionWrapper: que.subQuestionWrappers[1]),
                ),
                Expanded(
                  child: StaticCheckBoxWidget(
                      subQuestionWrapper: que.subQuestionWrappers[2]),
                ),
                const Expanded(child: const SizedBox.shrink()),
              ],
            ),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[3]),
          ],
        );
      }),
    );
  }
}

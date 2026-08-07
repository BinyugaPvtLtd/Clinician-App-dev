import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart' show Responsive;

class Question510891006 extends StatelessWidget {
  const Question510891006({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          children: [
           if(!isMobile) Row(
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                    subQuestionWrapper: que.subQuestionWrappers[0],
                  ),
                ),
                Expanded(
                  child: StaticCheckBoxWidget(
                    subQuestionWrapper: que.subQuestionWrappers[1],
                  ),
                )
              ],
           ),
            if(isMobile)Column(
              children: [
                StaticTextFieldWidget(
                  subQuestionWrapper: que.subQuestionWrappers[0],
                ),
                StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[1],
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}

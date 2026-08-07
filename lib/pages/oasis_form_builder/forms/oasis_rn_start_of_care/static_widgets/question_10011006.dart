import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question10011006 extends StatelessWidget {
  const Question10011006({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Responsive.isMobile(context)
            ? Column(
                children: [
                  StaticTextFieldWidget(
                      subQuestionWrapper: que.subQuestionWrappers[0]),
                  StaticInfoWidget(
                      subQuestion: que.subQuestionWrappers[1].subQuestion),
                  StaticInfoWidget(
                      subQuestion: que.subQuestionWrappers[2].subQuestion)
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[0]),
                      ),
                      Expanded(
                        child: StaticInfoWidget(
                            subQuestion:
                                que.subQuestionWrappers[1].subQuestion),
                      )
                    ],
                  ),
                  StaticInfoWidget(
                      subQuestion: que.subQuestionWrappers[2].subQuestion)
                ],
              );
      }),
    );
  }
}

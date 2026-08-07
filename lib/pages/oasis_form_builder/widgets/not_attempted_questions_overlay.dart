import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:provider/provider.dart';

import '../provider/form_builder_provider.dart';
import '../provider/question_wapper_provider.dart';

class NonAttemptedQuestions extends StatelessWidget {
  const NonAttemptedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [commonShadow],
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 66),
      constraints: const BoxConstraints(maxWidth: 350),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Not Attempted Questions',
              style:
                  FormBuilderTextStyle.bold14style.copyWith(color: Colors.red),
            ),
            customHeight(20),
            Expanded(
              child: Selector<FormBuilderProvider, List<QuestionWrapper>>(
                selector: (_, form) => form.wrapperQuestions
                    .where((q) =>
                        !q.isAnswered &&
                        q.question.answerType != AnswerType.info)
                    .toList(),
                builder: (_, unansweredQuestions, __) {
                  bool showQuestionCodeBubble = unansweredQuestions
                      .where((unansweredQuestion) =>
                          unansweredQuestion.question.code != null &&
                          unansweredQuestion.question.code!.isNotEmpty)
                      .toList()
                      .isNotEmpty;
                  return ListView(
                    children: unansweredQuestions.map((unansweredQuestion) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            if (showQuestionCodeBubble)
                              (unansweredQuestion.question.code != null &&
                                      unansweredQuestion
                                          .question.code!.isNotEmpty)
                                  ? Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color:
                                            AppColors.questionCodeBubbleColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          unansweredQuestion.question.code ??
                                              "",
                                          style: FormBuilderTextStyle
                                              .bold10Style
                                              .copyWith(
                                            color: AppColors
                                                .questionCodeBubbleTextColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      width: 70,
                                    ),
                            Expanded(
                              child: Html(
                                data: unansweredQuestion.resolvedTitle,
                                style:
                                    FormBuilderTextStyle.htmlTextStyle(false),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

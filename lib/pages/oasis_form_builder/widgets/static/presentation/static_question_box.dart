import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/full_static_question_repo.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/static_question_renderer.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';


import '../../../constants/responsive.dart';


class StaticQuestionBox extends StatelessWidget {
  final String templetName;
  final QuestionWrapper questionWrapper;
  final Color? highlightColor;

  const StaticQuestionBox({
    super.key,
    required this.questionWrapper,
    required this.templetName,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final question = questionWrapper.question;
    final isDesktop = Responsive.isDesktop(context);
    final type = question.answerType;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w, vertical: isDesktop ? 10.h : 0),
      child: Column(
        children: [
          Material(
            borderRadius:
                isDesktop ? BorderRadius.all(Radius.circular(12.r)) : null,
            elevation: !question.drawBox! ||
                    type == AnswerType.info ||
                    type == AnswerType.actionButton ||
                    !isDesktop
                ? 0
                : 4,
            child: ChangeNotifierProvider.value(
              value: questionWrapper,
              child: Selector<QuestionWrapper, bool>(
                builder:
                    (BuildContext context, bool isAnswered, Widget? child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: highlightColor ??
                          (isAnswered ? AppColors.cardBackGColor : Colors.white),
                      borderRadius: isDesktop
                          ? BorderRadius.all(Radius.circular(12.r))
                          : null,
                    ),
                    padding: question.drawBox!
                        ? EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: isDesktop ? 10.h : 20.h)
                        : EdgeInsets.zero,
                    child: child,
                  );
                },
                selector:
                    (BuildContext context, QuestionWrapper questionWrapper) =>
                        questionWrapper.isAnswered,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(question.code != null && question.code!.isNotEmpty)
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      PopupHandler.showQuestionCodePopup(
                                          context, question.code!);
                                    },
                                    child: StyledText(
                                      text: "(${question.code})",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: const Color(0xffFF0000),
                                              fontWeight: FontWeight.bold),
                                      tags: {
                                        'u': StyledTextTag(
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color:
                                                        const Color(0xffFF0000),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      },
                                    )),
                              ),
                        Expanded(
                          child: Row(
                            children: [
                              if (question.title != null &&
                                  question.title!.isNotEmpty)
                                Expanded(
                                  child: Html(
                                    data: question.title,
                                    shrinkWrap: true,
                                    style: FormBuilderTextStyle.htmlTextStyle(
                                        false),
                                  ),
                                ),
                              if (question.flags.isNotEmpty)
                                FlagOverlayWidget(flagList: question.flags)
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (question.description != null &&
                        question.description!.isNotEmpty)
                      Html(
                        data: question.description,
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),*/

                    TitleDescription(
                      code: question.code,
                      title: question.title,
                      description: question.description,
                      flags: question.flags,
                    ),
                    if (question.answerType == AnswerType.static)
                      FullyStaticQuestionRepo.getQuestion(questionWrapper, templetName)
                    else
                      ...questionWrapper.subQuestionWrappers.map(
                        (subQuestionWrapper) => StaticQuestionRenderer(
                          subQuestionWrapper: subQuestionWrapper,
                          questionId: question.id,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (!isDesktop)
            Divider(
              height: 2.h,
              thickness: 2,
              color: AppColors.dividerColor,
            )
        ],
      ),
    );
  }
}

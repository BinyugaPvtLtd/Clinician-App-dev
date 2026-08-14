import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10015004 extends StatelessWidget {
  const Question10015004({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, que, Widget? child) {
          final mainOptionSelected =
              que.subQuestionWrappers[0].subQuestion.options.first.selected;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Html(
                    data: que.subQuestionWrappers.first.subQuestion.title,
                    shrinkWrap: true,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                  _getCheckBox(que, que.subQuestionWrappers[0], 0, true),
                ],
              ),
              customHeight(14.h),
              Responsive.isMobile(context)
                  ? Column(
                      children: [
                        ...List.generate(5, (index) {
                          return _getExpansionRow(
                              que, que.subQuestionWrappers[index + 2]);
                        })
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(flex: 1, child: SizedBox.shrink()),
                            Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return Html(
                                        data: que.subQuestionWrappers[1]
                                            .subQuestion.options[index].label,
                                        shrinkWrap: true,
                                        style: FormBuilderTextStyle
                                            .enableDisableHtmlStyle(
                                                !mainOptionSelected),
                                      );
                                    },
                                  ),
                                ))
                          ],
                        ),
                        ...List.generate(
                          5,
                          (index) {
                            final subQuestionWrapper =
                                que.subQuestionWrappers[index + 2];
                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Html(
                                    data: subQuestionWrapper.subQuestion.title,
                                    style: FormBuilderTextStyle
                                        .enableDisableHtmlStyle(
                                      !mainOptionSelected,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                      5,
                                      (inx) {
                                        return ChangeNotifierProvider<
                                            SubQuestionWrapper>.value(
                                          value: subQuestionWrapper,
                                          child: Consumer<SubQuestionWrapper>(
                                              builder: (BuildContext context,
                                                  subQue, Widget? child) {
                                            return SubQuestionCheckbox(
                                              subQuestionWrapper: subQue,
                                              optionIndex: inx,
                                              isEnabled: !mainOptionSelected,
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    )
            ],
          );
        },
      ),
    );
  }

  Widget _getExpansionRow(
      QuestionWrapper questionWrapper, SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (context, subQuestionWrapper, child) {
          return ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Html(
              data: subQuestionWrapper.subQuestion.title,
              shrinkWrap: true,
              style: FormBuilderTextStyle.htmlTextStyle(false),
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    spacing: 15,
                    children: [
                      ...List.generate(5, (index) {
                        return Row(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _getCheckBox(
                                questionWrapper, subQuestionWrapper, index, true),
                            Html(
                              data: questionWrapper.subQuestionWrappers[1]
                                  .subQuestion.options[index].label,
                              style: FormBuilderTextStyle.htmlTextStyle(false),
                              shrinkWrap: true,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (_) {
        questionWrapper.forceNotify();
      },
    );
  }
}

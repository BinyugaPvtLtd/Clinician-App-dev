import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';

class Question10013001 extends StatelessWidget {
  const Question10013001({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Column(
          children: [
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      _getSymptomPresenceNotice(),
                      const Divider(),
                      _getSymptomFrequencyNotice(),
                      const Divider(),
                    ],
                  )
                : Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.iconGrey,
                        ),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Row(
                              children: [
                                Expanded(
                                  child: _getSymptomPresenceNotice(),
                                ),
                                Expanded(
                                  child: _getSymptomFrequencyNotice(),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Html(
                                      data:
                                          '<div style="text-align:center"><b>1. Symptom Presence</b></div>',
                                      style: FormBuilderTextStyle.htmlTextStyle(
                                          false),
                                    )),
                                    Expanded(
                                        child: Html(
                                      data:
                                          '<div style="text-align:center"><b>2. Symptom Frequency</b></div>',
                                      style: FormBuilderTextStyle.htmlTextStyle(
                                          false),
                                    )),
                                  ],
                                ),
                                Html(
                                  data:
                                      '''<div style="text-align: center; font-weight: bold;">↓ Enter Scores in ↓<br> Boxes </div>''',
                                  shrinkWrap: true,
                                  style:
                                      FormBuilderTextStyle.htmlTextStyle(false),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.iconGrey,
              ),
              itemBuilder: (context, index) {
                if (index == 2) {
                  return Html(
                    data: que.subQuestionWrappers[index].subQuestion.title,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  );
                }
                return isMobile
                    ? Column(
                        children: [
                          _getLabelWidget(que.subQuestionWrappers[index]),
                          _getDataWidget(que.subQuestionWrappers[index + 10],
                              que.subQuestionWrappers[index + 20], isMobile)
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: _getLabelWidget(
                              que.subQuestionWrappers[index],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: _getDataWidget(
                                que.subQuestionWrappers[index + 10],
                                que.subQuestionWrappers[index + 20],
                                isMobile),
                          ),
                        ],
                      );
              },
            ),
            StaticInfoWidget(
                subQuestion: que.subQuestionWrappers[30].subQuestion)
          ],
        );
      }),
    );
  }

  Widget _getDataWidget(SubQuestionWrapper subQuestionWrapper1,
      SubQuestionWrapper subQuestionWrapper2, bool isMobile) {
    return Row(
      spacing: 30,
      children: [
        Expanded(
          child: Column(
            children: [
              if (isMobile)
                Html(
                  data: 'Symptom Presence',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
              StaticDropdownWidget(
                subQuestionWrapper: subQuestionWrapper1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              if (isMobile)
                Html(
                  data: 'Symptom Frequency',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
              StaticDropdownWidget(
                subQuestionWrapper: subQuestionWrapper2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getLabelWidget(SubQuestionWrapper subQuestionWrapper) {
    return Html(
      data: subQuestionWrapper.subQuestion.title,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getSymptomPresenceNotice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: '<b>1. Symptom Presence</b>',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '0. <b>No</b> (enter 0 in column 2)',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '1. <b>Yes</b> (enter 0-3 in column 2)',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '9. <b>No response</b> leave column 2 blank',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '- Not Assessed / No Information',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
      ],
    );
  }

  Widget _getSymptomFrequencyNotice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: '<b>2. Symptom Frequency</b>',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '0. <b>Never or 1 day</b>',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '1. <b>2-6 days</b> (several days)',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '2. <b>7-11 days</b> (half or more of the days)',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        Html(
          data: '3. <b>12-14 days</b> (nearly every day)',
          shrinkWrap: true,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question10008003 extends StatelessWidget {
  const Question10008003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return isMobile?
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[0]),),
                    sbw(10),
                    Text(
                      "inches",
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ],
                ),
                sbh(10),
                Text(
                  "a. - Height (in inches). Record most recent height measure since the most recent SOC/ROC .",
                  style: FormBuilderTextStyle.normal10style,
                ),
                sbh(20),
                Row(
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[1]),),
                    sbw(10),
                    Text(
                      "pounds",
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ],
                ),
                sbh(10),
                Text(
                  "b. - Weight (in pounds). Base weight on most recent measure in last 30 days; measure weight consistently, according to standard agency practice (forexample, ina.m. after voiding, before meal, with shoes off, etc.) ",
                  style: FormBuilderTextStyle.normal10style,
                ),
              ],
            )
            :Column(
          children: [
            customHeight(18.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: 70.w,
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[0])),
                    Text(
                      "inches",
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ],
                ),
                customWidth(13.w),
                Text(
                  "a. -",
                  style: FormBuilderTextStyle.normal10style,
                ),
                customWidth(14.w),
                Flexible(
                  child: Text(
                    "Height (in inches). Record most recent height measure since the most recent SOC/ROC .",
                    style: FormBuilderTextStyle.normal10style,
                  ),
                ),
              ],
            ),
            customHeight(16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: 70.w,
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[1])),
                    Text(
                      "pounds",
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ],
                ),
                customWidth(13.w),
                Text(
                  "b. -",
                  style: FormBuilderTextStyle.normal10style,
                ),
                customWidth(14.w),
                Flexible(
                  child: Text(
                    "Weight (in pounds). Base weight on most recent measure in last 30 days; measure weight consistently, according to standard agency practice (forexample, ina.m. after voiding, before meal, with shoes off, etc.) ",
                    style: FormBuilderTextStyle.normal10style,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

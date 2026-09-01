import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question10018011 extends StatelessWidget {
  const Question10018011({super.key, required this.queWrapper});

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
            ...List.generate(
              9,
              (index) {
                var list = [
                  "",
                  'Able to draw up insulin ',
                  'If no, who assist patient:',
                  'Able to administer insulin',
                  'If no, who assist patient?',
                  "",
                  'Blood Sugar Glucometer Used:',
                  'If yes, how often checked:',
                  'Diabetic foot inspection/findings'
                ];
                return Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Responsive.isMobile(context)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index == 5 || index == 0
                                ? StaticCheckBoxWidget(
                                    subQuestionWrapper: que.subQuestionWrappers[
                                        index == 0 ? 1 : 7])
                                : Html(
                                    data: list[index],
                                    shrinkWrap: true,
                                    style: FormBuilderTextStyle.htmlTextStyle(
                                        false),
                                  ),
                       index == 5? Container():
                            [0, 1, 3, 6].contains(index)
                                ? StaticRadioWidget(
                                    subQuestionWrapper: que.subQuestionWrappers[
                                        [2, 3, 0, 5, 0, 0, 8].elementAt(index)],
                                  )
                                : StaticTextFieldWidget(
                                    subQuestionWrapper: que.subQuestionWrappers[
                                        [0, 0, 4, 0, 6, 0, 0, 9, 10]
                                            .elementAt(index)],
                                  )
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              flex: index == 5 ? 3 : 2,
                              child: index == 5 || index == 0
                                  ? StaticCheckBoxWidget(
                                      subQuestionWrapper:
                                          que.subQuestionWrappers[
                                              index == 0 ? 1 : 7])
                                  : Html(
                                      data: list[index],
                                      shrinkWrap: true,
                                      style: FormBuilderTextStyle.htmlTextStyle(
                                          false),
                                    ),
                            ),
                            index == 5
                                ? const Spacer(
                                    flex: 3,
                                  )
                                : Expanded(
                                    flex: 3,
                                    child: [0, 1, 3, 6].contains(index)
                                        ? StaticRadioWidget(
                                            subQuestionWrapper:
                                                que.subQuestionWrappers[[
                                              2,
                                              3,
                                              0,
                                              5,
                                              0,
                                              0,
                                              8
                                            ].elementAt(index)],
                                          )
                                        : Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: StaticTextFieldWidget(
                                                    subQuestionWrapper: que
                                                        .subQuestionWrappers[[
                                                      0,
                                                      0,
                                                      4,
                                                      0,
                                                      6,
                                                      0,
                                                      0,
                                                      9,
                                                      10
                                                    ].elementAt(index)],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                          ],
                        ),
                );
              },
            ),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[11]),
          ],
        );
      }),
    );
  }
}

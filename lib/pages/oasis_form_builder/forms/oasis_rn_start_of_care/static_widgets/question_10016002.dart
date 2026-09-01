import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10016002 extends StatelessWidget {
  const Question10016002({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[0]),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[1]),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[2]),
            ...List.generate(
              7,
              (index) {
                return Responsive.isMobile(context)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getCheckBox(
                              que,
                              que.subQuestionWrappers[[
                                3,
                                6,
                                8,
                                10,
                                12,
                                14,
                                16,
                                18
                              ].elementAt(index)],
                              0,
                              true),
                          index == 0
                              ? Row(
                                  spacing: 0,
                                  children: [
                                    Expanded(
                                      // width: 150.w,
                                      child: StaticRadioWidget(
                                        subQuestionWrapper:
                                            que.subQuestionWrappers[4],
                                        enabled: que.subQuestionWrappers[3]
                                            .subQuestion.options.first.selected,
                                      ),
                                    ),
                                    SizedBox(
                                      // width: 140.w,
                                      child: StaticCheckBoxWidget(
                                          subQuestionWrapper:
                                              que.subQuestionWrappers[5]),
                                    )
                                  ],
                                )
                              : index == 1
                                  ? HorizontalTextFields(
                                      subQuestionWrapper:
                                          que.subQuestionWrappers[7],
                                      option1Index: 0,
                                      option2Index: 1,
                                      // maxWidth: 120.w,
                                      labelWidth: 20.w, textfieldWidth: 100.w,
                                    )
                                  : index == 2
                                      ? StaticCheckBoxWidget(
                                          subQuestionWrapper:
                                              que.subQuestionWrappers[9], columnCount: 4,)
                                      : StaticRadioWidget(
                                          subQuestionWrapper:
                                              que.subQuestionWrappers[[
                                            11,
                                            13,
                                            15,
                                            17
                                          ].elementAt(index - 3)],
                                          enabled: que
                                              .subQuestionWrappers[[
                                            3,
                                            6,
                                            8,
                                            10,
                                            12,
                                            14,
                                            16,
                                            18
                                          ].elementAt(index)]
                                              .subQuestion
                                              .options
                                              .first
                                              .selected,
                                        )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _getCheckBox(
                                que,
                                que.subQuestionWrappers[[
                                  3,
                                  6,
                                  8,
                                  10,
                                  12,
                                  14,
                                  16,
                                  18
                                ].elementAt(index)],
                                0,
                                true),
                          ),
                          Expanded(
                              flex: 3,
                              child: index == 0
                                  ? Row(
                                      spacing: 0,
                                      // runSpacing: 0,
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: StaticRadioWidget(
                                            subQuestionWrapper:
                                                que.subQuestionWrappers[4],
                                            enabled: que
                                                .subQuestionWrappers[3]
                                                .subQuestion
                                                .options
                                                .first
                                                .selected,
                                          ),
                                        ),
                                        Expanded(
                                          flex:2,
                                          child: StaticCheckBoxWidget(
                                              subQuestionWrapper:
                                                  que.subQuestionWrappers[5]),
                                        )
                                      ],
                                    )
                                  : index == 1
                                      ? HorizontalTextFields(
                                          subQuestionWrapper:
                                              que.subQuestionWrappers[7],
                                          option1Index: 0,
                                          option2Index: 1,
                                          // maxWidth: 120.w,
                                          labelWidth: 20.w,
                                          textfieldWidth: 100.w,
                                        )
                                      : index == 2
                                          ? StaticCheckBoxWidget(
                                              subQuestionWrapper:
                                                  que.subQuestionWrappers[9])
                                          : StaticRadioWidget(
                                              subQuestionWrapper:
                                                  que.subQuestionWrappers[[
                                                11,
                                                13,
                                                15,
                                                17
                                              ].elementAt(index - 3)],
                                              enabled: que
                                                  .subQuestionWrappers[[
                                                3,
                                                6,
                                                8,
                                                10,
                                                12,
                                                14,
                                                16,
                                                18
                                              ].elementAt(index)]
                                                  .subQuestion
                                                  .options
                                                  .first
                                                  .selected,
                                            )),
                        ],
                      );
              },
            ),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[18]),
          ],
        );
      }),
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

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10015001 extends StatelessWidget {
  const Question10015001({super.key, required this.queWrapper});

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
            _getCheckBox(que, que.subQuestionWrappers[0], 0, true),
            // StaticCheckBoxWidget(
            //     subQuestionWrapper: que.subQuestionWrappers[0]),
            Responsive.isMobile(context)
                ? Column(
                    children: [
                      StaticCheckBoxWidget(
                        subQuestionWrapper: que.subQuestionWrappers[1],
                        enabled: !mainOptionSelected,
                      ),
                      StaticRadioWidget(
                        subQuestionWrapper: que.subQuestionWrappers[2],
                        enabled: !mainOptionSelected,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      StaticCheckBoxWidget(
                        subQuestionWrapper: que.subQuestionWrappers[1],
                        enabled: !mainOptionSelected,
                      ),
                      Expanded(
                        child: StaticRadioWidget(
                          subQuestionWrapper: que.subQuestionWrappers[2],
                          enabled: !mainOptionSelected,
                        ),
                      ),
                    ],
                  ),
            Responsive.isMobile(context)
                ? Column(
              children: [
                StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[3],
                  enabled: !mainOptionSelected,
                ),
                StaticRadioWidget(
                  subQuestionWrapper: que.subQuestionWrappers[4],
                  enabled: !mainOptionSelected,
                ),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[3],
                  enabled: !mainOptionSelected,
                ),
                Expanded(
                  child: StaticRadioWidget(
                    subQuestionWrapper: que.subQuestionWrappers[4],
                    enabled: !mainOptionSelected,
                  ),
                ),
              ],
            ),
            StaticCheckBoxWidget(
              subQuestionWrapper: que.subQuestionWrappers[5],
              enabled: !mainOptionSelected,
            ),
            StaticCheckBoxWidget(
              subQuestionWrapper: que.subQuestionWrappers[6],
              enabled: !mainOptionSelected,
            ),
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

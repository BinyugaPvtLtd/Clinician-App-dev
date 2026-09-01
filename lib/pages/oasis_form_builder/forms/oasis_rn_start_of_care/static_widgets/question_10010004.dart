import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10010004 extends StatelessWidget {
  const Question10010004({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    ValueNotifier<bool> isEnabled = ValueNotifier(true);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subquestion = que.subQuestionWrappers;
        //  final options = subquestion[index].subQuestion.options;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeNotifierProvider<SubQuestionWrapper>.value(
              value: subquestion[0],
              child: Consumer<SubQuestionWrapper>(
                  builder: (context, subQue, child) {
                return _getCheckBox(
                  subQue,
                  subQue.subQuestion.options[0],
                  true,
                  onTap: () {
                    isEnabled.value = !isEnabled.value;
                  },
                );
              }),
            ),
            ValueListenableBuilder(
                valueListenable: isEnabled,
                builder: (context, val, ch) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StaticCheckBoxWidget(
                                  subQuestionWrapper: subquestion[1],
                                  enabled: val,
                                  columnCount: 3,
                                  firstElementWidthMultiplier: 1.5,
                                ),
                                StaticCheckBoxWidget(
                                  subQuestionWrapper: subquestion[2],
                                  enabled: val,
                                  columnCount: 3,
                                  firstElementWidthMultiplier: 1.5,
                                ),
                                StaticCheckBoxWidget(
                                  subQuestionWrapper: subquestion[3],
                                  enabled: val,
                                  columnCount: 3,
                                  firstElementWidthMultiplier: 1.5,
                                ),
                              ],
                            ),
                          ),
                          if(!isMobile)Expanded(
                            child: StaticCheckBoxWidget(
                              subQuestionWrapper: subquestion[4],
                              enabled: val,
                            ),
                          ),
                        ],
                      ),
                      if(isMobile)StaticCheckBoxWidget(
                        subQuestionWrapper: subquestion[4],
                        enabled: val,
                      ),
                    ],
                  );
                }),
            ValueListenableBuilder(
                valueListenable: isEnabled,
                builder: (context, val, ch) {
                  return Column(
                    children: [
                      StaticCheckBoxWidget(
                        subQuestionWrapper: subquestion[5],
                        enabled: val,
                      ),
                      StaticCheckBoxWidget(
                        subQuestionWrapper: subquestion[6],
                        enabled: val,
                      ),
                      StaticCheckBoxWidget(
                        subQuestionWrapper: subquestion[7],
                        enabled: val,
                      ),
                      StaticCheckBoxWidget(
                        subQuestionWrapper: subquestion[8],
                        enabled: val,
                      ),
                    ],
                  );
                })
          ],
        );
      }),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool enabled,
      {void Function()? onTap}) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: enabled,
      onChange: (_){
        onTap?.call();
      },
    );
  }
}

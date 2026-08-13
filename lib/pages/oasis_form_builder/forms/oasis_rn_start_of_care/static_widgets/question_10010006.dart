import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10010006 extends StatelessWidget {
  const Question10010006({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isEnabled = ValueNotifier(true);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subQuestion = que.subQuestionWrappers;
        return ValueListenableBuilder(
            valueListenable: isEnabled,
            builder: (context, val, ch) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChangeNotifierProvider<SubQuestionWrapper>.value(
                    value: subQuestion[0],
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
                  StaticCheckBoxWidget(
                    subQuestionWrapper: subQuestion[1],
                    enabled: val,
                  ),
                ],
              );
            });
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

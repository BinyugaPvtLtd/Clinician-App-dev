import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10010005 extends StatelessWidget {
  const Question10010005({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final subQuestionWrappers = queWrapper.subQuestionWrappers;
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Selector<QuestionWrapper, bool>(
        builder: (BuildContext context, bool isEnabled, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // StaticCheckBoxWidget(subQuestionWrapper: subQuestion[0]),
              ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrappers[0],
                child: Consumer<SubQuestionWrapper>(
                    builder: (context, subQue, child) {
                  return _getCheckBox(
                    subQue,
                    subQue.subQuestion.options[0],
                    true,
                    onTap: () {
                      queWrapper.forceNotify();
                    },
                  );
                }),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          4,
                          (index) => StaticCheckBoxWidget(
                            subQuestionWrapper: subQuestionWrappers[index + 1],
                            enabled: isEnabled,
                            columnCount: 3,
                            firstElementWidthMultiplier: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            4,
                            (index) => StaticCheckBoxWidget(
                              subQuestionWrapper: subQuestionWrappers[index + 5],
                              enabled: isEnabled,
                              columnCount: 3,
                              firstElementWidthMultiplier: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      4,
                      (index) => StaticCheckBoxWidget(
                        subQuestionWrapper: subQuestionWrappers[index + 5],
                        enabled: isEnabled,
                        columnCount: 3,
                        firstElementWidthMultiplier: 1.5,
                      ),
                    )
                  ],
                ),
              StaticCheckBoxWidget(
                subQuestionWrapper: subQuestionWrappers[9],
                enabled: isEnabled,
              ),
            ],
          );
        },
        selector: (BuildContext context, QuestionWrapper questionWrapper) =>
            !questionWrapper
                .subQuestionWrappers.first.subQuestion.options.first.selected,
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool enabled,
      {void Function()? onTap}) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: enabled,
      onChange: (_) {
        onTap?.call();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10014004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10014004({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider<QuestionWrapper>.value(
          value: questionWrapper,
          child: Consumer<QuestionWrapper>(
            builder: (BuildContext context, questionWrapper, Widget? child) {
              final subQuestionWrapper = questionWrapper.subQuestionWrappers[0];
              final subQuestionWrapper2 =
                  questionWrapper.subQuestionWrappers[1];
              final options = subQuestionWrapper.subQuestion.options;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0, true),
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final itemWidth = constraints.maxWidth /
                          (Responsive.isMobile(context) ? 2 : 4);
                      return Wrap(
                      children: [
                        ...List.generate(options.length - 1, (index) {
                          return SizedBox(
                            width: itemWidth,
                            child: _getCheckBox(subQuestionWrapper,
                                index + 1, !options[0].selected),
                          );
                        })
                      ],
                      );
                    },

                  ),
                  StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper2,enabled: !options.first.selected,),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      int optionIndex, bool enabled) {
    return SubQuestionCheckbox(

      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
    );
  }
}

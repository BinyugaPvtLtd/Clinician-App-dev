import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/question_wapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_option_model.dart';

class Question10021002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10021002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subWrapper1 = questionWrapper.subQuestionWrappers[0];
    final subWrapper2 = questionWrapper.subQuestionWrappers[1];
    final subWrapper3 = questionWrapper.subQuestionWrappers[2];
    final subWrapper4 = questionWrapper.subQuestionWrappers[3];
    final subWrapper5 = questionWrapper.subQuestionWrappers[4];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subWrapper1,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final options = subQuestionWrapper.subQuestion.options;
              return Column(
                children: [
                  _getCheckBox(subQuestionWrapper, options[0], true),
                ],
              );
            },
          ),
        ),
        _getRowWithOptions(subWrapper2),
        _getRowWithOptions(subWrapper3),
        _getRowWithOptions(subWrapper4),
        _getRowWithOptions(subWrapper5),
      ],
    );
  }

  Widget _getRowWithOptions(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Column(
            children: [
              Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getCheckBox(subQuestionWrapper, options[0], true),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              ...options.sublist(1).map(
                                    (option) => _getCheckBox(subQuestionWrapper,
                                        option, options[0].selected),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: _getCheckBox(
                              subQuestionWrapper, options[0], true),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              ...options.sublist(1).map(
                                    (option) => _getCheckBox(subQuestionWrapper,
                                        option, options[0].selected),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: enabled,
    );
  }
}

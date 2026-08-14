import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question711131001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question711131001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[0]),
        _getDisabledCheckBoxSection(subQuestionWrappers[1]),
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[2]),
        _getDisabledCheckBoxSection(subQuestionWrappers[3]),
        _getDisabledCheckBoxSection(subQuestionWrappers[4]),
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[5]),
      ],
    );
  }

  Widget _getDisabledCheckBoxSection(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, 0, true),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Wrap(
                  children: [
                    ...subQuestionWrapper.subQuestion.options.sublist(1).map(
                          (option) => _getCheckBox(
                            subQuestionWrapper,
                            option.index,
                            subQuestionWrapper
                                .subQuestion.options.first.selected,
                          ),
                        ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
        subQuestionWrapper: subQuestionWrapper,
        optionIndex: optionIndex,
        isEnabled: enabled);
  }
}

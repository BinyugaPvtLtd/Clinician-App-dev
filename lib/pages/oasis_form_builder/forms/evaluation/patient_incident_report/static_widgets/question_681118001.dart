import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question681118001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question681118001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaticTextFieldWidget(
          subQuestionWrapper: subQuestionWrappers[0],
        ),
        StaticCheckBoxWidget(
          subQuestionWrapper: subQuestionWrappers[1],
        ),
        ChangeNotifierProvider.value(
          value: subQuestionWrappers[2],
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context,
                SubQuestionWrapper subQuestionWrapper, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(subQuestionWrapper, 0),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: StaticRadioWidget(
                      subQuestionWrapper: subQuestionWrappers[3],
                      enabled:
                          subQuestionWrapper.subQuestion.options.first.selected,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[4])
      ],
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';

import '../../../../constants/responsive.dart';

class Question691122002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question691122002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      spacing: 10.h,
      children: List.generate(2, (index) {
        final baseIndex = index * 3;
        return _buildQuestionRow(
          checkBoxIndex: baseIndex,
          textFieldIndex: baseIndex + 1,
          dateFieldIndex: baseIndex + 2,
          isMobile: isMobile
        );
      }),
    );
  }

  Widget _buildQuestionRow({
    required int checkBoxIndex,
    required int textFieldIndex,
    required int dateFieldIndex,
    required bool isMobile,
  }) {
    return isMobile
        ? Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaticCheckBoxWidget(
          subQuestionWrapper:
          questionWrapper.subQuestionWrappers[checkBoxIndex],
        ),
        Expanded(
            child: Column(
              children: [
                StaticTextFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[textFieldIndex],
                ),
                StaticDateFieldWidget(
                  subQuestionWrapper: questionWrapper.subQuestionWrappers[dateFieldIndex],
                ),
              ],
            ))
      ],
    )
        : Row(
      children: [
        StaticCheckBoxWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[checkBoxIndex],
        ),
        Expanded(
          flex: 2,
          child: StaticTextFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[textFieldIndex],
          ),
        ),
        Expanded(
          flex: 2,
          child: StaticDateFieldWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[dateFieldIndex],
          ),
        ),
      ],
    );
  }
}

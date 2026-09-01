import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10001008.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question691122001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question691122001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Column(
      spacing: 10.h,
      children: List.generate(3, (index) {
        final baseIndex = index * 3;
        return _buildQuestionRow(
            checkBoxIndex: baseIndex,
            textFieldIndex: baseIndex + 1,
            dateTimeFieldIndex: baseIndex + 2,
            isMobile: isMobile);
      }),
    );
  }

  Widget _buildQuestionRow({
    required int checkBoxIndex,
    required int textFieldIndex,
    required int dateTimeFieldIndex,
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
                    subQuestionWrapper:
                        questionWrapper.subQuestionWrappers[textFieldIndex],
                  ),
                  StaticDateTimeFieldElement(
                    subQuestionWrapper:
                        questionWrapper.subQuestionWrappers[dateTimeFieldIndex],
                  ),
                ],
              ))
            ],
          )
        : Row(
            children: [
              StaticCheckBoxWidget(
                subQuestionWrapper:
                    questionWrapper.subQuestionWrappers[checkBoxIndex],
              ),
              Expanded(
                flex: 2,
                child: StaticTextFieldWidget(
                  subQuestionWrapper:
                      questionWrapper.subQuestionWrappers[textFieldIndex],
                ),
              ),
              Expanded(
                flex: 2,
                child: StaticDateTimeFieldElement(
                  subQuestionWrapper:
                      questionWrapper.subQuestionWrappers[dateTimeFieldIndex],
                ),
              ),
            ],
          );
  }
}

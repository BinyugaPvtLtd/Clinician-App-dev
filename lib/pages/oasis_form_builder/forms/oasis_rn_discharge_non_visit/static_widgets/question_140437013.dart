import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_time_picker_widget.dart';

class Question140437013 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140437013({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        StaticCheckBoxWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[0]),
        sbh(15),
        isMobile
            ? Column(
                children: [
                  StaticDateFieldWidget(
                    subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
                  ),
                  sbh(10),
                  StaticTimePickerWidget(
                    subQuestionWrapper: questionWrapper.subQuestionWrappers[2],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: StaticDateFieldWidget(
                      subQuestionWrapper:
                          questionWrapper.subQuestionWrappers[1],
                    ),
                  ),
                  sbw(10),
                  Expanded(
                    child: StaticTimePickerWidget(
                      subQuestionWrapper:
                          questionWrapper.subQuestionWrappers[2],
                    ),
                  ),
                ],
              ),
        sbh(15),
        StaticTextFieldWidget(
          subQuestionWrapper: questionWrapper.subQuestionWrappers[3],
        ),
      ],
    );
  }
}

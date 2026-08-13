import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../constants/responsive.dart';

class Question140436002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140436002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[0],
              ),
              if(isMobile)
                _getNameTextField(),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[1],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[2],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[3],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[4],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[5],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[6],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[7],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[8],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[9],
              ),
              StaticRadioWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[10],
              ),

              StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[11],
              ),
            ],
          ),
        ),
        if(!isMobile)Expanded(
          flex: 3,
          child: Column(
            children: [
              _getNameTextField(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getNameTextField()
  {
    return StaticTextFieldWidget(
      subQuestionWrapper: questionWrapper.subQuestionWrappers[12],
    );
  }
}

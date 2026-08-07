import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question30093003 extends StatelessWidget {
  const
  Question30093003({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, questionWrapper, Widget? child) {
        return Column(
          children: [
            ...List.generate(
              5,
              (index) {
                return isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getRadioWidget(
                              questionWrapper.subQuestionWrappers[index]),
                          _getTextFieldWidget(
                              questionWrapper.subQuestionWrappers[index + 5]),
                        ],
                      )
                    : Row(
                        spacing: 10.w,
                        children: [
                          Expanded(
                              flex: 5,
                              child: _getRadioWidget(
                                  questionWrapper.subQuestionWrappers[index])),
                          Expanded(
                              flex: 2,
                              child: _getTextFieldWidget(questionWrapper
                                  .subQuestionWrappers[index + 5])),
                        ],
                      );
              },
            ),
            StaticTextFieldWidget(
                subQuestionWrapper: questionWrapper.subQuestionWrappers[10])
          ],
        );
      }),
    );
  }

  Widget _getRadioWidget(SubQuestionWrapper subQuestionWrapper) {
    return StaticRadioWidget(subQuestionWrapper: subQuestionWrapper);
  }

  Widget _getTextFieldWidget(SubQuestionWrapper subQuestionWrapper) {
    return StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper);
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question520919003 extends StatelessWidget {
  const Question520919003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, questionWrapper, Widget? child) {
        return Responsive(
            tablet: Column(
              children: [
                ...List.generate(3, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StaticRadioWidget(
                          subQuestionWrapper:
                              questionWrapper.subQuestionWrappers[index],
                        ),
                      ),
                      Expanded(
                        child: StaticTextFieldWidget(
                          subQuestionWrapper:
                              questionWrapper.subQuestionWrappers[index + 3],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
            desktop: Row(
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StaticRadioWidget(
                              subQuestionWrapper:
                                  questionWrapper.subQuestionWrappers[index]),
                          StaticTextFieldWidget(
                              subQuestionWrapper: questionWrapper
                                  .subQuestionWrappers[index + 3]),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ));
      }),
    );
  }
}

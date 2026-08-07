import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10017005 extends StatelessWidget {
  const Question10017005({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      children: [
        ChangeNotifierProvider<QuestionWrapper>.value(
          value: questionWrapper,
          child: Selector<QuestionWrapper, bool>(
            builder: (BuildContext context, bool enabled, Widget? child) {
              return Column(
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: StaticInfoWidget(
                          subQuestion: subQuestionWrappers[0].subQuestion,
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          questionWrapper,
                          questionWrapper.subQuestionWrappers[1],
                          0,
                          true,
                        ),
                      ),
                    ],
                  ),
                  _getRow(
                    StaticCheckBoxWidget(
                      subQuestionWrapper: subQuestionWrappers[2],
                    ),
                    StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[3],
                    ),
                  ),
                  _getRow(
                    const TitleDescription(
                      title: 'Catheter last changed:',
                    ),
                    StaticDateFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[4],
                    ),
                  ),
                  _getRow(
                    const TitleDescription(
                      title: 'Performed By:',
                    ),
                    StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[5],
                    ),
                  ),
                  _getRow(
                    StaticCheckBoxWidget(
                      subQuestionWrapper: subQuestionWrappers[6],
                    ),
                    StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[7],
                    ),
                  ),
                  StaticCheckBoxWidget(
                      subQuestionWrapper: subQuestionWrappers[8]),
                ],
              );
            },
            selector: (BuildContext context, QuestionWrapper questionWrapper) =>
                questionWrapper
                    .subQuestionWrappers[1].subQuestion.options.first.selected,
          ),
        ),
      ],
    );
  }

  Widget _getRow(Widget firstWidget, Widget secondWidget) {
    return Row(
      children: [
        Expanded(child: firstWidget),
        Expanded(child: secondWidget),
      ],
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (value) {
        questionWrapper.forceNotify();
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import 'package:provider/provider.dart';

class Question741137007 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question741137007({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      children: [
        StaticCheckBoxWidget(subQuestionWrapper: subQuestionWrappers[0]),
        StaticInfoWidget(subQuestion: subQuestionWrappers[1].subQuestion),
        ...subQuestionWrappers.sublist(2).map(
              (subQuestionWrapper) =>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 30.h,thickness: 2,),
                      Text("Date:",style: FormBuilderTextStyle.normal10style,),
                      sbh(10),
                      ChangeNotifierProvider<SubQuestionWrapper>.value(
                                      value: subQuestionWrapper,
                                      child: Consumer<SubQuestionWrapper>(
                      builder: (BuildContext context,
                          SubQuestionWrapper subQuestionWrapper, Widget? child) {
                        final option1 =
                            subQuestionWrapper.subQuestion.options.first;
                        final option2 = subQuestionWrapper.subQuestion.options.last;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 30.w,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: StaticDateFieldElement(
                                onDateChange: (newDate) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      0, newDate.toIso8601String());
                                },
                                initialDate: DateTime.tryParse(option1.value),
                              ),
                            ),
                            Expanded(
                              child: StaticTextFieldElement(
                                option: option2,
                                subQuestion: subQuestionWrapper.subQuestion,
                                onUpdate: (optionIndex, value) {
                                  subQuestionWrapper.updateTextFieldValue(
                                      optionIndex, value);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                                      ),
                                    ),
                    ],
                  ),
            ),
      ],
    );
  }
}

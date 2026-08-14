import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10021007_2 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10021007_2({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subQuestionWrapper.subQuestion.title,
          style: FormBuilderTextStyle.normal10style,
        ),
        SizedBox(
          height: 10,
        ),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrapper,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final options = subQuestionWrapper.subQuestion.options;
              return Row(
                children: [
                  Expanded(
                    child: StaticTextFieldElement(
                      option: options[0],
                      subQuestion: subQuestionWrapper.subQuestion,
                      onUpdate: (optionIndex, value) {
                        options[1].selected = false;
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    ),
                  ),
                  Expanded(
                    child: SubQuestionCheckbox(
                      subQuestionWrapper: subQuestionWrapper,
                      optionIndex: options[1].index,
                      onChange: (_) {
                        options[0].value = '';
                        options[0].textEditingController?.clear();
                      },
                    ),

                    /*DynamicCheckboxElement(
                      label: options[1].label,
                      value: options[1].value,
                      selected: options[1].selected,
                      onTap: (_, __) {
              options[0].value = '';
              options[0].textEditingController?.clear();
                        options[1].selected = !options[1].selected;
                        subQuestionWrapper.forceNotify();
                      },
                      index: options[1].index,
                    ),*/
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

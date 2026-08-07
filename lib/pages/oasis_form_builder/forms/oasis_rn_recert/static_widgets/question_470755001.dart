import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question470755001_1 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question470755001_1({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, options[0], true),
              Wrap(
                children: [
                  ...List.generate(options.length-1, (index){
                    return _getCheckBox(subQuestionWrapper, options[index+1], !options[0].selected);
                  })
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper,
      StaticOptionModel option, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: enabled,
    );
  }
}

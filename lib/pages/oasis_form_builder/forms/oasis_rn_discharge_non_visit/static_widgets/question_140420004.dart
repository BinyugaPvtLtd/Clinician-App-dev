import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:provider/provider.dart';


class Question140420004_1 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question140420004_1({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Route of Transmission',
                    style: FormBuilderTextStyle.bold10Style,
                  ),
                  Text(
                    '↓  Check all that apply  ↓',
                    style: FormBuilderTextStyle.bold10Style,
                  )
                ],
              ),
              ...subQuestionWrapper.subQuestion.options.map(
                    (option) => _getRow(option, subQuestionWrapper),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow(StaticOptionModel option,
      SubQuestionWrapper subQuestionWrapper) {
    return Row(
      children: [
        Expanded(
          child: Html(
            data: option.label,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
        _getCheckBox(option, subQuestionWrapper),
        sbw(40),
      ],
    );
  }

  Widget _getCheckBox(StaticOptionModel option, SubQuestionWrapper subQuestionWrapper) {
    return DynamicCheckboxElement(label: '',
        selected: option.selected,
        value: option.value,
        onTap: (_,__){
          subQuestionWrapper.toggleOption(option.index);
        },
        index: option.index);
  }
}

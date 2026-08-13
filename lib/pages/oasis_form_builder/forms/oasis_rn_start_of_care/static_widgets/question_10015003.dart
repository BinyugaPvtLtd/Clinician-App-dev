import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question10015003 extends StatelessWidget {
  const Question10015003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          children: [
            if(!isMobile)Row(
              children: [
               _getPrefixLabel(),
                SizedBox(
                  width: 75.w,
                  child: _getTextField(que.subQuestionWrappers[0]),
                ),
                _getSuffixLabel(que.subQuestionWrappers[1]),
                Expanded(
                  child: _getCheckBox(que.subQuestionWrappers[2]),
                )
              ],
            ),
            if(isMobile) Column(
              children: [
                Row(
                  children: [
                   _getPrefixLabel(),
                    Expanded(
                      child: _getTextField(que.subQuestionWrappers[0]),
                    ),
                    _getSuffixLabel(que.subQuestionWrappers[1]),
                  ],
                ),
               _getCheckBox(que.subQuestionWrappers[2]),
              ],
            ),
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[3]),
            StaticCheckBoxWidget(subQuestionWrapper: que.subQuestionWrappers[4])
          ],
        );
      }),
    );
  }

  Widget _getPrefixLabel(){
    return  Html(
      data: 'O2:',
      shrinkWrap: true,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getSuffixLabel(SubQuestionWrapper subQuestionWrapper){
    return  Html(
      data: subQuestionWrapper.subQuestion.title,
      shrinkWrap: true,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper){
    return   StaticCheckBoxWidget(
        subQuestionWrapper: subQuestionWrapper);
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return StaticTextFieldElement(
              option: subQuestionWrapper.subQuestion.options.first,
              subQuestion: subQuestionWrapper.subQuestion,
              onUpdate: (optionIndex, value) {
                subQuestionWrapper.updateTextFieldValue(optionIndex, value);
              });
        },
      ),
    );
  }
}

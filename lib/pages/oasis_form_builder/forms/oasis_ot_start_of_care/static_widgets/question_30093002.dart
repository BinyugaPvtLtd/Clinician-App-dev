import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question30093002 extends StatelessWidget {
  final String popupCode1;
  final String popupCode2;
  final QuestionWrapper questionWrapper;

  const Question30093002({super.key, required this.questionWrapper, required this.popupCode1, required this.popupCode2});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      children: [
        _getRow(context,subQuestionWrappers[0],popupCode1),
        _getRow(context,subQuestionWrappers[1],popupCode2),
        StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[2]),
        sbh(10),
        StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[3]),
      ],
    );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,String popupCode) {
    final isMobile = Responsive.isMobile(context);
    return isMobile?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getLabel(context, popupCode, subQuestionWrapper),
        _getDropdown(subQuestionWrapper),
      ],
    ):Row(
      children: [
        Expanded(
          flex: 4,
          child: _getLabel(context, popupCode, subQuestionWrapper),
        ),
        Expanded(
          flex: 5,
          child: _getDropdown(subQuestionWrapper)
        ),
      ],
    );
  }

  Widget _getLabel(BuildContext context, String popupCode, SubQuestionWrapper subQuestionWrapper){
    return InkWell(
      onTap: (){
        PopupHandler.showPopup(context, popupCode, (_){});
      },
      child: TitleDescription(
        title: subQuestionWrapper.subQuestion.title,
      ),
    );
  }

  Widget _getDropdown(SubQuestionWrapper subQuestionWrapper)
  {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, subQuestionWrapper, Widget? child) {
          return StaticDropdownElement(
            subQuestionWrapper: subQuestionWrapper,
            onChanged: (newOption) {
              subQuestionWrapper.setOption(newOption!.index);
            },
          );
        },
      ),
    );
  }
}

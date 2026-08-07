import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_option_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question470770001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question470770001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        _getRow(questionWrapper.subQuestionWrappers[0],isMobile),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[1],isMobile),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[2],isMobile),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[3],isMobile),
        _getDivider(),
        _getRow(questionWrapper.subQuestionWrappers[4],isMobile),
      ],
    );
  }

  Widget _getDivider() {
    return Divider();
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          final option1 = subQuestionWrapper.subQuestion.options[0];
          final option2 = subQuestionWrapper.subQuestion.options[1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: TitleDescription(
                        title: subQuestionWrapper.subQuestion.title),
                  ),
                  isMobile?SizedBox(width: 10,):Spacer(),
                  Expanded(
                    flex: isMobile?4:3,
                    child: DynamicOptionElement(
                      disableValueShow: true,
                      isTitleCenter: true,
                      label: option1.label,
                      value: option1.value,
                      selected: option1.selected,
                      onTap: (_, __) {  
                        if (option1.popupCode != null && !option1.selected) {
                          PopupHandler.showPopup(context, option1.popupCode!,
                              (newValue) {
                            subQuestionWrapper.addNotesToOption(
                                option1.index, newValue);
                            subQuestionWrapper.toggleOption(option1.index);
                          });
                        } else {
                          subQuestionWrapper.toggleOption(option1.index);
                        }
                      },
                      index: option1.index,
                      optionsAlignment: OptionsAlignment.vertical,
                    ),
                  ),
                  SizedBox(
                    width: isMobile?10:25,
                  ),
                  Expanded(
                    flex:isMobile?5:3,
                    child: DynamicOptionElement(
                      isTitleCenter: true,
                      label: option2.label,
                      value: option2.value,
                      selected: option2.selected,
                      onTap: (_, __) {
                        subQuestionWrapper.toggleOption(option2.index);
                      },
                      index: option2.index,
                      optionsAlignment: OptionsAlignment.vertical,
                    ),
                  ),
                ],
              ),
              if (option1.popupCode != null && option1.selected)
                Html(
                  data: "<b>Additional Details:</b> <i>${option1.value}</i>",
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                )
            ],
          );
        },
      ),
    );
  }
}

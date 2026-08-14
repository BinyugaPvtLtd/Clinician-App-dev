import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:provider/provider.dart';

import '../../../../constants/enums.dart';
import '../../../../constants/responsive.dart';
import '../../model/option_data_model.dart';

class DynamicCheckBoxSection extends StatelessWidget {
  const DynamicCheckBoxSection({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          final question = questionWrapper.question;
          final options = question.options;
          final optionsAlignment =
              question.optionsAlignment ?? OptionsAlignment.vertical;
          //if desktop not check box show vertical
          return (optionsAlignment == OptionsAlignment.vertical)
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ...options!.map((option) {
                    return _getCheckBox(
                        questionWrapper, option, optionsAlignment);
                  }),
                ])
              : LayoutBuilder(builder: (context, constraints) {
                  final columnCount = Responsive.isMobile(context) ? 2 : 4;
                  double itemWidth = (constraints.maxWidth / columnCount);
                  return  Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: options!.map(
                              (option) => SizedBox(
                                width: itemWidth,
                                child: _getCheckBox(
                                    questionWrapper, option, optionsAlignment),
                              ),
                            ).toList()
                          ,
                        );
                      
                });
        },
      ),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper, OptionDataModel option,
      OptionsAlignment optionsAlignment) {
    return DynamicCheckboxElement(
      label: option.label,
      value: option.value,
      selected: option.selected,
      onTap: (bool value, index) {
        questionWrapper.toggleOption(index);
      },
      index: option.index,
      optionsAlignment: optionsAlignment,
      hint: option.hint,
      popupCode: option.popupCode,
      onPopupValueChange: (popupValue) {
        questionWrapper.addNotesToOption(option.index, popupValue);
      },
    );
  }
}

/*GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisExtent: 33),
                  itemBuilder: (ctx, index) {
                    final option = questionWrapper.question.options![index];
                    return Row(
                      children: [
                        Expanded(
                          child: DynamicCheckboxElement(
                            label: option.label,
                            value: option.value,
                            selected: option.selected,
                            onTap: (bool value, index) {
                              questionWrapper.toggleOption(index);
                            },
                            index: option.index,
                            optionsAlignment: optionsAlignment,
                            hint: option.hint,
                            popupCode: option.popupCode,
                            onPopupValueChange: (popupValue) {
                              questionWrapper.updateTextFieldValue(
                                  option.index, popupValue);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: questionWrapper.question.options!.length,
                )*/

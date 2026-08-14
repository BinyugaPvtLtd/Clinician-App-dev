import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_button_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../ui_components/app_hover_tooltip.dart';
import '../../data/static_question_model.dart';

class StaticButtonWidget extends StatelessWidget {
  const StaticButtonWidget({
    super.key,
    required this.subQuestionWrapper,
  });

  final SubQuestionWrapper subQuestionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal
              ? Responsive.isMobile(context)
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getTitleWidget(context, subQuestion),
                              Column(
                                children: [
                                  if (subQuestion.optionsAlignment ==
                                      OptionsAlignment.horizontal)
                                    Wrap(
                                      spacing: 20,
                                      children: [
                                        ...getOptionsWidgets(
                                            context, subQuestionWrapper),
                                      ],
                                    )
                                  else
                                    ...getOptionsWidgets(
                                        context, subQuestionWrapper),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: getTitleWidget(context, subQuestion),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              if (subQuestion.optionsAlignment ==
                                  OptionsAlignment.horizontal)
                                Wrap(
                                  spacing: 20,
                                  children: [
                                    ...getOptionsWidgets(
                                        context, subQuestionWrapper),
                                  ],
                                )
                              else
                                ...getOptionsWidgets(
                                    context, subQuestionWrapper),
                            ],
                          ),
                        ),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(child: getTitleWidget(context, subQuestion)),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    ),
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      Wrap(
                        spacing: 20,
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      )
                    else
                      ...getOptionsWidgets(context, subQuestionWrapper),
                  ],
                );
        },
      ),
    );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return TitleDescription(
      code: subQuestion.code,
      title: subQuestion.title,
      description: subQuestion.description,
    );
  }

  List<Widget> getOptionsWidgets(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    final optionsAlignment = subQuestionWrapper.subQuestion.optionsAlignment;
    final options = subQuestionWrapper.subQuestion.options;
    return options.map((option) {
      return DynamicButtonElement(
        label: option.label,
        value: option.value,
        selected: option.selected,
        index: option.index,
        onTap: (String value, index) {
          subQuestionWrapper.toggleOption(index);
        },
      );
    }).toList();
  }
}

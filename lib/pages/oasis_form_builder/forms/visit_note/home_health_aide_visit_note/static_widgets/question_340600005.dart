import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question340600005 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

   Question340600005({super.key, required this.questionWrapper});

  final double maxWidthForMobile = 750;
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Container(
      constraints:
      isMobile ? BoxConstraints(maxWidth: maxWidthForMobile) : null,
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Column(
              spacing: 10.h,
              children: [
                _getHeadingRow(isMobile),
                ...questionWrapper.subQuestionWrappers
                    .map((subQuestionWrapper) => Column(
                  children: [
                    _getDataRow(subQuestionWrapper, isMobile),
                    Divider(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    )
        :  Column(
      spacing: 10.h,
      children: [
        _getHeadingRow(isMobile),
        ...questionWrapper.subQuestionWrappers
            .map((subQuestionWrapper) => Column(
                  children: [
                    _getDataRow(subQuestionWrapper, isMobile),
                    Divider(),
                  ],
                )),
      ],
    );
  }

  Widget _getDataRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Container(constraints:
          isMobile ? BoxConstraints(maxWidth: maxWidthForMobile) : null,

            child: Row(
              spacing: isMobile ? 10 : 20.w,
              children: [
                Expanded(
                  flex: isMobile ? 3 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleDescription(
                        title: subQuestionWrapper.subQuestion.title,
                        textAlign: 'left',
                      ),
                      if (options.length > 5)
                        ...options.sublist(5).map(
                              (option) =>
                                  _getCheckBox(subQuestionWrapper, option.index),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  flex: isMobile ? 2 : 1,
                  child: Center(child: _getCheckBox(subQuestionWrapper, 0)),
                ),
                Expanded(
                  flex: isMobile ? 3 : 1,
                  child: _getTextField(subQuestionWrapper, 1),
                ),
                Expanded(
                  flex: isMobile ? 3 : 1,
                  child: _getTextField(subQuestionWrapper, 2),
                ),
                Expanded(
                  flex: isMobile ? 2 : 1,
                  child: Center(child: _getCheckBox(subQuestionWrapper, 3)),
                ),
                Expanded(
                  flex: isMobile ? 3 : 1,
                  child: _getTextField(subQuestionWrapper, 4),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getHeadingRow(bool isMobile) {
    return Container(constraints:
    isMobile ? BoxConstraints(maxWidth: maxWidthForMobile) : null,

      child: Row(
        spacing: isMobile ? 10 : 20.w,
        children: [
          ...List.generate(6, (index) {
            final titleList = [
              "Task",
              "Assigned",
              "Frequency",
              "Notes",
              "Performed",
              "Comments",
            ];
            return Expanded(
                flex: isMobile ? [0, 2, 3, 5].contains(index) ? 3 : 2:1,
            child: TitleDescription(
            title: index == 0
            ? "<b>${titleList[index]}</b>"
                : "<div style='text-align:center'><b>${titleList[index]}</b></div>",

            )
            );
          }),
        ],
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, int optionIndex,
      {bool isEnabled = true}) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: isEnabled,
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex,
      {bool isEnabled = true}) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];

    return SizedBox(
      width: 100.w,
      child: StaticTextFieldElement(
        option: option,
        subQuestion: subQuestionWrapper.subQuestion,
        onUpdate: (optionIndex, value) {
          subQuestionWrapper.updateTextFieldValue(optionIndex, value);
        },
        enabled: isEnabled,
      ),
    );
  }
}

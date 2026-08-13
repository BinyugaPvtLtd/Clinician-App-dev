import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/responsive.dart';
import '../../../../constants/static_decoration.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../../widgets/static/presentation/widgets/static_textfield_widget.dart';

class Question340600003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

   Question340600003({super.key, required this.questionWrapper});

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
                _getDataRowIndex0(questionWrapper.subQuestionWrappers[0], isMobile),
                Divider(),
                ...questionWrapper.subQuestionWrappers
                    .sublist(1)
                    .map((subQuestionWrapper) => Column(
                  children: [
                    _getDataRow(subQuestionWrapper,isMobile),
                    Divider(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    )
        : Column(
      spacing: 10.h,
      children: [
        _getHeadingRow(isMobile),
        _getDataRowIndex0(questionWrapper.subQuestionWrappers[0], isMobile),
        Divider(),
        ...questionWrapper.subQuestionWrappers
            .sublist(1)
            .map((subQuestionWrapper) => Column(
              children: [
                _getDataRow(subQuestionWrapper, isMobile),
                Divider(),
              ],
            )),
      ],
    );
  }

  Widget _getDataRowIndex0(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Container(
            constraints: isMobile?BoxConstraints(maxWidth: maxWidthForMobile):null,
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
                      _getCheckBox(subQuestionWrapper, 5),
                      _getCheckBox(subQuestionWrapper, 6),
                      _getCheckBox(subQuestionWrapper, 7),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _getRadio(subQuestionWrapper, 8, options.sublist(8)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _getRadio(subQuestionWrapper, 9, options.sublist(8)),
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

  Widget _getDataRow(SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Container( constraints: isMobile?BoxConstraints(maxWidth: maxWidthForMobile):null,

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
    return Container(
      constraints: isMobile?BoxConstraints(maxWidth: maxWidthForMobile):null,
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

  Widget _getRadio(SubQuestionWrapper subQuestionWrapper, int optionIndex,
      List<StaticOptionModel> options,
      {bool isEnabled = true}) {
    print(options);
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 15.h,
          width: 15.w,
          child: Radio(
            value: option.value,
            groupValue:
                options.firstWhereOrNull((option) => option.selected)?.value,
            activeColor: AppColors.textGreyColor,
            fillColor: WidgetStatePropertyAll(AppColors.textGreyColor),
            onChanged: (value) {
              if (optionIndex == 8) {
                subQuestionWrapper.subQuestion.options[optionIndex].selected =
                    true;
                subQuestionWrapper
                    .subQuestion.options[optionIndex + 1].selected = false;
              } else {
                subQuestionWrapper.subQuestion.options[optionIndex].selected =
                    true;
                subQuestionWrapper
                    .subQuestion.options[optionIndex - 1].selected = false;
              }
              subQuestionWrapper.updateTextFieldValue(
                  optionIndex, option.value);
              subQuestionWrapper.forceNotify();
            },
          ),
        ),
        customWidth(2.w),
        Flexible(
          child: Html(
            data: option.label,
            shrinkWrap: true,
            style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
            // style: FormBuilderTextStyle.normal10style,
          ),
        ),
        if (option.selected && (option.popupCode ?? '').isNotEmpty)
          Flexible(
            child: Html(
              data: ': <i>${option.value}</i>',
              shrinkWrap: true,
              style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
              // style: FormBuilderTextStyle.normal10style,
            ),
          ),
      ],
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

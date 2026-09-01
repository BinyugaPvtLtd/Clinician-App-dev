import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/form_key_string.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/responsive.dart';
import '../../../popup/popup_handler.dart';
import '../../data/static_option_model.dart';

class StaticTextFieldWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final bool enabled;

  final int? titleFlex;
  final int? valueFlex;

  const StaticTextFieldWidget({
    super.key,
    required this.subQuestionWrapper,
    this.enabled = true,
    this.titleFlex,
    this.valueFlex,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return subQuestion.scrollAxisAlignment ==
                      OptionsAlignment.horizontal &&
                  !Responsive.isMobile(context)
              ? Row(
                  children: [
                    if (subQuestion.title.isNotEmpty)
                      Expanded(
                        flex: titleFlex ?? 4,
                        child: getTitleWidget(context, subQuestion),
                      ),
                    Expanded(
                      flex: valueFlex ?? 5,
                      child: Column(
                        spacing: 15,
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      ),
                    ),
                    if (subQuestion.flags.isNotEmpty)
                      FlagOverlayWidget(flagList: subQuestion.flags)
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Row(
                      children: [
                        if (subQuestion.title.isNotEmpty)
                          Expanded(child: getTitleWidget(context, subQuestion)),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    ),
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      Wrap(
                        runSpacing: 10,
                        spacing: 20,
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      )
                    else
                      Column(
                        spacing: 15,
                        children: [
                          ...getOptionsWidgets(context, subQuestionWrapper),
                        ],
                      )
                  ],
                );
        },
      ),
    );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (subQuestion.code != null && subQuestion.code!.isNotEmpty)
            ? QuestionMarkupCode(code:subQuestion.code!)
            : const SizedBox(
                width: 1,
              ),
        Flexible(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
          ),
        ),
      ],
    );
  }

  List<Widget> getOptionsWidgets(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    final subQuestion = subQuestionWrapper.subQuestion;
    final isScrollAxisHorizontal =
        subQuestion.optionsAlignment == OptionsAlignment.horizontal;
    return isScrollAxisHorizontal && subQuestion.options.length == 2
        ? [
            HorizontalTextFields(
                subQuestionWrapper: subQuestionWrapper,
                option1Index: 0,
                option2Index: 1)
          ]
        : subQuestion.options.map((option) {
            return Responsive.isMobile(context)
                ? _getMobileView(
                    context, option, subQuestion, subQuestionWrapper)
                : _getDesktopView(context, option, subQuestion,
                    subQuestionWrapper, isScrollAxisHorizontal);
          }).toList();
  }

  Widget _getDesktopView(
      BuildContext context,
      StaticOptionModel option,
      StaticQuestionModel subQuestion,
      SubQuestionWrapper subQuestionWrapper,
      bool isScrollAxisHorizontal) {
    return Row(
      children: [
        if (option.label.isNotEmpty)
          Expanded(
            flex: isScrollAxisHorizontal
                ? option.label.length == 1
                    ? 1
                    : option.label.length > 4
                        ? 2
                        : 1
                : 4,
            child: _getLabelWidget(option, subQuestionWrapper),
          ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: _getTextFieldElement(option, subQuestion),
              ),
              if (option.hint != null && option.hint!.isNotEmpty)
                Expanded(
                  child: _getHintWidget(option),
                ),
              if (option.popupCode != null) _getEditIconButton(context, option)
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMobileView(BuildContext context, StaticOptionModel option,
      StaticQuestionModel subQuestion, SubQuestionWrapper subQuestionWrapper) {
    return Column(
      children: [
        if (option.label.isNotEmpty)
          _getLabelWidget(option, subQuestionWrapper),
        Row(
          children: [
            Expanded(
              child: _getTextFieldElement(option, subQuestion),
            ),
            if (option.popupCode != null) _getEditIconButton(context, option),
          ],
        ),
        if (option.hint != null && option.hint!.trim().isNotEmpty)
          _getHintWidget(option),
      ],
    );
  }

  Widget _getLabelWidget(
      StaticOptionModel option, SubQuestionWrapper subQuestionWrapper) {
    return Html(
      data: option.label,
      style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
    );
  }

  Widget _getTextFieldElement(
      StaticOptionModel option, StaticQuestionModel subQuestion) {
    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestion,
      onUpdate: (index, value) {
        subQuestionWrapper.updateTextFieldValue(index, value);
      },
      enabled: enabled,
    );
  }

  Widget _getEditIconButton(BuildContext context, StaticOptionModel option) {
    return IconButton(
      onPressed: () {
        PopupHandler.showPopup(
          context,
          FormkeyString.editPopup,
          (newValue) {
            subQuestionWrapper.updateTextFieldValue(option.index, newValue);
          },
          title: option.label,
        );
      },
      icon: const Icon(Icons.edit_outlined),
      color: AppColors.primaryAppLightColor,
    );
  }

  Widget _getHintWidget(StaticOptionModel option) {
    return Html(
      data: option.hint,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }
}

class
StaticTextFieldElement extends StatelessWidget {
  final StaticOptionModel option;
  final StaticQuestionModel subQuestion;
  final Function(int index, String value) onUpdate;
  final bool enabled;

  const StaticTextFieldElement({
    super.key,
    required this.option,
    required this.subQuestion,
    required this.onUpdate,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: option.textEditingController,
      maxLines: subQuestion.type == AnswerType.textArea ? 4 : null,
      onChanged: (value){
        onUpdate(option.index, value);
      },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
        // onUpdate(option.index, (option.textEditingController?.text).toString());
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 10, vertical: Responsive.isDesktop(context) ? 10 : 15),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 1)),
        // floatingLabelStyle: floatingLabelStyle,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 0)),
        fillColor: Colors.white,
        filled: true,
        hintStyle: FormBuilderTextStyle.normal10style.copyWith(
            fontWeight: FontWeight.w400, color: AppColors.hintGreyColor),
        hintText: "Enter Text",
        enabled: true,
      ),
      style: FormBuilderTextStyle.normal10style,
    );
  }
}

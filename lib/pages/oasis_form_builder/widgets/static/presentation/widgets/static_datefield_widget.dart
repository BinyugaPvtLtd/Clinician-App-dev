import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/helpers/date_formatter.dart';
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

class StaticDateFieldWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final bool enabled;

  const StaticDateFieldWidget({
    super.key,
    required this.subQuestionWrapper,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, value, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return subQuestion.scrollAxisAlignment ==
                      OptionsAlignment.horizontal &&
                  !isMobile
              ? Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: getTitleWidget(context, subQuestion),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ...getOptionsWidgets(
                                  context,
                                  subQuestionWrapper,
                                  isMobile,
                                ),
                              ],
                            ),
                          ),
                          if (subQuestion.flags.isNotEmpty)
                            FlagOverlayWidget(flagList: subQuestion.flags)
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Responsive.isMobile(context)
                        ? Column(
                            children: [
                              getTitleWidget(context, subQuestion),
                              if (subQuestion.flags.isNotEmpty)
                                FlagOverlayWidget(flagList: subQuestion.flags)
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: getTitleWidget(context, subQuestion),
                              ),
                              if (subQuestion.flags.isNotEmpty)
                                FlagOverlayWidget(flagList: subQuestion.flags)
                            ],
                          ),
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 20,
                        children: [
                          ...getOptionsWidgets(
                            context,
                            subQuestionWrapper,
                            isMobile,
                          ),
                        ],
                      )
                    else
                      ...getOptionsWidgets(
                        context,
                        subQuestionWrapper,
                        isMobile,
                      ),
                  ],
                );
        },
      ),
    );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subQuestion.code != null && subQuestion.code!.isNotEmpty)
          QuestionMarkupCode(code:subQuestion.code!),
        Expanded(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.enableDisableHtmlStyle(enabled),
          ),
        ),
      ],
    );
  }

  List<Widget> getOptionsWidgets(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return subQuestion.options
        .map((option) =>
            isMobile ? _getMobileView(option, subQuestionWrapper) : _getDesktopView(option,subQuestionWrapper))
        .toList();
  }

  Widget _getDesktopView(StaticOptionModel option, SubQuestionWrapper subQuestionWrapper) {
    return Row(
      children: [
        if (option.label.isNotEmpty)
          Expanded(
            flex: 4,
            child: Html(
              data: option.label,
              style: FormBuilderTextStyle.htmlTextStyle(false),
            ),
          ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: StaticDateFieldElement(
                  onDateChange: (DateTime newDateTime) {
                    subQuestionWrapper.updateTextFieldValue(
                        option.index, newDateTime.toIso8601String());
                  },
                  initialDate: DateTime.tryParse(option.value),
                  enabled: enabled,
                ),
              ),
              if (option.hint != null && option.hint!.isNotEmpty)
                Expanded(
                  child: Html(
                    data: option.hint,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMobileView(StaticOptionModel option, SubQuestionWrapper subQuestionWrapper) {
    return Column(
      children: [
        if (option.label.isNotEmpty)
          Html(
            data: option.label,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        StaticDateFieldElement(
          onDateChange: (DateTime newDateTime) {
            subQuestionWrapper.updateTextFieldValue(
                option.index, newDateTime.toIso8601String());
          },
          initialDate: DateTime.tryParse(option.value),
          enabled: enabled,
        ),
        if (option.hint != null && option.hint!.trim().isNotEmpty)
          Expanded(
            child: Html(
              data: option.hint,
              style: FormBuilderTextStyle.htmlTextStyle(false),
            ),
          )
      ],
    );
  }
}

class StaticDateFieldElement extends StatelessWidget {
  final Function(DateTime newDateTime) onDateChange;
  final DateTime? initialDate;
  final bool enabled;

  const StaticDateFieldElement({
    super.key,
    required this.onDateChange,
    this.initialDate,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: InkWell(
        onTap: () async {
          if (enabled) {
            final date = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(1000),
              lastDate: DateTime(5000),
            );
            if (date != null) {
              onDateChange(date);
            }
          }
        },
        child: Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: true,
                child: TextFormField(
                  key: UniqueKey(),
                  initialValue: initialDate == null
                      ? null
                      : formatDate(initialDate!),
                  readOnly: true,
                  enabled: enabled,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      // horizontal: 10,
                      vertical: Responsive.isDesktop(context) ? 10 : 15,
                    ),
                    hintStyle: FormBuilderTextStyle.normal10style.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintGreyColor),
                    hintText: "MM-DD-YYYY",
                  ),
                  style: FormBuilderTextStyle.normal10style
                      .copyWith(color: enabled ? null : AppColors.greyColor),
                ),
              ),
            ),
            const Icon(
              Icons.calendar_month,
              color: AppColors.textGreyColor,
            ),
          ],
        ),
      ),
    );
    /*Container(
      height: 38,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white),
      padding: const EdgeInsets.only(left: 15),
      child: DateFormatField(
        // textStyle: FormBuilderTextStyle.bold10Style,
        onComplete: (newDateTime) {
          if (newDateTime != null) {
            onDateChange(newDateTime);
          }
        },
        initialDate: initialDate,
        type: DateFormatType.type2,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'dd/mm/yyyy',
          labelStyle: FormBuilderTextStyle.bold10Style,
          hintStyle: FormBuilderTextStyle.normal10style,
          contentPadding: EdgeInsets.symmetric(
            vertical: 6,
          ),
        ),
      ),
    )*/
    ;
  }
}

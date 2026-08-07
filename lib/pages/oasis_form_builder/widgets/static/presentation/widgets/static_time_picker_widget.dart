import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/responsive.dart';
import '../../../popup/popup_handler.dart';
import '../../data/static_option_model.dart';

class StaticTimePickerWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const StaticTimePickerWidget({
    super.key,
    required this.subQuestionWrapper,
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
                                    context, subQuestionWrapper, isMobile),
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
              : Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 20,
                            children: [
                              ...getOptionsWidgets(
                                  context, subQuestionWrapper, isMobile),
                            ],
                          ),
                        )
                      else
                        ...getOptionsWidgets(
                            context, subQuestionWrapper, isMobile),
                    ],
                  ),
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                PopupHandler.showQuestionCodePopup(context, subQuestion.code!);
              },
              child: Text(
                "(${subQuestion.code})",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xffFF0000),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        Expanded(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  List<Widget> getOptionsWidgets(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return subQuestion.options
        .map((option) => isMobile
            ? Column(
                children: [if (option.label.trim().isNotEmpty)
                  _getLabelWidget(option),
                  _getTimeFieldWidget(option, subQuestionWrapper),
                  if (option.hint != null && option.hint!.isNotEmpty)
                    _getHintWidget(option)
                ],
              )
            : Row(
                children: [
                  if (option.label.trim().isNotEmpty)
                    Expanded(
                      flex: 4,
                      child: _getLabelWidget(option),
                    ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          child:
                              _getTimeFieldWidget(option, subQuestionWrapper),
                        ),
                        if (option.hint != null && option.hint!.isNotEmpty)
                          Expanded(
                            child: _getHintWidget(option),
                          ),
                      ],
                    ),
                  ),
                ],
              ))
        .toList();
  }

  Widget _getLabelWidget(StaticOptionModel option) {
    return Html(
      data: option.label,
    );
  }

  Widget _getTimeFieldWidget(
      StaticOptionModel option, SubQuestionWrapper subquestionWrapper) {
    return StaticTimePickerElement(
      onDateChange: (DateTime newDateTime) {
        subQuestionWrapper.updateTextFieldValue(
            option.index, newDateTime.toIso8601String());
      },
      initialDate: DateTime.tryParse(option.value),
    );
  }

  Widget _getHintWidget(StaticOptionModel option) {
    return Html(
      data: option.hint,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }
}

class StaticTimePickerElement extends StatelessWidget {
  final Function(DateTime newDateTime) onDateChange;
  final DateTime? initialDate;

  const StaticTimePickerElement(
      {super.key, required this.onDateChange, this.initialDate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final time = await showTimePicker(
            context: context,
            initialTime: initialDate == null
                ? TimeOfDay.now()
                : TimeOfDay.fromDateTime(initialDate!));
        if (time != null) {
          onDateChange(
            DateTime.now().copyWith(
              hour: time.hour,
              minute: time.minute,
              second: 0,
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white),
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                initialDate == null
                    ? "HH:MM:SS AM/PM"
                    : DateFormat('hh:mm:ss a').format(initialDate!),
                style: FormBuilderTextStyle.normal10style.copyWith(color:initialDate == null?AppColors.hintGreyColor:null ),
              ),
            ),
            Icon(
              Icons.timer_outlined,
              color: AppColors.textGreyColor,
            ),
            SizedBox(
              width: 5.w,
            )
          ],
        ),
      ),
    );
  }
}

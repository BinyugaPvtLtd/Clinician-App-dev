import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/option_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:provider/provider.dart';

class DynamicRadioSection extends StatelessWidget {
  const DynamicRadioSection({
    super.key,
    required this.questionWrapper,
  });

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, subQuestionWrapper, Widget? child) {
        final question = questionWrapper.question;
        return question.optionsAlignment == OptionsAlignment.horizontal
            ? getWrappedOptionsWidget(context, questionWrapper)
            : Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getWidget(context, questionWrapper),
                ),
              );
      }),
    );
  }

  Widget getWrappedOptionsWidget(
      BuildContext context, QuestionWrapper questionWrapper) {
    final subQuestion = questionWrapper.question;
    var groupValue = subQuestion.options
        ?.firstWhereOrNull((option) => option.selected)
        ?.value;
    return LayoutBuilder(builder: (context, constraints) {
      final columnCount = 4;
      double itemWidth = (constraints.maxWidth / columnCount);
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ...questionWrapper.question.options!.map(
            (option) => SizedBox(
              width: itemWidth,
              child: _getRadio(
                  option, groupValue, context, questionWrapper, subQuestion),
            ),
          )
        ],
      );
    });
  }

  List<Widget> getWidget(
      BuildContext context, QuestionWrapper questionWrapper) {
    final subQuestion = questionWrapper.question;
    var groupValue = subQuestion.options
        ?.firstWhereOrNull((option) => option.selected)
        ?.value;
    return subQuestion.options
            ?.map((option) => _getRadio(
                option, groupValue, context, questionWrapper, subQuestion))
            .toList() ??
        [];
  }

  Row _getRadio(
      OptionDataModel option,
      String? groupValue,
      BuildContext context,
      QuestionWrapper questionWrapper,
      QuestionDataModel subQuestion) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: Radio(
              value: option.value,
              groupValue: groupValue,
              activeColor: AppColors.textGreyColor,
              fillColor: const WidgetStatePropertyAll(AppColors.textGreyColor),
              onChanged: (value) {
                if ((option.popupCode ?? '').isNotEmpty) {
                  PopupHandler.showPopup(context, option.popupCode!,
                      (popupValue) {
                    questionWrapper.addNotesToOption(option.index, popupValue);
                    groupValue = popupValue;
                    for (OptionDataModel i in subQuestion.options ?? []) {
                      i.selected = (popupValue == i.value);
                    }
                    questionWrapper.forceNotify();
                  });
                } else {
                  groupValue = value ?? "";
                  for (OptionDataModel i in subQuestion.options ?? []) {
                    i.selected = (value == i.value);
                  }
                  questionWrapper.forceNotify();
                }
              },
            ),
          ),
        ),
        customWidth(1.w),
        Flexible(
          child: Html(
            data: option.label,
            shrinkWrap: true,
            style: FormBuilderTextStyle.htmlTextStyle(false),
            // style: AppTextStyle.normal10style,
          ),
        ),
        if (option.selected && (option.popupCode ?? '').isNotEmpty)
          Flexible(
            child: Html(
              data: ': <i>${option.value}</i>',
              shrinkWrap: true,
              style: FormBuilderTextStyle.htmlTextStyle(false),
              // style: AppTextStyle.normal10style,
            ),
          ),
      ],
    );
  }
}

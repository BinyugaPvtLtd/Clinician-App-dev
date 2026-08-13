import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/responsive.dart';
import '../../../popup/popup_handler.dart';

class StaticDropdownWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final bool forceScrollAxis;

  const StaticDropdownWidget({super.key, required this.subQuestionWrapper,  this.forceScrollAxis=false});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal && (!isMobile || forceScrollAxis==true)
              ? Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: getTitleWidget(context, subQuestion),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
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
                  children: [
                    Row(
                      children: [
                        if(subQuestion.title.isNotEmpty)
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (subQuestion.code != null && subQuestion.code!.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      PopupHandler.showQuestionCodePopup(
                          context, subQuestion.code!);
                    },
                    child: Text(
                      "(${subQuestion.code})",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xffFF0000),
                          fontWeight: FontWeight.bold),
                    )),
              )
            : const SizedBox(
                width: 1,
              ),
        Expanded(
          child: Html(
            data: subQuestion.title,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  List<Widget> getOptionsWidgets(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    return [
      SizedBox(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: StaticDropdownElement(
                subQuestionWrapper: subQuestionWrapper,
                onChanged: (newOption) {
                  subQuestionWrapper.setOption(newOption!.index);
                },
              ),
            ),
          ],
        ),
      )
    ];
  }
}

class StaticDropdownElement extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final Function(StaticOptionModel? option) onChanged;

  const StaticDropdownElement(
      {super.key, required this.subQuestionWrapper, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return CustomDropdown<StaticOptionModel>(
      items: subQuestionWrapper.subQuestion.options,
      onChanged: (newItem) {
        if (newItem != null &&
            newItem !=
                subQuestion.options
                    .firstWhereOrNull((option) => option.selected)) {
          onChanged(newItem);
        }
      },
      initialItem:
          subQuestion.options.firstWhereOrNull((option) => option.selected),
      hintText: '(Select)',
      listItemBuilder: (context, option, _, __) {
        return Text(
          option.label,
          style: FormBuilderTextStyle.normal10style,
        );
      },
      headerBuilder: (context, option, ___) {
        return Text(
          option.label,
          style: FormBuilderTextStyle.normal10style
              /*.copyWith(fontWeight: FontWeight.bold)*/,
        );
      },
      decoration: CustomDropdownDecoration(
          closedBorder: Border.all(color: AppColors.textFieldBorderColor),
          closedBorderRadius: BorderRadius.circular(5.r),
          hintStyle: FormBuilderTextStyle.normal10style),
      closedHeaderPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: Responsive.isDesktop(context) ? 5 : 10,
      ),
    );
  }
}

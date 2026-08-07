import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/responsive.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../ui_components/app_hover_tooltip.dart';
import '../../../dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import '../../../popup/popup_handler.dart';
import '../../data/static_option_model.dart';
import '../../data/static_question_model.dart';

class StaticCheckBoxWidget extends StatelessWidget {
  const StaticCheckBoxWidget({
    super.key,
    required this.subQuestionWrapper,
    this.enabled = true,
    this.columnCount,
    this.firstElementWidthMultiplier = 1,
  });

  final SubQuestionWrapper subQuestionWrapper;
  final bool enabled;

  //To Handle the gird
  final int? columnCount;
  final double firstElementWidthMultiplier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          // return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal
          return false
              ? Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (subQuestion.title.isNotEmpty)
                          getTitleWidget(context, subQuestion),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (subQuestion.optionsAlignment ==
                                OptionsAlignment.horizontal)
                              getWrappedOptionsWidget(
                                  context, subQuestionWrapper)
                            else
                              ...getWidget(context,
                                  subQuestionWrapper: subQuestionWrapper),
                          ],
                        ),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    )
                  : Row(
                      children: [
                        if (subQuestion.title.isNotEmpty)
                          Expanded(
                            flex: 4,
                            child: getTitleWidget(context, subQuestion),
                          ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (subQuestion.optionsAlignment ==
                                  OptionsAlignment.horizontal)
                                getWrappedOptionsWidget(
                                    context, subQuestionWrapper)
                              else
                                ...getWidget(context,
                                    subQuestionWrapper: subQuestionWrapper),
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
                        if (subQuestion.title.isNotEmpty)
                          Expanded(child: getTitleWidget(context, subQuestion)),
                        if (subQuestion.flags.isNotEmpty)
                          FlagOverlayWidget(flagList: subQuestion.flags)
                      ],
                    ),
                    if (subQuestion.optionsAlignment ==
                        OptionsAlignment.horizontal)
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: getWrappedOptionsWidget(
                              context, subQuestionWrapper))
                    else
                      ...getWidget(context,
                          subQuestionWrapper: subQuestionWrapper),
                  ],
                );
        },
      ),
    );
  }

  Widget getWrappedOptionsWidget(
    BuildContext context,
    SubQuestionWrapper subQuestionWrapper,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      final finalColumnCount =
          calculateColumnCount(subQuestionWrapper, context);

      // Regular Item Width
      double baseItemWidth = (constraints.maxWidth / finalColumnCount);
      //If First item is wider then calculate it's width
      double firstItemWidth = baseItemWidth * firstElementWidthMultiplier;
      //Calculate remaining width
      final availableItemWidth = constraints.maxWidth - firstItemWidth;
      //Recalculate width for remaining items
      final otherItemWidth = availableItemWidth / (finalColumnCount - 1);

      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ...subQuestionWrapper.subQuestion.options.map(
            (option) {
              return SizedBox(
                width:
                    subQuestionWrapper.subQuestion.options.indexOf(option) == 0
                        ? firstItemWidth
                        : otherItemWidth,
                child: _getCheckbox(subQuestionWrapper, option),
              );
            },
          )
        ],
      );
    });
    return Wrap(
      children: [
        ...getWidget(context, subQuestionWrapper: subQuestionWrapper),
      ],
    );
  }

  int calculateColumnCount(
      SubQuestionWrapper subQuestionWrapper, BuildContext context) {
    /// If there is only one option then column count will be 1.
    /// If we have explicitly passed column count from widget then that will be used.
    /// Else based on mobile and desktop; it wil lbe used.
    return subQuestionWrapper.subQuestion.options.length <= 1
        ? 1
        : (columnCount ?? (Responsive.isMobile(context) ? 2 : 4));
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
                width: 0,
              ),
        Flexible(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  List<Widget> getWidget(BuildContext context,
      {required SubQuestionWrapper subQuestionWrapper}) {
    return subQuestionWrapper.subQuestion.options
        .map((option) => _getCheckbox(subQuestionWrapper, option))
        .toList();
  }

  DynamicCheckboxElement _getCheckbox(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
    return DynamicCheckboxElement(
      label: option.label,
      value: option.value,
      selected: option.selected,
      onTap: (bool value, index) {
        subQuestionWrapper.toggleOption(index);
      },
      index: option.index,
      optionsAlignment: OptionsAlignment.horizontal,
      popupCode: option.popupCode,
      onPopupValueChange: (popupValue) {
        subQuestionWrapper.addNotesToOption(option.index, popupValue);
      },
      enabled: enabled,
    );
  }
}

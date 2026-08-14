import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/static_decoration.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/popup/popup_handler.dart';
import '../../../widgets/static/data/static_question_model.dart';

class Question10012005 extends StatelessWidget {
  const Question10012005({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (context, que, ch) {
          var subQuestion = que.subQuestionWrappers;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HorizontalTextFields2(
                  subQuestionWrapper1: subQuestion[0],
                  subQuestionWrapper2: subQuestion[1],
                  option1Index: 0,
                  option2Index: 1),
              // Row(
              //   children: [
              //     Expanded(
              //         child: StaticTextFieldWidget(
              //       subQuestionWrapper: subQuestion[0],
              //       titleFlex: 5,
              //       valueFlex: 4,
              //     )),
              //     Html(
              //       data: 'L:',
              //       shrinkWrap: true,
              //     ),
              //     SizedBox(
              //       width: !Responsive.isTablet(context) ? 100.w : 120.w,
              //       child: StaticTextFieldElement(
              //         option: que.subQuestionWrappers[1].subQuestion.options[0],
              //         subQuestion: subQuestion[1].subQuestion,
              //         onUpdate: (index, value) {
              //           subQuestion[1].updateTextFieldValue(index, value);
              //         },
              //       ),
              //     )
              //   ],
              // ),

              StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[2]),
              SizedBox(
                height: 20,
              ),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[3]),
              SizedBox(
                height: 20,
              ),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[4]),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[5]),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[6]),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[7]),
              SizedBox(
                height: 10,
              ),
              Responsive.isMobile(context)
                  ? Column(
                      children: [
                        StaticCheckBoxWidget(
                            subQuestionWrapper: que.subQuestionWrappers[8]),
                        StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[9]),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: StaticCheckBoxWidget(
                            subQuestionWrapper: que.subQuestionWrappers[8],
                            columnCount: 4,
                            firstElementWidthMultiplier: 1.5,
                          ),
                        ),
                        Expanded(
                          child: StaticTextFieldWidget(
                              subQuestionWrapper: que.subQuestionWrappers[9]),
                        )
                      ],
                    ),
              SizedBox(
                height: 10,
              ),
              StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[10]),
            ],
          );
        },
      ),
    );
  }
}

class HorizontalTextFields2 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper1;
  final SubQuestionWrapper subQuestionWrapper2;
  final int option1Index;
  final int option2Index;

  // final double labelWidth;
  // final double textfieldWidth;
  final double? maxWidth;

  // only text widget manage throw expanded

  const HorizontalTextFields2(
      {super.key,
      required this.subQuestionWrapper1,
      required this.option1Index,
      required this.option2Index,
      this.maxWidth,
      required this.subQuestionWrapper2
      // this.labelWidth = 56,
      // this.textfieldWidth = 170
      });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return SizedBox(
      width: maxWidth,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitleWidget(context, subQuestionWrapper1.subQuestion),
                Row(
                  children: [
                    Expanded(
                      child: _getTextFieldWidget(subQuestionWrapper1),
                    ),
                    sbw(15),
                    Expanded(
                      child: _getTextFieldWidget(subQuestionWrapper2),
                    ),
                  ],
                )
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child:
                      getTitleWidget(context, subQuestionWrapper1.subQuestion),
                ),
                Expanded(
                  flex: 3,
                  child: _getTextFieldWidget(subQuestionWrapper1),
                ),
                sbw(15),

                Expanded(
                  flex: 3,
                  child: _getTextFieldWidget(subQuestionWrapper2),
                ),
                // sbw( Responsive.isTablet(context)?25: 45),
                // _getLabel(subQuestionWrapper, 1),
                // sbw(8),
                //   ChangeNotifierProvider<SubQuestionWrapper>.value(
                //   value: subQuestionWrapper2,
                //   child: Consumer<SubQuestionWrapper>(builder:
                //       (BuildContext context,
                //           SubQuestionWrapper subQuestionWrapper,
                //           Widget? child) {
                //     return _getTextField(subQuestionWrapper, 0);
                //   }),
                // ),
                // _getTextField(subQuestionWrapper, 1),
              ],
            ),
    );
  }

  Widget _getTextFieldWidget(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLabel(subQuestionWrapper, 0),
              sbw(8),
              _getTextField(subQuestionWrapper, 0),
            ],
          );
        },
      ),
    );
  }

  Widget _getLabel(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final label = subQuestionWrapper.subQuestion.options[optionIndex].label;
    return SizedBox(
      // width: labelWidth,
      child: Text(
        label,
        style: FormBuilderTextStyle.normal10style,
      ),

      // TitleDescription(
      //   title: label,
      // ),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Expanded(
      // width: textfieldWidth,
      child: StaticTextFieldElement(
        option: option,
        subQuestion: subQuestionWrapper.subQuestion,
        onUpdate: (optionIndex, value) {
          subQuestionWrapper.updateTextFieldValue(optionIndex, value);
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
        Flexible(
          child: Html(
            data: subQuestion.title,
            shrinkWrap: true,
            style: FormBuilderTextStyle.enableDisableHtmlStyle(true),
          ),
        ),
      ],
    );
  }
}

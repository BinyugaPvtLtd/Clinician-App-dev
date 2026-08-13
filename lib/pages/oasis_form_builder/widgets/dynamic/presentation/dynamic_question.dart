import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dyamic_upload_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_action_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_button_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_checkbox_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_date_field_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_option_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_radio_section.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_text_field_section.dart';

import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/enums.dart';
import '../../../constants/responsive.dart';
import '../../../provider/question_wapper_provider.dart';


class DynamicQuestion extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  final Color? highlightColor;

  const DynamicQuestion({
    super.key,
    required this.questionWrapper,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    final question = questionWrapper.question;
    final type = question.answerType!;
    //If It is not desktop then don't show option along side title.
    bool isScrollAxisHorizontal =
        !isDesktop ? false : question.scrollAxis == OptionsAlignment.horizontal;
    if (type == AnswerType.checkbox || type == AnswerType.radio) {
      isScrollAxisHorizontal = false;
    }

    return (!isDesktop &&
            type == AnswerType.info &&
            (question.title?.trim().isEmpty ?? true) &&
            (question.description?.trim().isEmpty ?? true))
        ? SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w, vertical: isDesktop ? 10.h : 0),
            child: Column(
              children: [
                Material(
                  borderRadius: isDesktop
                      ? BorderRadius.all(Radius.circular(12.r))
                      : null,
                  elevation: !question.drawBox! ||
                          type == AnswerType.info ||
                          type == AnswerType.actionButton ||
                          !isDesktop
                      ? 0
                      : 4,
                  child: ChangeNotifierProvider<QuestionWrapper>.value(
                    value: questionWrapper,
                    child: Selector<QuestionWrapper, bool>(
                      builder: (BuildContext context, bool isAnswered,
                          Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: highlightColor ??
                                (isAnswered
                                    ? AppColors.cardBackGColor
                                    : Colors.white),
                            borderRadius: isDesktop
                                ? BorderRadius.all(Radius.circular(12.r))
                                : null,
                          ),
                          padding: question.drawBox!
                              ? EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: isDesktop ? 10.h : 20.h)
                              : EdgeInsets.zero,
                          child: child,
                        );
                      },
                      selector: (BuildContext context,
                              QuestionWrapper questionWrapper) =>
                          questionWrapper.isAnswered,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TitleDescription(
                            code: question.code,
                            title: question.title,
                            description: question.description,
                            flags: question.flags,
                            options: isScrollAxisHorizontal
                                ? getWidgetByAnswerType(type)
                                : null,
                            questionLookupEnabled: question.questionLookupEnabled??false,
                          ),
                          if (!isScrollAxisHorizontal)
                            getWidgetByAnswerType(type),
                          if (question.notice.isNotEmpty)
                            Html(
                              data: question.notice,
                              style: FormBuilderTextStyle.htmlTextStyle(false),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                if (!isDesktop)
                  Divider(
                    height: 2.h,
                    thickness: 2,
                    color: AppColors.dividerColor,
                  )
              ],
            ),
          );
  }

  // Widget getQuestionTitleBar(BuildContext context, QuestionDataModel question,
  //     bool isScrollAxisHorizontal, AnswerType type) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       if (question.code != null && question.code!.isNotEmpty)
  //         InkWell(
  //             hoverColor: Colors.transparent,
  //             splashColor: Colors.transparent,
  //             highlightColor: Colors.transparent,
  //             onTap: () {
  //               PopupHandler.showQuestionCodePopup(context, question.code!);
  //             },
  //             child: StyledText(
  //               text: "(${question.code})",
  //               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                   color: const Color(0xffFF0000),
  //                   fontWeight: FontWeight.bold),
  //               tags: {
  //                 'u': StyledTextTag(
  //                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                         decoration: TextDecoration.underline,
  //                         color: const Color(0xffFF0000),
  //                         fontWeight: FontWeight.bold)),
  //               },
  //             )),
  //       Expanded(
  //         child: Row(
  //           children: [
  //             if (question.title != null && question.title!.isNotEmpty)
  //               Expanded(
  //                 child: Html(
  //                   data: question.title,
  //                   shrinkWrap:
  //                       question.answerType == AnswerType.info ? false : true,
  //                   style: FormBuilderTextStyle.htmlTextStyle(false),
  //                 ),
  //               ),
  //             if (isScrollAxisHorizontal)
  //               Expanded(child: getWidgetByAnswerType(type)),
  //             if (question.flags.isNotEmpty)
  //               FlagOverlayWidget(flagList: question.flags)
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget getWidgetByAnswerType(AnswerType type) {
    return type == AnswerType.option
        ? DynamicOptionSection(
            questionWrapper: questionWrapper,
          )
        : type == AnswerType.button
            ? DynamicButtonSection(
                questionWrapper: questionWrapper,
              )
            : type == AnswerType.checkbox
                ? DynamicCheckBoxSection(
                    questionWrapper: questionWrapper,
                  )
                : type == AnswerType.radio
                    ? DynamicRadioSection(
                        questionWrapper: questionWrapper,
                      )
                    : type == AnswerType.textBox || type == AnswerType.textArea
                        ? DynamicTextFieldSection(
                            questionWrapper: questionWrapper,
                          )
                        : type == AnswerType.date
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: DynamicDateFieldSection(
                                  questionWrapper: questionWrapper,
                                ),
                              )
                            : type == AnswerType.actionButton
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: DynamicActionButton(
                                      questionWrapper: questionWrapper,
                                    ),
                                  )
                                : type == AnswerType.upload
                                    ? DynamicUploadSection(
                                        questionWrapper: questionWrapper)
                                    : const SizedBox(
                                        height: 1,
                                      );
  }
}

// Responsive(
//   tablet: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       if (question.title != null && question.title!.isNotEmpty)
//         Html(
//           data: question.title,
//           shrinkWrap:
//               question.answerType == AnswerType.info ? false : true,
//           style: FormBuilderTextStyle.htmlTextStyle(false),
//         ),
//       if (isScrollAxisHorizontal) getWidgetByAnswerType(type),
//       if (question.flags.isNotEmpty)
//         FlagOverlayWidget(flagList: question.flags)
//     ],
//   ),
//   desktop: Expanded(
//     child: Row(
//       children: [
//         if (question.title != null && question.title!.isNotEmpty)
//           Expanded(
//             child: Html(
//               data: question.title,
//               shrinkWrap:
//                   question.answerType == AnswerType.info ? false : true,
//               style: FormBuilderTextStyle.htmlTextStyle(false),
//             ),
//           ),
//         if (isScrollAxisHorizontal)
//           Expanded(child: getWidgetByAnswerType(type)),
//         if (question.flags.isNotEmpty)
//           FlagOverlayWidget(flagList: question.flags)
//       ],
//     ),
//   ),
// )
// // Expanded(
//   child: Html(
//     data: question.title,
//   ),
// ),

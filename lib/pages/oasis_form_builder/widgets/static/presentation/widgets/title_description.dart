import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_hover_tooltip.dart';

import '../../../popup/popup_handler.dart';

class TitleDescription extends StatelessWidget {
  final String? code;
  final String? title;
  final String? description;
  final List<String>? flags;
  final Widget? options;
  final String textAlign;
  final bool questionLookupEnabled;

  const TitleDescription(
      {super.key,
      this.code,
      this.title,
      this.description,
      this.flags,
      this.options,
      this.textAlign = 'justify',
      this.questionLookupEnabled = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (code != null && code!.isNotEmpty)
                    QuestionMarkupCode(code:code!),
                  if (title != null && title!.isNotEmpty)
                    Expanded(child: _getTitleWidget(isMobile)),
                ],
              ),
              if (flags != null && flags!.isNotEmpty) _getFlagWidget(),
              if (description != null && description!.isNotEmpty)
                _getDescriptionWidget(isMobile),
              if (options != null) options!
            ],
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (code != null && code!.isNotEmpty)
                    QuestionMarkupCode(code:code!),
                  if (title != null &&
                      title!.isNotEmpty &&
                      !questionLookupEnabled)
                    Expanded(
                      child: _getTitleWidget(isMobile),
                    ),
                  if (title != null &&
                      title!.isNotEmpty &&
                      questionLookupEnabled)
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: _getTitleWidget(isMobile),
                          ),
                          InkWell(
                            onTap: () async {
                              PopupHandler.questionLookupDialogForSelfCare(
                                  context);
                            },
                            child: Image.asset(
                              'assets/png/question_lookup.png',
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  if (options != null) Expanded(child: options!),
                  if (flags != null) _getFlagWidget(),
                ],
              ),
              if (description != null && description!.isNotEmpty)
                _getDescriptionWidget(isMobile),
            ],
          );
  }

  Widget _getTitleWidget(bool isMobile) {
    return Html(
      data:
          '${isMobile ? "<div style='text-align:$textAlign'>" : ""}$title${isMobile ? "</div>" : ""}',
      style: FormBuilderTextStyle.htmlTextStyle(false),
      shrinkWrap: true,
    );
  }

  Widget _getDescriptionWidget(bool isMobile) {
    return Html(
      data:
          '${isMobile ? "<div style='text-align:$textAlign'>" : ""}$description${isMobile ? "</div>" : ""}',
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getFlagWidget() {
    return FlagOverlayWidget(flagList: flags!);
  }
}


class QuestionMarkupCode extends StatelessWidget {
  final String code;
  const QuestionMarkupCode({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          PopupHandler.showQuestionCodePopup(context, code);
        },
        child: Text(
          "($code)",
          style: FormBuilderTextStyle.bold10Style.copyWith(
              color: const Color(0xffFF0000),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}




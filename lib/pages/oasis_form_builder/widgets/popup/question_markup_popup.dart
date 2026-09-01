// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/helpers/parse_html_to_plain_text.dart';
import 'package:clinician_app/pages/oasis_form_builder/model/question_markup_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';


class QuestionMarkupPopup extends StatefulWidget {
  final String code;

  const QuestionMarkupPopup({super.key, required this.code});

  @override
  State<QuestionMarkupPopup> createState() => _QuestionMarkupPopupState();
}

class _QuestionMarkupPopupState extends State<QuestionMarkupPopup> {
  QuestionMarkup? questionMarkup;
  bool isLoading = true;
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  ValueNotifier speckNotifier = ValueNotifier(true);

  @override
  void initState() {
    flutterTts.setStartHandler(() {
      isPlaying = true;
      speckNotifier.notifyListeners();
    });

    flutterTts.setCompletionHandler(() {
      isPlaying = false;
      speckNotifier.notifyListeners();
    });

    flutterTts.setCancelHandler(() {
      isPlaying = false;
      speckNotifier.notifyListeners();
    });

    flutterTts.setPauseHandler(() {
      isPlaying = false;
      speckNotifier.notifyListeners();
    });

    flutterTts.setContinueHandler(() {
      isPlaying = true;
      speckNotifier.notifyListeners();
    });

    Future.delayed(Duration.zero).then(
      (_) async {
        await FormBuilderManager()
            .getQuestionMarkupByCode(
          context,
          questionCode: widget.code,
        )
            .then((result) {
          setState(() {
            questionMarkup = result;
            isLoading = false;
          });
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _speakOrPause() async {
    if (isPlaying) {
      await flutterTts.stop(); // stop speaking
      setState(() => isPlaying = false);
      return;
    }

    String plainText = 'CODE ${questionMarkup?.code} \n\n';
    plainText += htmlToSpeechText(questionMarkup!.data!);
    plainText.replaceAll('.', '. ');
    if (plainText.isEmpty) return;

    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(1);
    await flutterTts.setPitch(1.0);

    await flutterTts.speak(plainText);
  }

  @override
  Widget build(BuildContext context) {
    return PopupTemplate(
      onClear: () async {
        try {
          await flutterTts.stop();
        } catch (e) {}
        Navigator.pop(context);
      },
      volumWidget: isLoading?SizedBox():ValueListenableBuilder(
          valueListenable: speckNotifier,
          builder: (context, value, child) {
            return Positioned(
              right: 20,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: _speakOrPause,
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.volume_up_outlined,
                  color: AppColors.primaryAppColor,
                  size: 18,
                ),
              ),
            );
          }),
      body: isLoading
          ? [
              sbh(20),
              const CircularProgressIndicator(),
              sbh(20),
            ]
          : questionMarkup == null
              ? [
                  sbh(20),
                  Text(
                    "Details Not Found!",
                    style: FormBuilderTextStyle.normal10style,
                    textAlign: TextAlign.center,
                  ),
                  sbh(20),
                ]
              : [
                  _getBoldTitle(questionMarkup!.code),
                  if (questionMarkup!.data != null)
                    Html(
                      data: questionMarkup!.data!,
                      style: FormBuilderTextStyle.htmlTextStyle(false),
                    ),
                ],
      bottomButtons: null,
      title: "Details",
      maxWidth: 600,
    );
  }

  Widget _getTitleValueTile(String title, String value) {
    return Column(
      children: [
        _getBoldTitle(title),
      ],
    );
  }

  Widget _getBoldTitle(String title) {
    return Html(
      data: '<b>$title</b>',
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }
}

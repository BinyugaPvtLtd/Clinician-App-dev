import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:provider/provider.dart';

import '../../../../provider/question_wapper_provider.dart';

class Question651109066 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question651109066({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryButton(
                label: questionWrapper.question.options!.first.label,
                onTap: () {
                  PopupHandler.showPopup(context, 'TEXTFIELDPOPUP', (value) {
                    questionWrapper.updateTextFieldValue(0, value);
                  });
                },
                width: 150.w,
              ),
              sbh(10),
              if (questionWrapper.question.options!.first.value.isNotEmpty)
                Text(
                  questionWrapper.question.options!.first.value,
                  style: FormBuilderTextStyle.normal10style,
                ),
            ],
          );
        },
      ),
    );
  }
}

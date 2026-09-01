import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_upload_element.dart';
import 'package:provider/provider.dart';

class DynamicUploadSection extends StatelessWidget {
  const DynamicUploadSection({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          print(questionWrapper.question.options!.first.toJson());
          final question = questionWrapper.question;
          final options = question.options;
          final optionsAlignment =
              question.optionsAlignment ?? OptionsAlignment.vertical;
          return optionsAlignment == OptionsAlignment.horizontal
              ? Wrap(
                  children: options!.map((option) {
                    return DynamicUploadElement(
                      option: option,
                      questionWrapper: questionWrapper,
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: options!.map((option) {
                    return DynamicUploadElement(
                      option: option,
                      questionWrapper: questionWrapper,
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}

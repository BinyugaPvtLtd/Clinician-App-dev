import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_option_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/question_wapper_provider.dart';

class Question10003007 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10003007({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          final subQuestion1 =
              questionWrapper.subQuestionWrappers[0].subQuestion;
          final subQue1Option = subQuestion1.options.first;
          final subQuestion2 =
              questionWrapper.subQuestionWrappers[1].subQuestion;
          final subQue2Option = subQuestion2.options.first;
          return Column(
            children: [
              Responsive.isMobile(context)
                  ? Column(
                      children: [
                        StaticDateFieldElement(
                          onDateChange: (newDate) {
                            questionWrapper.subQuestionWrappers[0]
                                .updateTextFieldValue(subQue1Option.index,
                                    newDate.toIso8601String());
                            subQue2Option.selected = false;
                            questionWrapper.subQuestionWrappers[1]
                                .forceNotify();
                            questionWrapper.forceNotify();
                          },
                          initialDate: DateTime.tryParse(
                              subQuestion1.options.first.value),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "   →Go to M0110 , if date entered",
                            style: FormBuilderTextStyle.normal10style
                                .copyWith(fontStyle: FontStyle.italic),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        sbw(2),
                        Expanded(
                          child: StaticDateFieldElement(
                            onDateChange: (newDate) {
                              questionWrapper.subQuestionWrappers[0]
                                  .updateTextFieldValue(subQue1Option.index,
                                      newDate.toIso8601String());
                              subQue2Option.selected = false;
                              questionWrapper.subQuestionWrappers[1]
                                  .forceNotify();
                              questionWrapper.forceNotify();
                            },
                            initialDate: DateTime.tryParse(
                                subQuestion1.options.first.value),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "   →Go to M0110 , if date entered",
                            style: FormBuilderTextStyle.normal10style
                                .copyWith(fontStyle: FontStyle.italic),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DynamicOptionElement(
                        label: subQue2Option.label,
                        value: subQue2Option.label,
                        selected: subQue2Option.selected,
                        onTap: (_, __) {
                          questionWrapper.subQuestionWrappers[0]
                              .clearTextFieldAt(subQue1Option.index);
                          questionWrapper.subQuestionWrappers[1]
                              .toggleOption(subQue2Option.index);
                          questionWrapper.forceNotify();
                        },
                        index: subQue2Option.index,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

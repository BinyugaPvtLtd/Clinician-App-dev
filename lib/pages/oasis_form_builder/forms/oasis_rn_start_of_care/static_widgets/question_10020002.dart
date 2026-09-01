import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/responsive.dart';

class Question10020002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10020002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile  =Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers.first,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              if(!isMobile)Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Enter Number',
                    style: FormBuilderTextStyle.normal10style
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )else
                const SizedBox(height: 10,),
              ...subQuestion.options.map((option) {
                final prefix = [
                  "<b>A1.</b>",
                  "<b>B1.</b>",
                  "<b>C1.</b>",
                  "<b>D1.</b>",
                  "<b>E1.</b>",
                  "<b>F1.</b>",
                ];
                return _getRow(context, prefix[option.index], option.label,
                    option, subQuestionWrapper, isMobile);
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow(BuildContext context, String prefix, String title,
      StaticOptionModel option, SubQuestionWrapper subQuestionWrapper, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: isMobile?null:Border.all(color: AppColors.greyColor),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: isMobile
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          TitleDescription(
                            title: prefix,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: TitleDescription(
                        title: title,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 9,
                      child: StaticTextFieldElement(
                        option: option,
                        subQuestion: subQuestionWrapper.subQuestion,
                        onUpdate: (index, value) {
                          subQuestionWrapper.updateTextFieldValue(index, value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TitleDescription(
                        title: prefix,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: TitleDescription(
                    title: title,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: StaticTextFieldElement(
                    option: option,
                    subQuestion: subQuestionWrapper.subQuestion,
                    onUpdate: (index, value) {
                      subQuestionWrapper.updateTextFieldValue(index, value);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

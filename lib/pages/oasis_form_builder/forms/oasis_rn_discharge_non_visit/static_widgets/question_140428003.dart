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

class Question140428003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question140428003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers.first,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Column(
            children: [
              if (!isMobile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Enter Number',
                      style: FormBuilderTextStyle.normal10style
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ...subQuestion.options.map((option) {
                final prefix = [
                  "A1.",
                  "A2.",
                  "B1.",
                  "B2.",
                  "C1.",
                  "C2.",
                  "D1.",
                  "D2.",
                  "E1.",
                  "E2.",
                  "F1.",
                  "F2.",
                ];
                final notice = [
                  "<b>Number of Stage 2 pressure ulcers</b><i> →If 0 - Go to M1311B1, Stage 3</i>",
                  null,
                  "<b>Number of Stage 3 pressure ulcers </b><i> →If 0 - Go to M1311C1, Stage 4</i>",
                  null,
                  "<b>Number of Stage 4 pressure ulcers</b><i> →If 0 - Go to M1311D1, Unstageable: Non-removable dressing/device</i>",
                  null,
                  "<b>Number of unstageable pressure ulcers/injuries due to non-removable dressing/device</b><i> →If 0 - Go to M1311E1, Unstageable: Slough and/or eschar</i>",
                  null,
                  "<b>Number of unstageable pressure ulcers/injuries due to coverage of wound bed by slough and/or eschar</b><i> →If 0 - Go to M1311F1, Unstageable: Deep tissue injury</i>",
                  null,
                  "<b>Number of unstageable pressure injuries presenting as deep tissue injury </b><i> →If 0 - Go to M1324</i>",
                  null,
                ];
                return Column(
                  children: [
                    _getRow(prefix[option.index], option.label, option,
                        subQuestionWrapper, notice[option.index], isMobile),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow(String prefix, String title, StaticOptionModel option,
      SubQuestionWrapper subQuestionWrapper, String? notice, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: isMobile ? null : Border.all(color: AppColors.greyColor),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _getPrefixWidget(prefix),
                ),
                _getTitleWidget(title),
                Padding(padding:const EdgeInsets.symmetric(horizontal: 8)
                ,child: _getTextFieldWidget(subQuestionWrapper, option),),
                if (notice != null) _getNoticeWidget(notice),
              ],
            )
          : Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        _getPrefixWidget(prefix),
                      ],
                    ),
                    Expanded(
                      flex: 10,
                      child: _getTitleWidget(title),
                    ),
                    Expanded(
                      flex: 6,
                      child: _getTextFieldWidget(subQuestionWrapper, option),
                    ),
                  ],
                ),
                if (notice != null) _getNoticeWidget(notice)
              ],
            ),
    );
  }

  Widget _getPrefixWidget(String prefix) {
    return Text(prefix, style: FormBuilderTextStyle.bold10Style);
  }

  Widget _getTitleWidget(String title) {
    return TitleDescription(
      title: title,
    );
  }

  Widget _getTextFieldWidget(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (index, value) {
        subQuestionWrapper.updateTextFieldValue(index, value);
      },
    );
  }

  Widget _getNoticeWidget(String notice) {
    return TitleDescription(
      title: notice,
    );
  }
}

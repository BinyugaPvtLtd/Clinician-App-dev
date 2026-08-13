import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:provider/provider.dart';

import '../../../../constants/responsive.dart';
import '../../../../provider/question_wapper_provider.dart';

class DynamicTextFieldSection extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const DynamicTextFieldSection({
    super.key,
    required this.questionWrapper,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          final question = questionWrapper.question;
          final options = question.options;
          return Column(
            children: options!.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(option.label.isNotEmpty)
                      Flexible(
                        child: Html(
                          data: option.label,
                          style: FormBuilderTextStyle.htmlTextStyle(false),
                        ),
                      ),
                      TextField(
                        controller: option.textEditingController,
                        maxLines: question.answerType == AnswerType.textArea
                            ? 4
                            : null,
                        onChanged: (value) {
                          updateTextFieldValue(
                              option.index, value, questionWrapper);
                        },
                        onTapOutside: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical:
                                  Responsive.isDesktop(context) ? 10 : 15),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                                color: AppColors.textFieldBorderColor,
                                width: 1),
                          ),
                          // floatingLabelStyle: floatingLabelStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                  color: AppColors.textFieldBorderColor,
                                  width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                  color: AppColors.textFieldBorderColor,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                color: AppColors.redColor,
                              )),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                  color: AppColors.textFieldBorderColor,
                                  width: 0)),
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: FormBuilderTextStyle.normal10style
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.hintGreyColor),
                          hintText: "Enter Text",
                          enabled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void updateTextFieldValue(
      int optionIndex, String value, QuestionWrapper wrapper) {
    wrapper.updateTextFieldValue(optionIndex, value);
  }
}

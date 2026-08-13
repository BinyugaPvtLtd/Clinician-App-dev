import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_style.dart';
import '../../../widgets/static/data/static_question_model.dart';

class Question10033004_2 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10033004_2({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return isMobile?
              Column(
                children: [
                  TitleDescription(
                    title: subQuestion.title,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _getTextFiledWidget(subQuestionWrapper, subQuestion),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      _getClearTextfieldButton(subQuestionWrapper),
                    ],
                  )
                ],
              ):Row(
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                  title: subQuestion.title,
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: _getTextFiledWidget(
                          subQuestionWrapper, subQuestion),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            SizedBox(
                                width: 80,
                                child: _getClearTextfieldButton(
                                    subQuestionWrapper)),
                          ],
                        )),
                  ],
                )
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getTextFiledWidget(SubQuestionWrapper subQuestionWrapper, StaticQuestionModel subQuestion)
  {
    return StaticTextFieldElement(
      option: subQuestion.options.first,
      subQuestion: subQuestion,
      onUpdate: (optionIndex, value) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, value);
      },
    );
  }

  Widget _getClearTextfieldButton(SubQuestionWrapper subQuestionWrapper)
  {
    return InkWell(
      onTap: () {
        subQuestionWrapper.updateTextFieldValue(0, "");
        subQuestionWrapper.clearTextFieldAt(0);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: BoxConstraints(minWidth: 100),
        decoration: BoxDecoration(
            color: AppColors.primaryAppLightColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(25))
            ]),
        padding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Clear",
              style: FormBuilderTextStyle.bold14style
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

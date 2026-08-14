import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

class Question601096003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question601096003({
    super.key,
    required this.questionWrapper,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
          text: "Your home health care is going to change. ",
          children: [
            TextSpan(
                text: "Starting on  ",
                style: FormBuilderTextStyle.normal10style),
            WidgetSpan(
              alignment: ui.PlaceholderAlignment.middle,
              child: SizedBox(
                width: Responsive.isMobile(context)?double.infinity:100.w,
                child: ChangeNotifierProvider<QuestionWrapper>.value(
                  value: questionWrapper,
                  child: Consumer<QuestionWrapper>(
                    builder:
                        (BuildContext context, questionWrapper, Widget? child) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: (Responsive.isMobile(context)?8:0)),
                        child: StaticDateFieldElement(
                          onDateChange: (newDate) {
                            questionWrapper.updateTextFieldValue(
                                0, newDate.toIso8601String());
                          },
                          initialDate: DateTime.tryParse(
                              questionWrapper.question.options!.first.value),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            TextSpan(
                text: '  ' + questionWrapper.question.notice,
                style: FormBuilderTextStyle.normal10style),
          ],
          style: FormBuilderTextStyle.bold10Style),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart' show Responsive;

class Question10006001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10006001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers.first,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Responsive.isMobile(context)
              ? Column(
                  children: [
                    Html(
                      data:
                          '<b>Type of Assistance</b> - <b>Supervision and safety</b> (for example, due to cognitive impairment)',
                      style: FormBuilderTextStyle.htmlTextStyle(false),
                    ),
                    buildMobileRow(subQuestionWrapper: subQuestionWrapper, optionIndex: 0, title: 'No assistance needed-patient is independent or does not have needs in this area'),
                    buildMobileRow(subQuestionWrapper: subQuestionWrapper, optionIndex: 1, title: 'Non-agency caregiver(s) currently provide assistance'),
                    buildMobileRow(subQuestionWrapper: subQuestionWrapper, optionIndex: 2, title: 'Non-agency caregiver(s) need training/supportive services to provide assistance'),
                    buildMobileRow(subQuestionWrapper: subQuestionWrapper, optionIndex: 3, title: 'Assistance needed, but non-agency caregiver(s) available')
                    ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        _getTitle('<b>Type of Assistance</b>'),
                        _getTitle(
                            '<b>No assistance needed-patient is independent or does not have needs in this area</b>'),
                        _getTitle(
                            '<b>Non-agency caregiver(s) currently provide assistance</b>'),
                        _getTitle(
                            '<b>Non-agency caregiver(s) need training/supportive services to provide assistance</b>'),
                        _getTitle(
                            '<b>Assistance needed, but non-agency caregiver(s) available</b>'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      children: [
                        _getTitle(
                            '<b>Supervision and safety</b> (for example, due to cognitive impairment)'),
                        _getRadio(subQuestionWrapper, 0),
                        _getRadio(subQuestionWrapper, 1),
                        _getRadio(subQuestionWrapper, 2),
                        _getRadio(subQuestionWrapper, 3),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget buildMobileRow(
      {required SubQuestionWrapper subQuestionWrapper,
      required int optionIndex,
      required String title}) {
    return Row(
      children: [
        StaticRadioElement(
          subQueWrapper: subQuestionWrapper,
          optionIndex: optionIndex,
        ),
        Expanded(
          child: Html(
            data: title,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  Widget _getRadio(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return Expanded(
        child: StaticRadioElement(
      subQueWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
    ));
  }

  Widget _getTitle(String title) {
    return Expanded(
      child: Html(
        data: title,
        style: FormBuilderTextStyle.htmlTextStyle(false),
      ),
    );
  }
}

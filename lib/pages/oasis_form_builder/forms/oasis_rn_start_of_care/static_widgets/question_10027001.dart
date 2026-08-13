import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';

class Question10027001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  final String title1;
  final String title2;

  const Question10027001(
      {super.key,
      required this.questionWrapper,
      required this.title1,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    final wrappers = questionWrapper.subQuestionWrappers;
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Responsive.isMobile(context)?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getBolText(
                '0 - No\n1 - Yes\n - - Not assessed / No information'),
            _getDivider(),
            Row(
              children: [
                Expanded(child: _getBolText(title1, textAlign: TextAlign.center),),
                SizedBox(
                  width: 50.w,
                ),
                Expanded(child: _getBolText(title1, textAlign: TextAlign.center),),
              ],
            )
          ],
        ): Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _getBolText(
                      '0 - No\n1 - Yes\n - - Not assessed / No information'),
                  Spacer(),
                  Flexible(
                      child: _getBolText(title1, textAlign: TextAlign.center)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _getBolText(title2, textAlign: TextAlign.center),
                  SizedBox(
                    width: 50.w,
                  )
                ],
              ),
            ),
          ],
        ),
        _getDivider(),
        Row(
          children: [
            Expanded(
              child: _getBolText("Cancer Treatments"),
            ),
            SizedBox(
              width: 50.w,
            ),
            Expanded(
              child: _getBolText("Other"),
            ),
          ],
        ),
        _getDivider(),
        _getRow(wrappers[0], wrappers[17]),
        _getRow(wrappers[1], wrappers[18]),
        _getRow(wrappers[2], wrappers[19]),
        _getRow(wrappers[3], wrappers[20]),
        _getRow(wrappers[4], wrappers[21]),
        _getRow(null, wrappers[22], title1: '<b>Respiratory Therapies</b>'),
        _getRow(wrappers[5], wrappers[23]),
        _getRow(wrappers[6], wrappers[24]),
        _getRow(wrappers[7], wrappers[25]),
        _getRow(wrappers[8], wrappers[26]),
        _getRow(wrappers[9], wrappers[27]),
        _getRow(wrappers[10], wrappers[28]),
        _getRow(wrappers[11], wrappers[29]),
        _getRow(wrappers[12], null, title2: "<b>None of the Above</b>"),
        _getRow(wrappers[13], wrappers[30]),
        _getRow(wrappers[14], null),
        _getRow(wrappers[15], null),
        _getRow(wrappers[16], null),
      ],
    );
  }

  _getDivider() {
    return const Divider(
      height: 40,
    );
  }

  _getRow(SubQuestionWrapper? wrapper, SubQuestionWrapper? wrapper2,
      {String? title1, String? title2}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: wrapper != null
                  ? StaticDropdownWidget(subQuestionWrapper: wrapper)
                  : title1 == null
                      ? const SizedBox()
                      : TitleDescription(
                          title: title1,
                        ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Expanded(
              child: wrapper2 != null
                  ? StaticDropdownWidget(subQuestionWrapper: wrapper2)
                  : title2 == null
                      ? const SizedBox()
                      : TitleDescription(
                          title: title2,
                        ),
            ),
          ],
        ),
        _getDivider()
      ],
    );
  }

  _getBolText(String title, {TextAlign textAlign = TextAlign.left}) {
    return Text(
      title,
      style: FormBuilderTextStyle.normal10style.copyWith(
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    );
  }
}

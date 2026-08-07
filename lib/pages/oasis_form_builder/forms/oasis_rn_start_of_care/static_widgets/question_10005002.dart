import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10005002 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10005002({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers.first,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Responsive.isMobile(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      title: Html(
                        data:
                            '<b>Living Arrangement</b> - a. Patient Lives alone',
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),
                      children: [
                        _getCheckBoxMobile(
                            subQuestionWrapper, 0, "Around the clock"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 1, "Regular daytime"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 2, "Regular nighttime"),
                        _getCheckBoxMobile(subQuestionWrapper, 3,
                            "Occasional/short-term assistance"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 4, "No assistance available"),
                      ],
                    ),
                    ExpansionTile(
                      title: Html(
                        data:
                            '<b>Living Arrangement</b> - b. Patient lives with other person(s) in the home',
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),
                      children: [
                        _getCheckBoxMobile(
                            subQuestionWrapper, 5, "Around the clock"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 6, "Regular daytime"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 7, "Regular nighttime"),
                        _getCheckBoxMobile(subQuestionWrapper, 8,
                            "Occasional/short-term assistance"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 9, "No assistance available"),
                      ],
                    ),
                    ExpansionTile(
                      title: Html(
                        data:
                            '<b>Living Arrangement</b> - c. Patient lives in congregate situation (for example, assisted living, residential care home',
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),
                      children: [
                        _getCheckBoxMobile(
                            subQuestionWrapper, 10, "Around the clock"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 11, "Regular daytime"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 12, "Regular nighttime"),
                        _getCheckBoxMobile(subQuestionWrapper, 13,
                            "Occasional/short-term assistance"),
                        _getCheckBoxMobile(
                            subQuestionWrapper, 14, "No assistance available"),
                      ],
                    )
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        _getTitle('<b>Living Arrangement</b>'),
                        _getTitle('<b>Around the clock</b>'),
                        _getTitle('<b>Regular daytime</b>'),
                        _getTitle('<b>Regular nighttime</b>'),
                        _getTitle('<b>Occasional/short-term assistance</b>'),
                        _getTitle('<b>No assistance available</b>'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        _getTitle('a. Patient Lives alone'),
                        _getCheckBox(subQuestionWrapper, 0),
                        _getCheckBox(subQuestionWrapper, 1),
                        _getCheckBox(subQuestionWrapper, 2),
                        _getCheckBox(subQuestionWrapper, 3),
                        _getCheckBox(subQuestionWrapper, 4),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      children: [
                        _getTitle(
                            'b. Patient lives with other person(s) in the home'),
                        _getCheckBox(subQuestionWrapper, 5),
                        _getCheckBox(subQuestionWrapper, 6),
                        _getCheckBox(subQuestionWrapper, 7),
                        _getCheckBox(subQuestionWrapper, 8),
                        _getCheckBox(subQuestionWrapper, 9),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      children: [
                        _getTitle(
                            'c. Patient lives in congregate situation (for example, assisted living, residential care home'),
                        _getCheckBox(subQuestionWrapper, 10),
                        _getCheckBox(subQuestionWrapper, 11),
                        _getCheckBox(subQuestionWrapper, 12),
                        _getCheckBox(subQuestionWrapper, 13),
                        _getCheckBox(subQuestionWrapper, 14),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return Expanded(
      child: SubQuestionCheckbox(
        subQuestionWrapper: subQuestionWrapper,
        optionIndex: optionIndex,
        isEnabled: true,
      ),
    );
  }

  Widget _getCheckBoxMobile(
      SubQuestionWrapper subQuestionWrapper, optionIndex, title) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          SubQuestionCheckbox(
            subQuestionWrapper: subQuestionWrapper,
            optionIndex: optionIndex,
            isEnabled: true,
          ),
          _getTitle(title),
        ],
      ),
    );
  }

  Widget _getTitle(String title) {
    return Expanded(
        child: Html(
      data: title,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    ));
  }
}

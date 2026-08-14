import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question20058001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question20058001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile  =Responsive.isMobile(context);
    return isMobile?Column(
      spacing: 15,
      children: [
        StaticCheckBoxWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[0]),
        Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MD Ordered Restrictions:",
              style: FormBuilderTextStyle.bold10Style,
            ),
            _getQuestionElement(
              questionWrapper.subQuestionWrappers[1],
            ),
          ],
        ),
        _getQuestionElement(
          questionWrapper.subQuestionWrappers[3],
        ),
        _getQuestionElement(
          questionWrapper.subQuestionWrappers[2],
        ),
        _getQuestionElement(
          questionWrapper.subQuestionWrappers[4],
        ),
      ],
    ):Column(
      spacing: 10.h,
      children: [
        StaticCheckBoxWidget(
            subQuestionWrapper: questionWrapper.subQuestionWrappers[0]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.w,
          children: [
            Text(
              "MD Ordered Restrictions:",
              style: FormBuilderTextStyle.bold10Style,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _getQuestionElement(
                          questionWrapper.subQuestionWrappers[1],
                        ),
                      ),
                      Expanded(
                        child: _getQuestionElement(
                          questionWrapper.subQuestionWrappers[2],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _getQuestionElement(
                          questionWrapper.subQuestionWrappers[3],
                        ),
                      ),
                      Expanded(
                        child: _getQuestionElement(
                          questionWrapper.subQuestionWrappers[4],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _getQuestionElement(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          final option1 = options.first;
          return Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubQuestionCheckbox(
                subQuestionWrapper: subQuestionWrapper,
                optionIndex: option1.index,
                isEnabled: true,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    ...options.sublist(1).map(
                          (option) => SubQuestionCheckbox(
                            subQuestionWrapper: subQuestionWrapper,
                            optionIndex: option.index,
                            isEnabled: option1.selected,
                          ),
                        ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

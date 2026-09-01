import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_card_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../../constants/responsive.dart';

class Question661110001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question661110001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return isMobile
        ? Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
              spacing: 10.h,
              children: [
                StaticInfoWidget(subQuestion: subQuestionWrappers[0].subQuestion),
                StaticDateFieldWidget(subQuestionWrapper: subQuestionWrappers[1]),
                StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[2]),
                StaticTextFieldWidget(subQuestionWrapper: subQuestionWrappers[3]),
                sbh(10)
              ],
            ),
        )
        : Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: StaticInfoWidget(
                        subQuestion: subQuestionWrappers[0].subQuestion)),
                Expanded(
                  child: Column(
                    children: [
                      AppCardWidget(
                        backgroundColor: Colors.white,
                        children: [
                          StaticDateFieldWidget(
                              subQuestionWrapper: subQuestionWrappers[1])
                        ],
                      ),
                      AppCardWidget(
                        backgroundColor: Colors.white,
                        children: [
                          StaticTextFieldWidget(
                              subQuestionWrapper: subQuestionWrappers[2])
                        ],
                      ),
                      AppCardWidget(
                        backgroundColor: Colors.white,
                        children: [
                          StaticTextFieldWidget(
                              subQuestionWrapper: subQuestionWrappers[3])
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

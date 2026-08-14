import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import '../../../constants/responsive.dart';

class Question10004003 extends StatelessWidget {
  const Question10004003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      runSpacing: 10.h,
      children: [
        SizedBox(
          width: Responsive.isMobile(context)? MediaQuery.sizeOf(context).width-50  :250.w,
          child: StaticDateFieldWidget(
              subQuestionWrapper: queWrapper.subQuestionWrappers[0]),
        ),
        customWidth(20.w),
        SizedBox(
          width:Responsive.isMobile(context)? MediaQuery.sizeOf(context).width-50: 250.w,
          child: StaticTextFieldWidget(
              subQuestionWrapper: queWrapper.subQuestionWrappers[1]),
        )
      ],
    );
  }
}

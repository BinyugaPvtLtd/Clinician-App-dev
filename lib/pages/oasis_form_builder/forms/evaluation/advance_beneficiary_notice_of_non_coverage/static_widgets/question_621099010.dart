import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_upload_widget.dart';


import '../../../../constants/responsive.dart';

class Question621099010 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question621099010({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile?Column(
      spacing: 10.h,
      children: [
        StaticUploadWidget(subQuestionWrapper: questionWrapper.subQuestionWrappers.first),
        StaticDateFieldWidget(subQuestionWrapper: questionWrapper.subQuestionWrappers.last),
      ],
    ):Row(
      spacing: 30.w,
      children: [
        Expanded(child: StaticUploadWidget(subQuestionWrapper: questionWrapper.subQuestionWrappers.first)),
        Expanded(child: StaticDateFieldWidget(subQuestionWrapper: questionWrapper.subQuestionWrappers.last)),
      ],
    );
  }
}

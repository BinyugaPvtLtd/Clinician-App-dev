import 'package:flutter/cupertino.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_insert_template_popup.dart';

class InsertFromTemplatePopup extends StatelessWidget {
  final QuestionWrapper questionWrapper;
  const InsertFromTemplatePopup({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return DynamicInsertTemplatePopup(questionWrapper: questionWrapper);
  }
}

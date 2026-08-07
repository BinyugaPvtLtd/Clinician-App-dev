import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

class Question10007005 extends StatelessWidget {
  const Question10007005({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getRadio(que.subQuestionWrappers[0], 0),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: StaticCheckBoxWidget(
                  subQuestionWrapper: que.subQuestionWrappers[1]),
            ),
            _getRadio(que.subQuestionWrappers[0], 1),
            _getRadio(que.subQuestionWrappers[0], 2),
          ],
        );
      }),
    );
  }
}

Widget _getRadio(SubQuestionWrapper subQuestionWrapper, optionIndex) {
  return ChangeNotifierProvider<SubQuestionWrapper>.value(
    value: subQuestionWrapper,
    child: Consumer<SubQuestionWrapper>(builder: (context, subQue, ch) {
      return StaticRadioElement(
        subQueWrapper: subQue,
        optionIndex: optionIndex,
      );
    }),
  );
}

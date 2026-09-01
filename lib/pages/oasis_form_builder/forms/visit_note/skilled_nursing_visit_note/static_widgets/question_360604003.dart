import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question360604003 extends StatelessWidget {
  const Question360604003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Column(
          children: [
            customHeight(18.h),
            Row(
              spacing: 10.w,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Weight",
                    style: FormBuilderTextStyle.regular10style,
                  ),
                ),
                SizedBox(
                    width: 70.w,
                    child: StaticTextFieldWidget(
                        subQuestionWrapper: que.subQuestionWrappers[0])),
                Padding(

                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "inches",
                    style: FormBuilderTextStyle.regular10style,
                  ),
                ),
              ],
            ),
            customHeight(16.h),
            Row(
              spacing: 10.w,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Weight",
                    style: FormBuilderTextStyle.regular10style,
                  ),
                ),
                SizedBox(
                    width: 70.w,
                    child: StaticTextFieldWidget(
                        subQuestionWrapper: que.subQuestionWrappers[1])),
                Padding(

                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "inches",
                    style: FormBuilderTextStyle.regular10style,
                  ),
                ),
                Spacer(),
                StaticCheckBoxWidget(subQuestionWrapper: que.subQuestionWrappers[2],)
              ],
            ),
          ],
        );
      }),
    );
  }
}

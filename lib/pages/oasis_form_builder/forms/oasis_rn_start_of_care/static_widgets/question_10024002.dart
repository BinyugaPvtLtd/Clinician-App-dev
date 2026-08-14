import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question10024002_1 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10024002_1({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrapper,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: StaticTextFieldElement(
                      option: subQuestion.options.first,
                      subQuestion: subQuestion,
                      onUpdate: (optionIndex, value) {
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15.h,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      subQuestion.options.first.label,
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class Question10024002_2 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10024002_2({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return StaticRadioWidget(subQuestionWrapper: subQuestionWrapper);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/question_wapper_provider.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/static/presentation/widgets/static_option_widget.dart';

class Question10023028 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10023028({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers[0];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[1];
    final subQuestionWrapper3 = questionWrapper.subQuestionWrappers[2];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper1,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    return StaticOptionWidget(
                        subQuestionWrapper: subQuestionWrapper);
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper2,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    return StaticOptionWidget(
                        subQuestionWrapper: subQuestionWrapper);
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              child: ChangeNotifierProvider<SubQuestionWrapper>.value(
                value: subQuestionWrapper3,
                child: Consumer<SubQuestionWrapper>(
                  builder: (BuildContext context, subQuestionWrapper,
                      Widget? child) {
                    return StaticOptionWidget(
                        subQuestionWrapper: subQuestionWrapper);
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}

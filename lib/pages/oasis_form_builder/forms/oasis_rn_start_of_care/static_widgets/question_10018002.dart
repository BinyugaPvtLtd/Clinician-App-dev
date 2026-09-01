import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/static_decoration.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10018002 extends StatelessWidget {
  const Question10018002({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaticDateFieldWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[0]),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[1]),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[2]),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[3]),
        customHeight(20.h),
        ChangeNotifierProvider<QuestionWrapper>.value(
          value: queWrapper,
          child: Consumer<QuestionWrapper>(
              builder: (BuildContext context, que, Widget? child) {
            return Responsive.isMobile(context)
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getCheckBox(que, que.subQuestionWrappers[4], 0, true),
                      StaticRadioWidget(
                        subQuestionWrapper: que.subQuestionWrappers[5],
                        enabled: que.subQuestionWrappers[4].subQuestion.options
                            .first.selected,
                      )
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getCheckBox(que, que.subQuestionWrappers[4], 0, true),
                      Flexible(
                        child: StaticRadioWidget(
                          subQuestionWrapper: que.subQuestionWrappers[5],
                          enabled: que.subQuestionWrappers[4].subQuestion
                              .options.first.selected,
                        ),
                      ),
                    ],
                  );
          }),
        ),
        customHeight(20.h),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[6]),
        StaticRadioWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[7]),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[8]),
      ],
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (_) {
        questionWrapper.forceNotify();
      },
    );
  }
}

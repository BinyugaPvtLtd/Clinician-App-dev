import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question510896002 extends StatelessWidget {
  const Question510896002({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[0]),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Html(
                  data:
                      'Describe type of fall and outcome for any falls <1 year:',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                )),
                // customWidth(50.w),
                IconButton(
                  onPressed: () {
                    PopupHandler.showPopup(context, "TEXTFIELDPOPUP",
                        (newValue) {
                      que.subQuestionWrappers[1]
                          .updateTextFieldValue(0, newValue);
                    });
                  },
                  icon: const Icon(Icons.edit_outlined),
                  color: AppColors.primaryAppLightColor,
                  iconSize: 22,
                )
              ],
            ),
            StaticTextFieldWidget(
                subQuestionWrapper: que.subQuestionWrappers[1])
            // _getCheckBox(que, que.subQuestionWrappers[0], 0, true),
            // StaticCheckBoxWidget(
            //   subQuestionWrapper: que.subQuestionWrappers[1],
            //   enabled: !que
            //       .subQuestionWrappers[0].subQuestion.options.first.selected,
            // ),
            // StaticCheckBoxWidget(
            //   subQuestionWrapper: que.subQuestionWrappers[2],
            //   enabled: !que
            //       .subQuestionWrappers[0].subQuestion.options.first.selected,
            // ),
          ],
        );
      }),
    );
  }

  Widget _getCheckBox(QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper, optionIndex, bool enabled) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: enabled,
      onChange: (_){
        questionWrapper.forceNotify();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question10018006 extends StatelessWidget {
  const Question10018006({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StaticCheckBoxWidget(
                      subQuestionWrapper: que.subQuestionWrappers[0]),
                ),
                SizedBox(
                  width: 60,
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StaticTextFieldWidget(
                      subQuestionWrapper: que.subQuestionWrappers[1]),
                ),
                IconButton(
                  onPressed: () {
                    PopupHandler.showPopup(context, 'TEXTFIELDPOPUP',
                        (newValue) {
                      que.subQuestionWrappers[1]
                          .updateTextFieldValue(0, newValue);
                    });
                  },
                  icon: Icon(Icons.edit_outlined),
                  color: AppColors.primaryAppLightColor,
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StaticDateFieldWidget(
                      subQuestionWrapper: que.subQuestionWrappers[2]),
                ),
                SizedBox(
                  width: Responsive.isMobile(context) ? 0 : 40,
                )
              ],
            ),
            customHeight(20.h),
            Responsive.isMobile(context)
                ? Column(
                    children: [
                      StaticCheckBoxWidget(
                          subQuestionWrapper: que.subQuestionWrappers[3]),
                      StaticTextFieldWidget(
                          subQuestionWrapper: que.subQuestionWrappers[4])
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: StaticCheckBoxWidget(
                            subQuestionWrapper: que.subQuestionWrappers[3]),
                      ),
                      Expanded(
                        flex: 6,
                        child: StaticTextFieldWidget(
                            subQuestionWrapper: que.subQuestionWrappers[4]),
                      ),
                    ],
                  ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question10011001 extends StatelessWidget {
  const Question10011001({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subQuestionWrappers = que.subQuestionWrappers;
        return Responsive.isMobile(context)?Column(
          children: [
            StaticOptionWidget(subQuestionWrapper: subQuestionWrappers.first),
            _getAdditionalDetailsWidget(context, subQuestionWrappers[1])
          ],
        ): Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child:
                    StaticOptionWidget(subQuestionWrapper: subQuestionWrappers.first)),
            customWidth(10.w),
            Expanded(
              flex: 1,
              child: _getAdditionalDetailsWidget(context, subQuestionWrappers[1]),
            )
          ],
        );
      }),
    );
  }

  Widget _getTitle(String title) {
    return Html(
      data: title,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getAdditionalDetailsWidget(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child:
            StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper)),
        customWidth(10.w),
        IconButton(
          onPressed: () {
            PopupHandler.showPopup(context, 'EDITPOPUP', (newValue) {
              subQuestionWrapper.updateTextFieldValue(0, newValue);
            }, title: subQuestionWrapper.subQuestion.title);
          },
          icon: const Icon(
            Icons.edit_outlined,
          ),
          color: AppColors.primaryAppLightColor,
        )
      ],
    );
  }
}

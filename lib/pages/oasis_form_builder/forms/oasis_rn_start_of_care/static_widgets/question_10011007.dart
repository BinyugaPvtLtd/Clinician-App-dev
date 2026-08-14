import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/popup_handler.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question10011007 extends StatelessWidget {
  const Question10011007({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isMobile(context);
    return  ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subQuestionWrappers = que.subQuestionWrappers;
        return isMobile
            ? Column(
                children: [
                  _getTitle(subQuestionWrappers[0].subQuestion.title),
                  _getTitle(subQuestionWrappers[1].subQuestion.title),
                  StaticTextFieldWidget(
                      subQuestionWrapper: subQuestionWrappers[2]),
                  _getAdditionalDetailsWidget(context, subQuestionWrappers[3]),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isTablet?1:2,
                    child: Column(
                      children: [
                        _getTitle(subQuestionWrappers[0].subQuestion.title),
                        _getTitle(subQuestionWrappers[1].subQuestion.title),
                        StaticTextFieldWidget(
                            subQuestionWrapper: subQuestionWrappers[2]),
                      ],
                    ),
                  ),
                  customWidth(isTablet ? 50 : 100),
                  Expanded(
                    child: _getAdditionalDetailsWidget(
                        context, subQuestionWrappers[3]),
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

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/popup/popup_handler.dart';

class Question10013002 extends StatelessWidget {
  const Question10013002({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subQuestionWrappers = que.subQuestionWrappers;
        return isMobile
            ?  Column(
                children: [
                  _getEnterScoreWidget(subQuestionWrappers[0]),
                  sbh(10),
                  _getAdditionalDetailsWidget(
                      context, subQuestionWrappers[2]),
                  customHeight(20.h),
                  _getScoreNoticeWidget(subQuestionWrappers[1]),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isTablet ? 1 : 2,
                    child: Column(
                      children: [
                        _getEnterScoreWidget(subQuestionWrappers[0]),
                        customHeight(20.h),
                        _getScoreNoticeWidget(subQuestionWrappers[1]),
                      ],
                    ),
                  ),
                  customWidth(isTablet ? 50 : 100),
                  Expanded(
                    child: _getAdditionalDetailsWidget(
                        context, subQuestionWrappers[2]),
                  )
                ],
              );
      }),
    );
  }

  Widget _getAdditionalDetailsWidget(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper),
        ),
        customWidth(10.w),
        IconButton(
          onPressed: () {
            PopupHandler.showPopup(context, 'EDITPOPUP', (newValue) {
              subQuestionWrapper.updateTextFieldValue(0, newValue);
              subQuestionWrapper.subQuestion.options[0].textEditingController!
                  .text = newValue;
            }, title: subQuestionWrapper.subQuestion.title);
          },
          icon: const Icon(Icons.edit_outlined),
          color: AppColors.primaryAppLightColor,
        ),
      ],
    );
  }

  Widget _getScoreNoticeWidget(SubQuestionWrapper subQuestionWrapper) {
    return Html(
      data: subQuestionWrapper.subQuestion.title,
      style: FormBuilderTextStyle.htmlTextStyle(false),
    );
  }

  Widget _getEnterScoreWidget(SubQuestionWrapper subQuestionWrapper) {
    return StaticTextFieldWidget(subQuestionWrapper: subQuestionWrapper);
  }
}

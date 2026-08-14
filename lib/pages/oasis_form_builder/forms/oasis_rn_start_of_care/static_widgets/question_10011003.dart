import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';

import 'package:provider/provider.dart';

import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/popup/popup_handler.dart';

class Question10011003 extends StatelessWidget {
  const Question10011003({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isMobile(context);
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        var subQuestion = que.subQuestionWrappers;
        return isMobile
            ? Column(
                children: [
                  _getTitle(subQuestion[0].subQuestion.title),
                  _getTitle(subQuestion[1].subQuestion.title),
                  StaticOptionWidget(subQuestionWrapper: subQuestion[2]),
                  _getAdditionalDetailsWidget(context, subQuestion[4]),
                  _getTitle(
                      '''After the patient's first attempt, repeat the words using cues <i>(“sock, something to wear; blue, a color; bed, a piece of furniture”). You may repeat the words up to two more times.</i>''')
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isTablet ? 1 : 2,
                    child: Column(
                      children: [
                        _getTitle(subQuestion[0].subQuestion.title),
                        _getTitle(subQuestion[1].subQuestion.title),
                        StaticOptionWidget(subQuestionWrapper: subQuestion[2]),
                        customHeight(20.h),
                        _getTitle(
                            '''After the patient's first attempt, repeat the words using cues <i>(“sock, something to wear; blue, a color; bed, a piece of furniture”). You may repeat the words up to two more times.</i>''')
                      ],
                    ),
                  ),
                  customWidth(isTablet ? 50 : 100),
                  Expanded(
                    child: _getAdditionalDetailsWidget(context, subQuestion[4]),
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

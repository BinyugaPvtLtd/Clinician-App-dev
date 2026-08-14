import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../widgets/popup/popup_handler.dart';

class Question10015006 extends StatelessWidget {
  const Question10015006({super.key, required this.queWrapper});

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
            StaticCheckBoxWidget(
                subQuestionWrapper: que.subQuestionWrappers[0]),
            Responsive.isMobile(context)
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Html(
                            data: 'Size, details:',
                            shrinkWrap: true,
                            style: FormBuilderTextStyle.htmlTextStyle(false),
                          ),
                          IconButton(
                            onPressed: () {
                              PopupHandler.showPopup(context, 'EDITPOPUP',
                                  (newValue) {
                                que.subQuestionWrappers[1]
                                    .updateTextFieldValue(0, newValue);
                                que
                                    .subQuestionWrappers[1]
                                    .subQuestion
                                    .options[0]
                                    .textEditingController!
                                    .text = newValue;
                              },
                                  title: que.subQuestionWrappers[1].subQuestion
                                      .title);
                            },
                            icon: const Icon(Icons.edit_outlined),
                            color: AppColors.primaryAppLightColor,
                          ),
                        ],
                      ),
                      _getTextField(
                        que.subQuestionWrappers[0],
                      )
                    ],
                  )
                : Row(
                    children: [
                      customWidth(20.w),
                      Expanded(
                        child: _getTextField(
                          que.subQuestionWrappers[0],
                        ),
                      ),
                      customWidth(50.w),
                      InkWell(
                        onTap: () {
                          PopupHandler.showPopup(context, 'EDITPOPUP',
                              (newValue) {
                            que.subQuestionWrappers[1]
                                .updateTextFieldValue(0, newValue);
                            que.subQuestionWrappers[1].subQuestion.options[0]
                                .textEditingController!.text = newValue;
                          },
                              title:
                                  que.subQuestionWrappers[1].subQuestion.title);
                        },
                        child: Image.asset(
                          AppAsset.editIcon,
                          width: 20.w,
                          height: 20.h,
                        ),
                      )
                    ],
                  ),
          ],
        );
      }),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          return StaticTextFieldElement(
              option: subQuestionWrapper.subQuestion.options.first,
              subQuestion: subQuestionWrapper.subQuestion,
              onUpdate: (optionIndex, value) {
                subQuestionWrapper.updateTextFieldValue(optionIndex, value);
              });
        },
      ),
    );
  }
}

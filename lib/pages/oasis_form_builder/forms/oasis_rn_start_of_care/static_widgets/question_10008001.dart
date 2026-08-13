import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question10008001 extends StatelessWidget {
  const Question10008001({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        final subQuestionWrappers = que.subQuestionWrappers;
        return Column(
          spacing: 12.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sbh(0),
            TitleDescription(
              title: subQuestionWrappers[0].subQuestion.title,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: _getTextField(subQuestionWrappers[0]),
                  ),
                  customWidth(5.w),
                  Text(
                    'F - Degrees Fahrenheit',
                    style: FormBuilderTextStyle.normal10style,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temperature Method:',
                          style: FormBuilderTextStyle.normal10style,
                        ),
                        StaticDropdownWidget(
                          subQuestionWrapper: subQuestionWrappers[1],
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          'Temperature Method:',
                          style: FormBuilderTextStyle.normal10style,
                        ),
                        SizedBox(
                            width: 226.w,
                            // height: 30.h,
                            child: StaticDropdownWidget(
                              subQuestionWrapper: subQuestionWrappers[1],
                            )),
                      ],
                    ),
            ),
            sbh(0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Blood Pressure - Systolic / Diastolic:',
                style: FormBuilderTextStyle.normal10style
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120.w,
                    // height: 30.h,
                    child: _getTextField(
                      subQuestionWrappers[2],
                    ),
                  ),
                  customWidth(5.w),
                  Text(
                    '/',
                    style: FormBuilderTextStyle.normal10style,
                  ),
                  customWidth(5.w),
                  SizedBox(
                    width: 120.w,
                    // height: 30.h,
                    child: _getTextField(
                      subQuestionWrappers[3],
                    ),
                  ),
                  Text(
                    '   mmHg',
                    style: FormBuilderTextStyle.normal10style,
                  )
                ],
              ),
            ),
            SizedBox(
                width: 226.w,
                // height: 30.h,
                child: StaticDropdownWidget(
                  subQuestionWrapper: que.subQuestionWrappers[4],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'BP Location:',
                    style: FormBuilderTextStyle.normal10style,
                  ),
                  customWidth(12.w),
                  Expanded(
                    child: StaticRadioWidget(
                        subQuestionWrapper: que.subQuestionWrappers[5]),
                  ),
                ],
              ),
            ),
            sbh(0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Heart Rate:',
                style: FormBuilderTextStyle.normal10style
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 104.w,
                    child: _getTextField(subQuestionWrappers[6]),
                  ),
                  customWidth(12.w),
                  Text(
                    'beats / minute',
                    style: FormBuilderTextStyle.normal10style,
                  )
                ],
              ),
            ),
            StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[7]),
            StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[8]),
            sbh(0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Respiratory Rate:',
                style: FormBuilderTextStyle.normal10style
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 104.w,
                    child: _getTextField(
                      subQuestionWrappers[9],
                    ),
                  ),
                  customWidth(12.w),
                  Text(
                    'Breaths/Minute',
                    style: FormBuilderTextStyle.normal10style,
                  )
                ],
              ),
            ),
            StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[10]),
            sbh(0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Pulse Oximetry:',
                style: FormBuilderTextStyle.normal10style
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 104.w,
                    child: _getTextField(
                      subQuestionWrappers[11],
                    ),
                  ),
                  customWidth(12.w),
                  Text(
                    '%',
                    style: FormBuilderTextStyle.normal10style,
                  )
                ],
              ),
            ),
            StaticRadioWidget(subQuestionWrapper: que.subQuestionWrappers[12]),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Additional Readings / Details:',
                        style: FormBuilderTextStyle.normal10style,
                      ),
                    ),
                    // SizedBox(
                    //     height: 15.w,
                    //     child: InkWell(
                    //         onTap: () {
                    //           PopupHandler.showPopup(context, 'TEXTFIELDPOPUP',
                    //               (newValue) {
                    //             que.subQuestionWrappers[13]
                    //                 .updateTextFieldValue(0, newValue);
                    //             que
                    //                 .subQuestionWrappers[13]
                    //                 .subQuestion
                    //                 .options[0]
                    //                 .textEditingController!
                    //                 .text = newValue;
                    //           });
                    //         },
                    //         child: Image.asset(AppAsset.editIcon)))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 40),
              child: SizedBox(
                width: double.infinity,
                child: StaticTextFieldWidget(
                    subQuestionWrapper: subQuestionWrappers[13]),
              ),
            ),
            sbh(1),
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

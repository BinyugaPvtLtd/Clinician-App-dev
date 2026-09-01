import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10004004 extends StatelessWidget {
  Question10004004({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  final headerList = [
    'Immunizations',
    'Yes',
    'No',
    'Unknown',
    'Date Received',
    'Unknown Date',
    'Additional Details'
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              // _getTitleRow(),
              ...questionWrapper.subQuestionWrappers.sublist(1).map(
                    (subQuestionWrapper) => Column(
                      children: [
                        _getExpansionRow(subQuestionWrapper),
                        Divider(height: 20),
                      ],
                    ),
                  ),
            ],
          )
        : Column(
            children: [
              _getTitleRow(),
              ...questionWrapper.subQuestionWrappers.sublist(1).map(
                    (subQuestionWrapper) => Column(
                      children: [
                        _getDataRow(subQuestionWrapper),
                        Divider(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
            ],
          );
  }

  Widget _getExpansionRow(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (context, subQuestionWrapper, child) {
          return ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Html(
              data:
                  "<b>${headerList[0]}</b> - ${subQuestionWrapper.subQuestion.title}",
              shrinkWrap: true,
              style: FormBuilderTextStyle.htmlTextStyle(false),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: _getDataExpanRow(subQuestionWrapper),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getDataExpanRow(SubQuestionWrapper subQuestionWrapper) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            _getExpCheckBox(subQuestionWrapper, 0),
            Expanded(
              child: Html(
                data: '<b>${headerList[1]}</b>',
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getExpCheckBox(subQuestionWrapper, 1),
            Expanded(
              child: Html(
                data: '<b>${headerList[2]}</b>',
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getExpCheckBox(subQuestionWrapper, 3),
            Expanded(
              child: Html(
                data: '<b>${headerList[3]}</b>',
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getExpCheckBox(subQuestionWrapper, 5),
            Expanded(
              child: Html(
                data: '<b>${headerList[5]}</b>',
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            ),
          ],
        ),
        Html(
          data: '<b>${headerList[4]}</b>',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        _getDateExpField(subQuestionWrapper, 3),
        Html(
          data: '<b>${headerList[6]}</b>',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        _getExpTextField(subQuestionWrapper, 5),
      ],
    );
  }

  Widget _getTitleRow() {
    return Row(
      children: [
        ...headerList.map(
          (title) {
            final index = headerList.indexOf(title);
            final flex = index == 0 || index == 4
                ? 2
                : index == 6
                    ? 3
                    : 1;
            return Expanded(
              flex: flex,
              child: Html(
                data: '<div style="text-align:center;"><b>$title</b></div>',
                style: FormBuilderTextStyle.htmlTextStyle(false),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _getDataRow(
    SubQuestionWrapper subQuestionWrapper,
  ) {
    final subQuestionWrapperIndex =
        questionWrapper.subQuestionWrappers.indexOf(subQuestionWrapper);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Responsive(
                    tablet: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: subQuestionWrapper.subQuestion.title,
                          shrinkWrap: true,
                          style: FormBuilderTextStyle.htmlTextStyle(false),
                        ),
                        if (subQuestionWrapperIndex == 6)
                          _getTextField(subQuestionWrapper, 6),
                      ],
                    ),
                    desktop: Row(
                      children: [
                        Html(
                          data: subQuestionWrapper.subQuestion.title,
                          shrinkWrap: true,
                          style: FormBuilderTextStyle.htmlTextStyle(false),
                        ),
                        if (subQuestionWrapperIndex == 6)
                          Expanded(
                            child: _getTextField(subQuestionWrapper, 6),
                          ),
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: _getCheckBox(subQuestionWrapper, 0),
              ),
              Expanded(
                flex: 1,
                child: _getCheckBox(subQuestionWrapper, 1),
              ),
              Expanded(
                flex: 1,
                child: _getCheckBox(subQuestionWrapper, 2),
              ),
              Expanded(
                flex: 2,
                child: _getDateField(subQuestionWrapper, 3),
              ),
              Expanded(
                flex: 1,
                child: _getCheckBox(subQuestionWrapper, 4),
              ),
              Expanded(
                flex: 3,
                child: _getTextField(subQuestionWrapper, 5),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return Center(
      child: SubQuestionCheckbox(
        subQuestionWrapper: subQuestionWrapper,
        optionIndex: optionIndex,
        isEnabled: true,
      ),
    );
  }

  Widget _getExpCheckBox(
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return Center(
      child: SubQuestionCheckbox(
        subQuestionWrapper: subQuestionWrapper,
        optionIndex: optionIndex,
        isEnabled: true,
      ),
    );
  }

  Widget _getDateExpField(
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return StaticDateFieldElement(
      onDateChange: (newDate) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, newDate.toIso8601String());
      },
      initialDate: DateTime.tryParse(option.value),
    );
  }

  Widget _getExpTextField(
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (int index, String value) {
        subQuestionWrapper.updateTextFieldValue(index, value);
      },
    );
  }

  Widget _getDateField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return StaticDateFieldElement(
      onDateChange: (newDate) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, newDate.toIso8601String());
      },
      initialDate: DateTime.tryParse(option.value),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return StaticTextFieldElement(
      option: option,
      subQuestion: subQuestionWrapper.subQuestion,
      onUpdate: (int index, String value) {
        subQuestionWrapper.updateTextFieldValue(index, value);
      },
    );
  }
}

/*ListView.builder(
          itemCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            // if(index==0){

            // }

            return ChangeNotifierProvider<SubQuestionWrapper>.value(
              value: subqueWrapper[index],
              child: Consumer<SubQuestionWrapper>(builder: (context, que, ch) {
                var subQuestion = que.subQuestion;
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: index == 0 ? 5.h : 10.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius:
                          index == 0 ? BorderRadius.circular(4.r) : null,
                      border: index == 0
                          ? Border.all(color: AppColors.greyColor)
                          : const Border(
                              bottom: BorderSide(color: AppColors.greyColor))),
                  child: Row(
                    children: List.generate(
                      7,
                      (rowInx) {
                        return Expanded(
                            flex: [0, 4].contains(rowInx)
                                ? 2
                                : (rowInx == 6 ? 3 : 1),
                            child: index == 0
                                ? Text(
                                    headerList[rowInx],
                                    textAlign: TextAlign.center,
                                    style: FormBuilderTextStyle.normal12style
                                        .copyWith(fontWeight: FontWeight.w700),
                                  )
                                : rowInx == 0
                                    ? Row(
                                        children: [
                                          InkWell(
                                            onTap: index == 6
                                                ? () {
                                                    PopupHandler.showPopup(
                                                        context,
                                                        "TEXTFIELDPOPUP",
                                                        (newValue) {
                                                      que.updateTextFieldValue(
                                                          rowInx, newValue);
                                                      que.toggleOption(rowInx);
                                                    });
                                                  }
                                                : null,
                                            child: Text(
                                              subQuestion.title,
                                              style: FormBuilderTextStyle.normal10style,
                                            ),
                                          ),
                                          if (index == 6) ...[
                                            customWidth(13.w),
                                            SizedBox(
                                              width: 120.w,
                                              height: 25.h,
                                              child: PrimaryTextField(
                                                controller: subQuestion
                                                    .options[rowInx]
                                                    .textEditingController,
                                                onTapOutside: (_) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  que.updateTextFieldValue(
                                                      rowInx,
                                                      subQuestion
                                                              .options[rowInx]
                                                              .textEditingController
                                                              ?.value
                                                              .text ??
                                                          '');
                                                },
                                                onFieldSubmitted: (value) {
                                                  que.updateTextFieldValue(
                                                      rowInx, value ?? '');
                                                },
                                              ),
                                            )
                                          ]
                                        ],
                                      )
                                    : [1, 2, 3, 5].contains(rowInx)
                                        ? AppCheckBox(
                                            value: subQuestion
                                                .options[rowInx].selected,
                                            onChanged: (value) {
                                              que.toggleOption(rowInx);
                                            },
                                          )
                                        : rowInx == 4
                                            ? StaticDateFieldElement(
                                                onDateChange: (newDateTime) {
                                                  que.updateTextFieldValue(
                                                      rowInx,
                                                      newDateTime
                                                          .toIso8601String());
                                                },
                                                initialDate: DateTime.tryParse(
                                                    subQuestion
                                                        .options[rowInx].value),
                                              )
                                            : SizedBox(
                                                height: 35.h,
                                                child: PrimaryTextField(
                                                  controller: subQuestion
                                                      .options[rowInx]
                                                      .textEditingController,
                                                  onTapOutside: (_) {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    que.updateTextFieldValue(
                                                        rowInx,
                                                        subQuestion
                                                                .options[rowInx]
                                                                .textEditingController
                                                                ?.value
                                                                .text ??
                                                            '');
                                                  },
                                                  onFieldSubmitted: (value) {
                                                    que.updateTextFieldValue(
                                                        rowInx, value ?? '');
                                                  },
                                                )));
                      },
                    ),
                  ),
                );
              }),
            );
          },
        )*/

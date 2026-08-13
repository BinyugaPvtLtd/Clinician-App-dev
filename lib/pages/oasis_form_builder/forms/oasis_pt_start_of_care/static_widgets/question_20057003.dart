import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

class Question20057003 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question20057003({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: Column(
        spacing: 10.h,
        children: [
          _getRow(questionWrapper.subQuestionWrappers[0]),
          _getRow(questionWrapper.subQuestionWrappers[1]),
          _getRow(questionWrapper.subQuestionWrappers[2]),
        ],
      ),
      desktop: Row(
        spacing: 10.w,
        children: [
          Expanded(
              child: _getColumn(
            questionWrapper.subQuestionWrappers[0],
          )),
          Expanded(
              child: _getColumn(
            questionWrapper.subQuestionWrappers[1],
          )),
          Expanded(
              child: _getColumn(
            questionWrapper.subQuestionWrappers[2],
          )),
        ],
      ),
      mobile: Column(
        children: [
          _getMobileRow(questionWrapper.subQuestionWrappers[0]),
          _getMobileRow(questionWrapper.subQuestionWrappers[1]),
          _getMobileRow(questionWrapper.subQuestionWrappers[2]),
        ],
      ),
    );
  }

  Widget _getMobileRow(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          final options = subQuestion.options;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbh(15),
              TitleDescription(
                title: subQuestion.title,
              ),
              Wrap(
                spacing: 10,
                children: [
                  ...List.generate(options.length - 1, (index) {
                    return StaticRadioElement(
                        subQueWrapper: subQuestionWrapper, optionIndex: index);
                  }),
                ],
              ),
              sbh(10),
              Text(
                options.last.label,
                style: FormBuilderTextStyle.normal10style,
              ),
              sbh(3),
              StaticTextFieldElement(
                option: options.last,
                subQuestion: subQuestion,
                onUpdate: (optionIndex, value) {
                  subQuestionWrapper.updateTextFieldValue(
                      optionIndex, value);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getColumn(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          final options = subQuestion.options;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescription(
                title: subQuestion.title,
              ),
              ...List.generate(options.length - 1, (index) {
                return StaticRadioElement(
                    subQueWrapper: subQuestionWrapper, optionIndex: index);
              }),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      options.last.label,
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ),
                  Expanded(
                    child: StaticTextFieldElement(
                      option: options.last,
                      subQuestion: subQuestion,
                      onUpdate: (optionIndex, value) {
                        print('Before');
                        print(subQuestion.toJson());
                        subQuestionWrapper.updateTextFieldValue(
                            optionIndex, value);
                        print('After');
                        print(subQuestion.toJson());

                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getRow(SubQuestionWrapper subQuestionWrapper) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          final options = subQuestion.options;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TitleDescription(
                  title: subQuestion.title,
                ),
              ),
              ...List.generate(options.length - 1, (index) {
                return StaticRadioElement(
                    subQueWrapper: subQuestionWrapper, optionIndex: index);
              }),
              Flexible(
                child: Text(
                  options.last.label,
                  style: FormBuilderTextStyle.normal10style,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: StaticTextFieldElement(
                  option: options.last,
                  subQuestion: subQuestion,
                  onUpdate: (optionIndex, value) {
                    subQuestionWrapper.updateTextFieldValue(optionIndex, value);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

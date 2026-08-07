import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/enums.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10032008Date extends StatefulWidget {
  const Question10032008Date({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  @override
  State<Question10032008Date> createState() => _Question10032008DateState();
}

class _Question10032008DateState extends State<Question10032008Date> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await loadEmployeeTypes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isLoading
        ? Center(child: const CircularProgressIndicator())
        : ChangeNotifierProvider<QuestionWrapper>.value(
            value: widget.questionWrapper,
            child: Consumer<QuestionWrapper>(builder:
                (BuildContext context, questionWrapper, Widget? child) {
              return Column(
                spacing: 10.h,
                children: [
                  ...questionWrapper.subQuestionWrappers.map(
                    (subQuestionWrapper) =>
                        ChangeNotifierProvider<SubQuestionWrapper>.value(
                      value: subQuestionWrapper,
                      child: Consumer<SubQuestionWrapper>(builder:
                          (BuildContext context, subQuestionWrapper,
                              Widget? child) {
                        var options = subQuestionWrapper.subQuestion.options;
                        return Row(
                          children: [
                            Expanded(
                                child: SubQuestionCheckbox(
                              subQuestionWrapper: subQuestionWrapper,
                              optionIndex: options[0].index,
                              isEnabled: true,
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StaticDateFieldElement(
                                  onDateChange: (newDate) {
                                    subQuestionWrapper.updateTextFieldValue(
                                        options[1].index,
                                        newDate.toIso8601String());
                                  },
                                  initialDate:
                                      DateTime.tryParse(options[1].value),
                                ),
                                // if (isMobile)
                                //   index == 0
                                //       ? SubQuestionCheckbox(
                                //           subQuestionWrapper: subQuestionWrapper,
                                //           optionIndex: options[2].index,
                                //           isEnabled: true,
                                //         )
                                //       : sbw(0),
                              ],
                            )),
                            // if (!isMobile)
                            //   index == 0
                            //       ? Expanded(
                            //           child: Padding(
                            //             padding: const EdgeInsets.only(left: 50),
                            //             child: SubQuestionCheckbox(
                            //               subQuestionWrapper: subQuestionWrapper,
                            //               optionIndex: options[2].index,
                            //               isEnabled: true,
                            //             ),
                            //           ),
                            //         )
                            //       : const Spacer(),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );
  }

  Future<void> loadEmployeeTypes() async {
    if (widget.questionWrapper.isAnswered) {
      isLoading = false;
      if (mounted) {
        setState(() {});
      }
      return;
    }
    setState(() {
      isLoading = true;
    });
    final employeeTypes =
        await FormBuilderManager().getEmployeeTypesByDepartment1(context);
    widget.questionWrapper.subQuestionWrappers.clear();

    widget.questionWrapper.subQuestionWrappers.addAll(
      employeeTypes.map((element) {
        final index = employeeTypes.indexOf(element);
        final wrapper =  SubQuestionWrapper(
          subQuestion: StaticQuestionModel(
              id: index + 1,
              code: null,
              type: AnswerType.static,
              title: '',
              description: '',
              optionsAlignment: OptionsAlignment.vertical,
              scrollAxisAlignment: OptionsAlignment.vertical,
              groupOptions: false,
              options: [
                StaticOptionModel(
                  index: 0,
                  label: element.abbreviation,
                  value: '',
                  selected: false,
                  questionAnswerType: AnswerType.checkbox,
                ),
                StaticOptionModel(
                  index: 1,
                  label: '',
                  value: '',
                  selected: false,
                  questionAnswerType: AnswerType.date,
                ),
              ],
              flags: []),
        );
        wrapper.addListener(widget.questionWrapper.onSubQuestionChanged);
        return wrapper;
      }),
    );

    widget.questionWrapper.forceNotify();

    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}

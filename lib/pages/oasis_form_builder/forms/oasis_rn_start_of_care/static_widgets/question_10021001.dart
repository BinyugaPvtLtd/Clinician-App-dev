import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10021001_1 extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const Question10021001_1({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCheckBox(subQuestionWrapper, options[0]),
              _getCheckBox(subQuestionWrapper, options[1]),
              Row(
                children: [
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[2],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[3],
                    ),
                  ),
                  Expanded(
                    flex: isMobile?1:2,
                    child: Row(
                      children: [
                        _getCheckBox(
                          subQuestionWrapper,
                          options[4],
                        ),
                        _getCheckBox(
                          subQuestionWrapper,
                          options[5],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[6],
                    ),
                  ),
                  Expanded(
                    flex: isMobile?1:2,
                    child: Row(
                      children: [
                        _getCheckBox(
                          subQuestionWrapper,
                          options[7],
                        ),
                        _getCheckBox(
                          subQuestionWrapper,
                          options[8],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[9],
                    ),
                  ),
                  Expanded(
                    flex: isMobile?1:2,
                    child: Row(
                      children: [
                        _getCheckBox(
                          subQuestionWrapper,
                          options[10],
                        ),
                        _getCheckBox(
                          subQuestionWrapper,
                          options[11],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: isMobile?2:3,
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[12],
                    ),
                  ),
                ],
              ),
              _getCheckBox(subQuestionWrapper, options[13]),
              isMobile? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[14],
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[15],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[16],
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[17],
                        ),
                      ),
                    ],
                  )
                ],
              ):Row(
                children: [
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[14],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[15],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[16],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[17],
                    ),
                  ),
                ],
              ),
              isMobile?Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[18],
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[19],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[20],
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[21],
                        ),
                      ),
                    ],
                  ),

                ],
              ):Row(
                children: [
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[18],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[19],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[20],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[21],
                    ),
                  ),
                ],
              ),
              isMobile?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getCheckBox(
                    subQuestionWrapper,
                    options[22],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[23],
                        ),
                      ),
                      Expanded(
                        child: _getCheckBox(
                          subQuestionWrapper,
                          options[24],
                        ),
                      ),
                    ],
                  )
                ],
              ):Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[22],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[23],
                    ),
                  ),
                  Expanded(
                    child: _getCheckBox(
                      subQuestionWrapper,
                      options[24],
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

  Widget _getCheckBox(
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: option.index,
      isEnabled: true,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/full_static_sub_question_repo.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_action_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_button_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_dropdown_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_info_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_option_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_time_picker_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_upload_widget.dart';

import '../../../constants/enums.dart';

class StaticQuestionRenderer extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;
  final int questionId;

  const StaticQuestionRenderer(
      {super.key, required this.subQuestionWrapper, required this.questionId});

  @override
  Widget build(BuildContext context) {
    final subQuestion = subQuestionWrapper.subQuestion;
    Widget content;
    switch (subQuestion.type) {
      case AnswerType.info:
        content = StaticInfoWidget(subQuestion: subQuestion);
        break;
      case AnswerType.textBox:
        content = StaticTextFieldWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.checkbox:
        content = StaticCheckBoxWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.option:
        content = StaticOptionWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.textArea:
        content = StaticTextFieldWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.date:
        content = StaticDateFieldWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.time:
        content = StaticTimePickerWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.dropdown:
        content = StaticDropdownWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.radio:
        content = StaticRadioWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
        break;
      case AnswerType.upload:
        content = StaticUploadWidget(subQuestionWrapper: subQuestionWrapper);
        break;
      case AnswerType.button:
        content = StaticButtonWidget(subQuestionWrapper: subQuestionWrapper);
        break;
      case AnswerType.static:
        content = FullyStaticSubQuestionRepo.getQuestion(
            subQuestionWrapper, questionId);
        break;
      case AnswerType.actionButton:
        content = Align(
            alignment: Alignment.centerLeft,
            child: StaticActionButton(subQuestionWrapper: subQuestionWrapper));
        break;
      default:
        content = const Text('Unknown question type');
    }
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      child: content,
    );
  }
}

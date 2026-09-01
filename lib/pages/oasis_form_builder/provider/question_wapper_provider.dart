

import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/dynamic/model/question_data_model.dart';

class QuestionWrapper extends ChangeNotifier {
  final QuestionDataModel question;
  String resolvedTitle = "";
  bool isAnswered = false;

  late final List<SubQuestionWrapper> subQuestionWrappers;

  QuestionWrapper({required this.question})
      : resolvedTitle = question.resolvedTitle {
    subQuestionWrappers = question.subQuestions.map((subQuestion) {
      final wrapper = SubQuestionWrapper(subQuestion: subQuestion);
      wrapper.addListener(onSubQuestionChanged);
      return wrapper;
    }).toList();
    _checkIsAnswered();
  }

  void onSubQuestionChanged() {
    _checkIsAnswered();
    notifyListeners();
  }

  void updateTextFieldValue(int optionIndex, String value) {
    question.options![optionIndex] =
        question.options![optionIndex].copyWith(value: value);
    question.options![optionIndex].selected = value.trim().isNotEmpty;
    _checkIsAnswered();
    notifyListeners();
  }

  void updateUploadImageValue(int optionIndex, XFile? image, String value) {
    if (question.options![optionIndex].image == null &&
        question.options![optionIndex].value.isNotEmpty) {
      question.options![optionIndex].deletedFileUrl = question.options![optionIndex].value;
    }

    print(question.options![optionIndex].deletedFileUrl);
    question.options![optionIndex].image = image;
    question.options![optionIndex].value = value;
    question.options![optionIndex].selected = value.trim().isNotEmpty;
    _checkIsAnswered();
    notifyListeners();
  }

  void addNotesToOption(int optionIndex, String value) {
    question.options![optionIndex] =
        question.options![optionIndex].copyWith(value: value);
    notifyListeners();
  }

  void toggleOption(int optionIndex) {
    final option = question.options![optionIndex];
    if (question.groupOptions) {
      for (int i = 0; i < question.options!.length; i++) {
        if (i == optionIndex) {
          question.options![i] = option.copyWith(selected: !option.selected);
        } else {
          question.options![i] = question.options![i].copyWith(selected: false);
        }
      }
    } else {
      question.options![optionIndex] =
          option.copyWith(selected: !option.selected);
    }
    _checkIsAnswered();
    notifyListeners();
  }

  void _checkIsAnswered() {
    bool isMainAnswered = question.options?.any((o) => o.selected) ?? false;
    bool isSubAnswered =
        subQuestionWrappers.any((wrapper) => wrapper.isAnswered);
    isAnswered = isMainAnswered || isSubAnswered;
  }

  void addSubQuestionWrappers(List<SubQuestionWrapper> wrappers) {
    for (final wrapper in wrappers) {
      wrapper.addListener(onSubQuestionChanged);
      subQuestionWrappers.add(wrapper);
    }
    _checkIsAnswered();
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final json = question.toJson();
    json['questions'] =
        subQuestionWrappers.map((subWrapper) => subWrapper.toJson()).toList();
    return json;
  }

  void forceNotify() {
    _checkIsAnswered();
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   for (var option in question.options ?? []) {
  //     // option.textEditingController?.dispose();
  //   }
  //   for (var sub in subQuestionWrappers) {
  //     sub.dispose(); // make sure each sub-question is disposed too
  //   }
  //   super.dispose();
  // }
}

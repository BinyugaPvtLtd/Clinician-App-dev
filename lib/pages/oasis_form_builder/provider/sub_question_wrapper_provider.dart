

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';

import '../constants/enums.dart';

class SubQuestionWrapper extends ChangeNotifier {
  final StaticQuestionModel subQuestion;
  bool isAnswered = false;

  SubQuestionWrapper({required this.subQuestion}) {
    if (subQuestion.type == AnswerType.textArea ||
        subQuestion.type == AnswerType.textBox ||
        subQuestion.type == AnswerType.static) {
      for (int i = 0; i < subQuestion.options.length; i++) {
        subQuestion.options[i].textEditingController =
            TextEditingController(text: subQuestion.options[i].value);
      }
    }
    _checkIsAnswered();
  }

  void updateTextFieldValue(int optionIndex, String value) {
    subQuestion.options[optionIndex].value = value;
    subQuestion.options[optionIndex].selected = value.trim().isNotEmpty;
    if (subQuestion.options[optionIndex].textEditingController != null) {
      subQuestion.options[optionIndex].textEditingController!.text = value;
    }
    _checkIsAnswered();
    notifyListeners();
  }

  void updateUploadImageValue(int optionIndex, XFile? image, String value) {
    if (subQuestion.options[optionIndex].image == null &&
        subQuestion.options[optionIndex].value.isNotEmpty) {
      subQuestion.options[optionIndex].deletedFileUrl = subQuestion.options[optionIndex].value;
    }
    subQuestion.options[optionIndex].image = image;
    subQuestion.options[optionIndex].value = value;
    subQuestion.options[optionIndex].selected = value.trim().isNotEmpty;
    _checkIsAnswered();
    notifyListeners();
  }

  /// Only being used in Wound Screen
  void markImageAsDeleted(int optionIndex) {
    if (optionIndex < 0 || optionIndex >= subQuestion.options.length) {
      return;
    }
    subQuestion.options.removeAt(optionIndex);
    _checkIsAnswered();
    notifyListeners();
  }

  void addNotesToOption(int optionIndex, String value) {
    subQuestion.options[optionIndex].value = value;
    if (subQuestion.options[optionIndex].textEditingController != null) {
      subQuestion.options[optionIndex].textEditingController!.text = value;
    }
    notifyListeners();
  }

  void clearTextFieldAt(int index) {
    if (index >= 0 && index < subQuestion.options.length) {
      subQuestion.options[index].textEditingController?.clear();
      subQuestion.options[index].value = '';
      subQuestion.options[index].selected = false;
      _checkIsAnswered();
      notifyListeners();
    }
  }

  void toggleOption(int optionIndex) {
    final option = subQuestion.options[optionIndex];
    if (subQuestion.groupOptions) {
      for (int i = 0; i < subQuestion.options.length; i++) {
        if (i == optionIndex) {
          subQuestion.options[i].selected = !option.selected;
        } else {
          subQuestion.options[i].selected = false;
        }
      }
    } else {
      subQuestion.options[optionIndex].selected = !option.selected;
    }
    _checkIsAnswered();
    notifyListeners();
  }

  void setOption(int optionIndex) {
    for (int i = 0; i < subQuestion.options.length; i++) {
      if (i == optionIndex) {
        subQuestion.options[i].selected = true;
      } else {
        subQuestion.options[i].selected = false;
      }
    }
    _checkIsAnswered();
    notifyListeners();
  }

  void forceNotify() {
    _checkIsAnswered();
    notifyListeners();
  }

  void _checkIsAnswered() {
    isAnswered = subQuestion.options.any((o) => o.selected);
  }

  Map<String, dynamic> toJson() => subQuestion.toJson();

  @override
  void dispose() {
    super.dispose();
  }
}

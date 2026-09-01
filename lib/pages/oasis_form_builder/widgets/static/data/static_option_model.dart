import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/enums.dart';
import '../../../helpers/parse_html_to_plain_text.dart';

class StaticOptionModel {
  String label;
  String value;
  int index;
  bool selected;
  String? hint;
  String? popupCode;

  AnswerType questionAnswerType;

  //This will only be used for text fields and text areas
  TextEditingController? textEditingController;

  //This will only be used for upload signature/upload image kind of options
  XFile? image;

  //This will hold the url of deleted image by user
  String? deletedFileUrl;

  StaticOptionModel(
      {required this.index,
      required this.label,
      required this.value,
      required this.selected,
      this.hint,
      this.popupCode,
      this.image,
      this.deletedFileUrl,
      required this.questionAnswerType});

  StaticOptionModel.fromJson(Map<String, dynamic> json, this.questionAnswerType)
      : label = json['label'] ?? "",
        value = questionAnswerType == AnswerType.radio ||
                questionAnswerType == AnswerType.none
            ? json['value']
            : _computeValue(json['label'], json['value']),
        index = (json['index'] ?? 0) as int,
        selected = json['selected'] ?? false,
        hint = json['hint'] ?? "",
        popupCode = json['popup_code'];

  // Static method to compute value after comparing parsed HTML
  static String _computeValue(dynamic labelHtml, dynamic valueHtml) {
    final labelText = parseHtmlToPlainText(labelHtml ?? '');
    final valueText = parseHtmlToPlainText(valueHtml ?? '');
    return (labelText == valueText) ? '' : (valueHtml ?? '');
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'selected': selected,
        'index': index,
        if (popupCode != null && popupCode!.isNotEmpty) 'popup_code': popupCode,
        if (hint != null && hint!.isNotEmpty) 'hint': hint
      };

  static List<Map<String, dynamic>> toJsonList(
      List<StaticOptionModel> options) {
    return options.map((option) {
      final data = option.toJson();
      data['index'] = options.indexOf(option);
      return data;
    }).toList();
  }

  static List<StaticOptionModel> listFromJson(
      List jsonList, AnswerType questionAnswerType) {
    return jsonList
        .map((json) => StaticOptionModel.fromJson(json, questionAnswerType))
        .toList();
  }
}



import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/enums.dart';
import '../../../helpers/parse_html_to_plain_text.dart';

class OptionDataModel {
  final String label;
  String value;
  final int index;
  bool selected;
  final String? hint;
  final String? popupCode;
  final AnswerType questionAnswerType;
  //This will only be used for text fields and text areas
  TextEditingController? textEditingController;


  //This will only be used for upload signature/upload image kind of options
  XFile? image;
  //This will hold the url of deleted image by user
  String? deletedFileUrl;

  OptionDataModel(
      {required this.index,
      required this.label,
      required this.value,
      required this.selected,
      this.hint,
      this.popupCode,
      this.image,
      this.deletedFileUrl,
      required this.questionAnswerType});

  OptionDataModel.fromJson(Map<String, dynamic> json, this.questionAnswerType)
      : label = json['label'] ?? "",
        value = json['value'] ?? "",
        index = (json['index'] ?? 0) as int,
        selected = json['selected'] ?? false,
        hint = json['hint'] ?? '',  
        popupCode = json['popup_code'] {
    // Parse and extract plain text from HTML
    String plainLabel = parseHtmlToPlainText(label);
    String plainValue = parseHtmlToPlainText(value);

    // Compare plain texts
    if (plainLabel == plainValue && questionAnswerType != AnswerType.radio) {
      value = '';
    }
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'index': index,
        'selected': selected,
        'deletedFileUrl': deletedFileUrl,
        if (popupCode != null && popupCode!.isNotEmpty) 'popup_code': popupCode,
        if (hint != null && hint!.isNotEmpty) 'hint': hint
      };

  static toJsonList(List<OptionDataModel> options) {
    return options.map((option) {
      final map = option.toJson();
      map['index'] = options.indexOf(option);
      return map;
    }).toList();
  }

  OptionDataModel copyWith({
    String? label,
    String? value,
    int? index,
    XFile? image,
    String? deletedFileUrl,
    bool? selected,
    String? popupCode,
  }) {
    return OptionDataModel(
        label: label ?? this.label,
        value: value ?? this.value,
        index: index ?? this.index,
        image: image ?? this.image,
        deletedFileUrl: deletedFileUrl ?? this.deletedFileUrl,
        selected: selected ?? this.selected,
        hint: hint,
        popupCode: popupCode ?? this.popupCode,
        questionAnswerType: questionAnswerType);
  }
}

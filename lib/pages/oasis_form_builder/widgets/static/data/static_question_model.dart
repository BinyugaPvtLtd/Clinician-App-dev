// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_option_model.dart';

import '../../../constants/enums.dart';

class StaticQuestionModel {
  String? code;
  int id;
  AnswerType type;
  String title;
  String description;
  OptionsAlignment optionsAlignment;
  OptionsAlignment scrollAxisAlignment;
  bool groupOptions;
  List<StaticOptionModel> options;
  List<String> flags;
  String? notice;

  StaticQuestionModel({
    required this.id,
    required this.code,
    required this.type,
    required this.title,
    required this.description,
    required this.optionsAlignment,
    required this.scrollAxisAlignment,
    required this.groupOptions,
    required this.options,
    required this.flags,
    this.notice,
  });

  static StaticQuestionModel fromJson(Map<String, dynamic> json) {
    try {
      final subQuestion = StaticQuestionModel(
        id: json['question_id'],
        code: json['code'],
        type: stringToAnswerType(json['type']),
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        optionsAlignment: stringToOptionsAlignment(json['options_alignment']),
        scrollAxisAlignment: stringToOptionsAlignment(json['scroll_axis']),
        // groupOptions: json['group_options'] ?? false,
        groupOptions: selectGroupOptionBasedOnQuestionType(stringToAnswerType(json['type'])),
        flags: (json['flag'] ?? []).cast<String>(),
        notice: json['notice'],
        options: StaticOptionModel.listFromJson(
            json['options'] ?? [], stringToAnswerType(json['type'])),
      );
      if (subQuestion.type == AnswerType.textBox ||
          subQuestion.type == AnswerType.textArea) {
        // for(final option in subQuestion.options) {
        //   option.textEditingController = TextEditingController();
        // }
      }
      return subQuestion;
    } catch (e, stack) {
      print('\x1B[31m[ERROR: SubQuestion Parse Failed]\x1B[0m $e');
      print('\x1B[90m$stack\x1B[0m');
      rethrow;
    }
  }

  static List<StaticQuestionModel> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) =>
            StaticQuestionModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonList(
      List<StaticQuestionModel> subquestions) {
    return subquestions.map((subQuestion) => subQuestion.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': id,
      if (code != null && code!.isNotEmpty) 'code': code,
      'type': answerTypeToString(type),
      if (title.isNotEmpty) 'title': title,
      if (description.isNotEmpty) 'description': description,
      'options_alignment': optionAlignmentToString(optionsAlignment),
      'scroll_axis': optionAlignmentToString(scrollAxisAlignment),
      'group_options': groupOptions,
      'options': StaticOptionModel.toJsonList(options),
      if (flags.isNotEmpty) 'flag': flags,
      if (notice != null && notice!.isNotEmpty) 'notice': notice,
    };
  }

  StaticQuestionModel copyWith({
    String? code,
    int? id,
    AnswerType? type,
    String? title,
    String? description,
    OptionsAlignment? optionsAlignment,
    OptionsAlignment? scrollAxisAlignment,
    bool? groupOptions,
    List<StaticOptionModel>? options,
    List<String>? flags,
    String? notice,
  }) {
    return StaticQuestionModel(
      code: code ?? this.code,
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      optionsAlignment: optionsAlignment ?? this.optionsAlignment,
      scrollAxisAlignment: scrollAxisAlignment ?? this.scrollAxisAlignment,
      groupOptions: groupOptions ?? this.groupOptions,
      options: options ?? this.options,
      flags: flags ?? this.flags,
      notice: notice ?? this.notice,
    );
  }
}

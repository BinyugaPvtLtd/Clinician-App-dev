import 'package:clinician_app/pages/oasis_form_builder/constants/form_key_string.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';

import 'option_data_model.dart';

class QuestionDataModel {
  final AnswerType? answerType;
  final QuestionType? questionType;
  final String? title;
  final bool? dynamicType;
  final bool? drawBox;
  final bool? questionLookupEnabled;
  final OptionsAlignment? optionsAlignment;
  final OptionsAlignment? scrollAxis;
  final bool groupOptions;
  final String? description;
  final String notice;
  final int id;
  final int? answerId;
  final String? code;

  final List<OptionDataModel>? options;

  // final List<Map<String, dynamic>> dynamicQuestions;
  final List<StaticQuestionModel> subQuestions;
  final List<String> flags;
  final List<Map<String, dynamic>> preloadedComments;

  QuestionDataModel({
    required this.options,
    required this.description,
    required this.questionType,
    required this.title,
    required this.drawBox,
    required this.questionLookupEnabled,
    required this.groupOptions,
    required this.answerType,
    required this.code,
    required this.optionsAlignment,
    required this.scrollAxis,
    required this.id,
    required this.dynamicType,
    required this.answerId,
    // required this.dynamicQuestions,
    required this.subQuestions,
    required this.flags,
    this.notice = "",
    this.preloadedComments = const [],
  });

  factory QuestionDataModel.fromJson(Map<String, dynamic> json) {
    try {
      return QuestionDataModel(
        answerType: stringToAnswerType(json['type']),
        questionType: stringToQuestionType(json['question_type']),
        title: json['title'] ?? "",
        notice: json['notice'] ?? "",
        // groupOptions: json['group_options'] ?? false,
        groupOptions: selectGroupOptionBasedOnQuestionType(stringToAnswerType(json['type'])),
        options: (json['question_options'] ?? json['options'] ?? [])
            .map<OptionDataModel>(
              (element) => OptionDataModel.fromJson(
                element,
                stringToAnswerType(
                  json['type'],
                ),
              ),
            )
            .toList(),
        id: json['question_type_id'] ?? 0,
        answerId: json['answer_id'] ?? 0,
        code: json['code'] ?? "",
        dynamicType: json['dynamic_type'] ?? false,
        optionsAlignment: stringToOptionsAlignment(json['options_alignment']),
        scrollAxis: stringToOptionsAlignment(json['scroll_axis']),
        description: json['description'] ?? "",
        // dynamicQuestions: json['questions'] ?? [],
        flags: (json['flag'] ?? []).cast<String>(),
        subQuestions: StaticQuestionModel.listFromJson(json['questions'] ?? []),
        drawBox: json['draw_box'] ?? true,
        questionLookupEnabled: json['question_lookup_enabled'] ?? false,
        preloadedComments: (json['comments'] as List? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList(),
      );
    } catch (e, stackTrace) {
      print(
          '\x1B[31m[ERROR] Failed to parse ChartQuestionDataModel\x1B[0m: $e');
      print('\x1B[90m$stackTrace\x1B[0m');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        'question_type_id': id,
        'type': answerTypeToString(answerType ?? AnswerType.none),
        'question_type':
            questionTypeToString(questionType ?? QuestionType.none),
        if (title != null && title!.isNotEmpty) 'title': title,
        if (code != null && code!.isNotEmpty) 'code': code,
        'group_options': groupOptions,
        if (description != null && description!.isNotEmpty)
          'description': description,
        'options_alignment': optionAlignmentToString(
            optionsAlignment ?? OptionsAlignment.vertical),
        if (scrollAxis != null)
          'scroll_axis': optionAlignmentToString(scrollAxis!),
        'dynamic_type': dynamicType,
        'options': OptionDataModel.toJsonList(options ?? []),
        'questions': StaticQuestionModel.toJsonList(subQuestions),
        if (flags.isNotEmpty) 'flag': flags,
        if (notice.isNotEmpty) 'notice': notice,
        if (drawBox != null) 'draw_box': drawBox,
        if (questionLookupEnabled != null && questionLookupEnabled!) 'question_lookup_enabled': questionLookupEnabled,
      };

  static List<QuestionDataModel> listFromJsonList(List jsonList) {
    return jsonList.map((json) => QuestionDataModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonFromList(
      List<QuestionDataModel> questions) {
    return questions.map((question) => question.toJson()).toList();
  }
}

extension QuestionModelExtensions on QuestionDataModel {
  String get resolvedTitle {
    // 1. Check main question title
    if ((title ?? '').trim().isNotEmpty) return title!.trim();

    // 2. Check main description
    if ((description ?? '').trim().isNotEmpty) return description!.trim();

    // 3. Check first option's label
    if ((options?.isNotEmpty ?? false) &&
        (options!.first.label.trim().isNotEmpty)) {
      return options!.first.label.trim();
    }

    // 4. If nothing, look into first subquestion
    if (subQuestions.isNotEmpty) {
      final sub = subQuestions.first;

      if (sub.title.trim().isNotEmpty) return sub.title.trim();

      if (sub.description.trim().isNotEmpty) return sub.description.trim();

      if (sub.options.isNotEmpty && sub.options.first.label.trim().isNotEmpty) {
        return sub.options.first.label.trim();
      }
    }

    // 5. Fallback
    return "Untitled Question";
  }
}

bool selectGroupOptionBasedOnQuestionType(AnswerType answerType) {
  switch (answerType) {
    case AnswerType.option:
      return true;
    case AnswerType.textBox:
    case AnswerType.radio:
      return true;
    case AnswerType.button:
      return true;
    case AnswerType.dropdown:
      return true;
    default:
      return false;
  }
}

AnswerType stringToAnswerType(String value) {
  return value == FormkeyString.checkBox
      ? AnswerType.checkbox
      : value == FormkeyString.option
          ? AnswerType.option
          : value == FormkeyString.textField
              ? AnswerType.textBox
              : value == FormkeyString.textArea
                  ? AnswerType.textArea
                  : value == FormkeyString.date
                      ? AnswerType.date
                      : value == FormkeyString.info
                          ? AnswerType.info
                          : value == FormkeyString.radio
                              ? AnswerType.radio
                              : value == FormkeyString.button
                                  ? AnswerType.button
                                  : value == FormkeyString.dropdown
                                      ? AnswerType.dropdown
                                      : value == FormkeyString.upload
                                          ? AnswerType.upload
                                          : value == FormkeyString.static
                                              ? AnswerType.static
                                              : value ==
                                                      FormkeyString.actionButton
                                                  ? AnswerType.actionButton
                                                  : value == FormkeyString.time
                                                      ? AnswerType.time
                                                      // Start For Wound Screen Only
                                                      : value ==
                                                              FormkeyString
                                                                  .divider
                                                          ? AnswerType.divider
                                                          : value ==
                                                                  FormkeyString
                                                                      .addWoundImage
                                                              ? AnswerType
                                                                  .addWoundImage
                                                              : value ==
                                                                      FormkeyString
                                                                          .foamStatic
                                                                  ? AnswerType
                                                                      .foamStatic
                                                                  // END For Wound Screen Only
                                                                  : AnswerType
                                                                      .none;
}

String answerTypeToString(AnswerType type) {
  switch (type) {
    case AnswerType.checkbox:
      return FormkeyString.checkBox;
    case AnswerType.option:
      return FormkeyString.option;
    case AnswerType.textBox:
      return FormkeyString.textField;
    case AnswerType.textArea:
      return FormkeyString.textArea;
    case AnswerType.date:
      return FormkeyString.date;
    case AnswerType.info:
      return FormkeyString.info;
    case AnswerType.radio:
      return FormkeyString.radio;
    case AnswerType.button:
      return FormkeyString.button;
    case AnswerType.dropdown:
      return FormkeyString.dropdown;
    case AnswerType.upload:
      return FormkeyString.upload;
    case AnswerType.static:
      return FormkeyString.static;
    case AnswerType.actionButton:
      return FormkeyString.actionButton;
    case AnswerType.time:
      return FormkeyString.time;
    // START For Wound Screen Only
    case AnswerType.addWoundImage:
      return FormkeyString.addWoundImage;
    case AnswerType.foamStatic:
      return FormkeyString.foamStatic;
    case AnswerType.divider:
      return FormkeyString.divider;
    // END For Wound Screen Only
    default:
      return '';
  }
}

QuestionType stringToQuestionType(String value) {
  return value == FormkeyString.comprehensive
      ? QuestionType.comprehensive
      : value == FormkeyString.nonComprehensive
          ? QuestionType.nonComprehensive
          : value == FormkeyString.questionTypeBoth
              ? QuestionType.both
              : QuestionType.none;
}

String questionTypeToString(QuestionType type) {
  switch (type) {
    case QuestionType.comprehensive:
      return FormkeyString.comprehensive;
    case QuestionType.nonComprehensive:
      return FormkeyString.nonComprehensive;
    case QuestionType.both:
      return FormkeyString.questionTypeBoth;
    default:
      return '';
  }
}

OptionsAlignment stringToOptionsAlignment(String? value) {
  return value == FormkeyString.horizontal
      ? OptionsAlignment.horizontal
      : OptionsAlignment.vertical;
}

String optionAlignmentToString(OptionsAlignment type) {
  switch (type) {
    case OptionsAlignment.horizontal:
      return FormkeyString.horizontal;
    case OptionsAlignment.vertical:
      return FormkeyString.vertical;
    default:
      return FormkeyString.vertical;
  }
}

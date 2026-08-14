class QuestionMarkup {
  final String code;
  final String? title;
  final String? data;

  QuestionMarkup({
    required this.code,
    this.title,
    this.data,
  });

  factory QuestionMarkup.fromJson(Map<String, dynamic> json) {
    return QuestionMarkup(
      code: json['code'] ?? '',
      title: json['title'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      if (title != null) 'title': title,
      if (data != null) 'data': data,
    };
  }
}

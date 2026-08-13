class QuestionCommentModel {
  final int id;
  final int patientFormId;
  final int questionId;
  final String comment;
  final String createdAt;
  final bool isResolved;
  final CommentAuthor createdBy;
  final int index;

  const QuestionCommentModel({
    required this.id,
    required this.patientFormId,
    required this.questionId,
    required this.comment,
    required this.createdAt,
    required this.isResolved,
    required this.createdBy,
    this.index = 0,
  });

  factory QuestionCommentModel.fromJson(Map<String, dynamic> json) {
    return QuestionCommentModel(
      id: json['id'] ?? 0,
      patientFormId: json['patient_form_id'] ?? 0,
      questionId: json['question_id'] ?? 0,
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] ?? '',
      isResolved: json['is_resolved'] ?? false,
      createdBy: CommentAuthor.fromJson(json['created_by'] ?? {}),
      index: json['index'] ?? 0,
    );
  }
}

class CommentAuthor {
  final String name;
  final String? color;
  final String? abbreviation;
  final int? userId;

  const CommentAuthor({
    required this.name,
    this.color,
    this.abbreviation,
    this.userId,
  });

  factory CommentAuthor.fromJson(Map<String, dynamic> json) {
    return CommentAuthor(
      name: json['name'] ?? '',
      color: json['color'],
      abbreviation: json['abbreviation'],
      userId: json['id'] ?? json['user_id'],
    );
  }

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.isEmpty || parts[0].isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}

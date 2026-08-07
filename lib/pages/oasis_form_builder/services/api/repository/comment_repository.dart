class CommentRepository {
  static const String _base = '/question-comment';

  static String getComments({required int patientFormId, required int questionId}) {
    return '$_base/$patientFormId/$questionId';
  }

  static String addComment() => _base;

  static String resolveComment({required int commentId}) =>
      '$_base/$commentId/resolve';

  static String deleteComment({required int commentId}) =>
      '$_base/$commentId';
}

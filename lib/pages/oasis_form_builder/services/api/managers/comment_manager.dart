// import 'package:flutter/material.dart';
// import 'package:clinician_app/pages/oasis_form_builder/model/question_comment_model.dart';
// import 'package:clinician_app/pages/oasis_form_builder/services/api/repository/comment_repository.dart';
//
// class CommentManager {
//   Future<List<QuestionCommentModel>> getComments(
//     BuildContext context, {
//     required int patientFormId,
//     required int questionId,
//   }) async {
//     try {
//       final response = await Api(context).get(
//         path: CommentRepository.getComments(
//           patientFormId: patientFormId,
//           questionId: questionId,
//         ),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = response.data;
//         final list = data is List ? data : (data['data'] ?? []);
//         return (list as List)
//             .map((e) => QuestionCommentModel.fromJson(e))
//             .toList();
//       }
//       return [];
//     } catch (e) {
//       return [];
//     }
//   }
//
//   Future<bool> addComment(
//     BuildContext context, {
//     required int patientFormId,
//     required int questionId,
//     required String comment,
//   }) async {
//     try {
//       final response = await Api(context).post(
//         path: CommentRepository.addComment(),
//         data: {
//           'patient_form_id': patientFormId,
//           'question_id': questionId,
//           'comment': comment,
//         },
//       );
//       return response.statusCode == 200 || response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Future<bool> resolveComment(
//     BuildContext context, {
//     required int commentId,
//   }) async {
//     try {
//       final response = await Api(context).patch(
//         path: CommentRepository.resolveComment(commentId: commentId),
//         data: {},
//       );
//       return response.statusCode == 200 || response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Future<bool> deleteComment(
//     BuildContext context, {
//     required int commentId,
//   }) async {
//     try {
//       final response = await Api(context).delete(
//         path: CommentRepository.deleteComment(commentId: commentId),
//       );
//       return response.statusCode == 200 ||
//           response.statusCode == 204 ||
//           response.statusCode == 201;
//     } catch (e) {
//       return false;
//     }
//   }
// }

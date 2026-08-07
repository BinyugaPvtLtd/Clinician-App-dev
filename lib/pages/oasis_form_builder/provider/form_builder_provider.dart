import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';

class FormBuilderProvider with ChangeNotifier {
  List<QuestionWrapper> wrapperQuestions = [];
  final List<String> _deletedImageUrlsQueue = [];

  void setQuestions(List<QuestionDataModel> questionModels) {
    wrapperQuestions =
        questionModels.map((q) => QuestionWrapper(question: q)).toList();
    notifyListeners();
  }

  QuestionWrapper? getQuestionById(int id) {
    return wrapperQuestions.firstWhereOrNull((q) => q.question.id == id);
  }

  List<Map<String, dynamic>> toJson() {
    return wrapperQuestions.map((wrapper) => wrapper.toJson()).toList();
  }

   List<QuestionDataModel> questions = [];

  void addQuestion(QuestionDataModel question) {
    questions.add(question);
    notifyListeners();
  }
 void addWrapper(QuestionWrapper wrapper) {
    wrapperQuestions.add(wrapper);
    questions.add(wrapper.question);
    notifyListeners();
  }

  void clear() {
    for (final wrapper in wrapperQuestions) {
      wrapper.dispose();
    }
    wrapperQuestions.clear();
    questions.clear();
    uploadTypeQuestions.clear();
    _deletedImageUrlsQueue.clear();
    notifyListeners();
  }

  // FOR UNANSWERED QUESTIONS
  List<Map<String, dynamic>> _unanswered = [];
  List<Map<String, dynamic>> get unanswered => _unanswered;

  void _updateUnanswered() {
    final result = <Map<String, dynamic>>[];

    for (final qWrapper in wrapperQuestions) {
      if (!qWrapper.isAnswered) {
        final code = (qWrapper.question.code?.isNotEmpty ?? false)
            ? qWrapper.question.code
            : null;

        final title = _resolveTitle(qWrapper);

        result.add({"code": code, "title": title});
      }
    }

    _unanswered = result;
    notifyListeners(); // 🔔 notify UI
  }

  String _resolveTitle(QuestionWrapper questionWrapper) {
    if ((questionWrapper.question.title ?? '').isNotEmpty) {
      return questionWrapper.question.title!;
    }

    for (final sub in questionWrapper.subQuestionWrappers) {
      if (sub.subQuestion.title.isNotEmpty) {
        return sub.subQuestion.title;
      }
    }

    return "Untitled Question";
  }
  List<QuestionWrapper> uploadTypeQuestions = [];

 void addUploadTypeWrapper(QuestionWrapper wrapper) {
    uploadTypeQuestions.add(wrapper);
  }

  void enqueueDeletedImageUrl(String? url) {
    final normalized = url?.trim() ?? "";
    if (normalized.isEmpty) return;
    if (_deletedImageUrlsQueue.contains(normalized)) return;
    _deletedImageUrlsQueue.add(normalized);
  }

  List<String> consumeDeletedImageUrlsQueue() {
    final snapshot = List<String>.from(_deletedImageUrlsQueue);
    _deletedImageUrlsQueue.clear();
    return snapshot;
  }


  @override
  void dispose() {
    for (final questionWrapper in wrapperQuestions) {
      questionWrapper.removeListener(_updateUnanswered);
    }
    super.dispose();
  }
}

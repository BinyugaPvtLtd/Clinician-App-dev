class PendingReviewAssistanceForm {
  final int patientFormId;
  final int patientId;
  final int formId;
  final String formName;
  final int assistantEmployeeId;
  final int visitId;
  final String assistantName;
  final String assistantImage;
  final String assistantEmployeeType;
  final String assistantEmployeeTypeAbbreviation;

  PendingReviewAssistanceForm({
    required this.visitId,
    required this.patientFormId,
    required this.patientId,
    required this.formId,
    required this.formName,
    required this.assistantEmployeeId,
    required this.assistantName,
    required this.assistantImage,
    required this.assistantEmployeeType,
    required this.assistantEmployeeTypeAbbreviation,
  });
}
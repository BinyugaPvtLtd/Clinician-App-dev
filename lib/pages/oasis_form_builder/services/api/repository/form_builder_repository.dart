class FormBuilderRepository {
  static String patientFormInIt = "/patient-form/init";
  static String _patientFormId = "/patient-form/id/";
  static String patientFormAnswer = "/patient-form/answer";
  static String createEpisode = "/episodes/";
  static String patientReferral = "/patient-referral";
  static String patientReferralList = "/patient-referral/list";
  static String patientFormByPatientID = "/patient-form/patient";
  static String getAllForms = '/form';
  static String getAllSubForms = '/subform';
  static String initPatientForm = '/patient-form/init';
  static String patientFormByPatientFormID = '/patient-form/';
  static String questionMarkup = '/question-markup/';
  static String uploadFile = '/patient-form-upload/upload-file';
  static String deleteFile = '/patient-form-upload/delete-file';
  static String getEmployeeTypeByDepartment1 = '/employee-types/Department/1';
  static String getChart = '/patient-referral/charts';
  static String episodeDdropdown = "/episodes/patient";
  static String addPhysicianOrderForm = "/patient-form";
  static String restartForm = "/patient-form/restart";
  static String isAssistantForm = "/patient-visits";



  static String patchIsAssistantForm({required String visitId, required String formId}) {
    return "$isAssistantForm/$visitId/approve-assistant-form/$formId";
  }

  static String patchRestartForm({required int patientFormId}) {
    return "$restartForm/$patientFormId";
  }

  static String patchPhysicianOrder({required int patientFormId}) {
    return "$addPhysicianOrderForm/$patientFormId/assign-physician-order";
  }

  static String getPatientEpisodeDropdown({required int patientId}) {
    return "$episodeDdropdown/$patientId/chart-dropdown";
  }
  /// /hr-dropdowns/total/employees/newJoinee/{companyId}
  static String getPatientFormById({required int patientId}) {
    return "$_patientFormId/$patientId";
  }

  static String getPatientFormByPatientFormID({required int patientFormID}) {
    return "$patientFormByPatientFormID/$patientFormID";
  }
  static String getPatientFormByPatientFormIDWithSub({required int patientFormID, required int subFormID}) {
    return "$patientFormByPatientFormID/$patientFormID/subform/$subFormID";
  }

  static String getPatientReferral({required int referralID}) {
    return "$patientReferral/$referralID";
  }

  static String getPatientFormByPatientID(
      {required int patientID, required int chartID, required int episodeID, int? formID}) {
    return formID != null
        ? "$patientFormByPatientID/$patientID?chart_id=$chartID&episode_id=$episodeID&form_id=$formID"
        : "$patientFormByPatientID/$patientID?chart_id=$chartID&episode_id=$episodeID";
  }

  static String getQuestionMarkupByCode({required String code}) {
    return "$questionMarkup/$code";
  }
  static String getPatientCharts({required int patientId}) {
    return "$getChart/$patientId";
  }

}

class MarkMissedRepository {
  static String _patientVisits = '/patient-visits';
  static String pendingReviewForm = "/patient-form/assistant-pending-reviews";


  static String markMissed({required int visitId}) {
    return '/patient-visits/$visitId/mark-missed';
  }
  static String uploadVisitPhoto({required int visitId}) {
    return '$_patientVisits/upload-visit-photo/$visitId';
  }
  static String patientVisitEpisodEnd({required int visitId}){
    return "$_patientVisits/$visitId/episode-end";
  }
  static String recertDecisionVisit({required int visitId}){
    return "$_patientVisits/$visitId/recert-window-decision";
  }
  static String getPatientFormReview({required int patientId}){
    return "$pendingReviewForm/$patientId";
  }
}

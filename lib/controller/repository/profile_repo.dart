class ProfileRepository{
  static String getEmployeeId = '/employee-offers/GetEmployeeIdByEmail';
  static String employees = '/employees';
  static String employeeAttachProfileImage = '/employees/attach-photobase64';
  static String patientVisits = '/patient-visits/clinician';
  static String visitdetaiils = '/patient-visits';
  static String visitAcceptReject = '/rejected-visits';

  // Time Off
  static String leaveType = '/leave-types';
  static String timeOffTypes = '/time-off-types';
  static String addTimeOffRequest = '/time-off';
  static String timeOffHistory = '/time-off';

  // My Earning
  static String myEarning = '/patient-visits/clinician/completed-visits-stats';
  static String myEarningToday = '/patient-visits/clinician/completed-visits-stats';

  /// Update documents
  static String updateListDocument = '/employee-documents/ByemployeeIdGrouped';
  static String empSubDoc = "/employee-document-type-setup/ByDocumentTypeMetaDataId";
  static String uploadDocument = "/employee-documents/uploadDocument";
  static String uploadDocBase64 = "/employee-documents/uploadDocumentbase64";



  static String getEmpIdByEmail({required int companyId, required String email,}) {
    return '$getEmployeeId/$companyId/$email';
  }
  static String patchEmployeeData({required int empId}) {
    return '$employees/$empId';
  }
  static String attachEmployeeImageData({required int empId}) {
    return '$employeeAttachProfileImage/$empId';
  }
  static String getPatientVisitsNote({required int empId,required String date}) {
    return '$patientVisits/$empId/$date/pending';
  }
  static String getVisitDetails({required int visitId}) {
    return '$visitdetaiils/$visitId/visible-details';
  }

  static String postVisitAceptReject() {
    return '$visitAcceptReject';
  }

  /// Time Off
  static String getLeaveType() {
    return '$leaveType';
  }
  static String getTimeOffTypes() {
    return '$timeOffTypes';
  }
  static String postAddTimeOffRequest() {
    return '$addTimeOffRequest';
  }
  static String getTimeOffHistory({required int empId}) {
    return '$timeOffHistory/$empId/history';
  }

  /// My Earning
  static String getMyEarning(){
    return '$myEarning';
  }
  static String getMyEarningTodayVisit(){
    return '$myEarningToday';
  }

  /// Update documents
  static String getUpdateListDocument({required int employeeId, required String approveOnly, required String search}) {
    return '$updateListDocument/$employeeId/$approveOnly/$search';
  }

  static String getSubDocListDocument({required int docMetaId,}) {
    return '$empSubDoc/$docMetaId';
  }
  static String postUploadDocument({required int docMetaId,required int docTypeSetupId, required int empId}) {
    return '$uploadDocBase64/$docMetaId/$docTypeSetupId/$empId';
  }

  static String postUploadDocumentBase64({required int docMetaId,required int docTypeSetupId, required int empId}) {
    return '$uploadDocument/$docMetaId/$docTypeSetupId/$empId';
  }
}
class ProfileRepository{
  static String getEmployeeId = '/employee-offers/GetEmployeeIdByEmail';
  static String employees = '/employees';
  static String employeeAttachProfileImage = '/employees/attach-photobase64';
  static String patientVisits = '/patient-visits/clinician';
  static String visitdetaiils = '/patient-visits';

  // Time Off
  static String leaveType = '/leave-types';
  static String timeOffTypes = '/time-off-types';
  static String addTimeOffRequest = '/time-off';
  static String timeOffHistory = '/time-off';

  // My Earning
  static String myEarning = '/patient-visits/clinician/completed-visits-stats';



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
}
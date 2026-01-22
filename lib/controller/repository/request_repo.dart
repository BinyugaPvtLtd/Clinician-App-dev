class RequestTabRepo {
  static String requestList = "/patient-visits/request_visit";
  static String requestSchedules = "/patient-visits";

  static String getRequestAllData({required int clinicianId, required String visitStatus, required String patientName}) {
    return '$requestList/$clinicianId/$visitStatus/$patientName';
  }

  static String getRequestSchedule({required int visitId}) {
    return '$requestSchedules/$visitId/details-v2';
  }
}
class RequestTabRepo {
  static String requestList = "/patient-visits/request_visit";

  static String getRequestAllData({required int clinicianId, required String visitStatus, required String patientName}) {
    return '$requestList/$clinicianId/$visitStatus/$patientName';
  }
}
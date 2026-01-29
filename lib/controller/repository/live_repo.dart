class LiveMapRepo{
  static String liveMapDashboard = "/patient-visits/clinician/dashboard";
  static String liveMapDetails = "/patient-visits/clinician/active-patient";
  static String liveMapTodayList = "/patient-visits/clinician/today/list";
  static String viditData = "/patient-visits/todaysVisitData";
  static String getSeeRoute = "/patient-visits/see_route";

  static String getLiveMapDashboart() {
    return '$liveMapDashboard';
  }

  static String getLiveMapDetails({required int visitId}) {
    return '$liveMapDetails/$visitId';
  }
  static String getLiveMapTodayList() {
    return '$liveMapTodayList';
  }
  static String getVisitData({required int clinicianId}) {
    return '$viditData/$clinicianId';
  }
  static String getViewRoute({required int clinicianId, required int patientId}) {
    return '$getSeeRoute/$clinicianId/$patientId';
  }
}
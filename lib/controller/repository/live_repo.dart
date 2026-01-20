class LiveMapRepo{
  static String liveMapDashboard = "/patient-visits/clinician/dashboard";
  static String liveMapDetails = "/patient-visits/clinician/active-patient";
  static String liveMapTodayList = "/patient-visits/clinician/today/list";

  static String getLiveMapDashboart() {
    return '$liveMapDashboard';
  }

  static String getLiveMapDetails({required int visitId}) {
    return '$liveMapDetails/$visitId';
  }
  static String getLiveMapTodayList() {
    return '$liveMapTodayList';
  }
}
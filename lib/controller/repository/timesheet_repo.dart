class TimeSheetRepository{
  static String recordType = '/add-visit/record-types';
  static String visitMaster = '/visit-master';
  static String visitAdd = '/patient-visits/add-visit';
  static String timeSheetData = '/patient-visits/recordTypeVisits';
  static String patientName = '/patient-visits/patients-basic';

  static String getTimeSheetData({required String recordType, required String chooseData, required String search}) {
    return '$timeSheetData/$recordType/$chooseData/$search';
  }
  static String getPatientNameData({required String search}) {
    return '$patientName/$search';
  }
}
class TimeSheetRepository{
  static String recordType = '/add-visit/record-types';
  static String visitMaster = '/visits/visitList';
  static String visitAdd = '/employee-timesheet';
  static String timeSheetData = '/patient-visits/recordTypeVisits';
  static String patientName = '/patient-visits/patients-basic';
  static const String visitEdit = '/patient-visits/edit-visit';

  static String getTimeSheetData({required String recordType, required String chooseData, required String search,required int clinicianId}) {
    return '$timeSheetData/$recordType/$chooseData/$search/$clinicianId';
  }
  static String getPatientNameData({required String search}) {
    return '$patientName/$search';
  }

  static String editVisit({required int visitId}) {
    return '$visitAdd/$visitId';
  }
}
class CalenderRepository{
 static String lsitCalender = '/patient-visits';
 static String calenderData = '/patient-visits/calendar/';

  static String getListCalender({required String status, required String date}) {
      return "$lsitCalender/$status/$date/accepted";
    }

  static String getCalenderData({required String dateFrom, required String dateTo, required String empIds}) {
      return "$calenderData/$dateFrom/$dateTo/$empIds";
    }
}
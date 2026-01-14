class CalenderRepository{
 static String lsitCalender = '/patient-visits';

  static String getListCalender({required String status, required String date}) {
      return "$lsitCalender/$status/$date/accepted";
    }
}
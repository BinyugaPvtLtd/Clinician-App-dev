class CallingRepo{
  static String registerDevice = "/notifications/register-device";
  static String unRegisterdevice = "/notifications/unregister-device";
  static String callInitiate = "/calls/initiate";
  static String callHistory = "/calls/call-history";
  static String addParticipent = "/calls/add-participants";

  static String postRegisterDevice(){
    return "$registerDevice";
  }
  static String postUnRegisterDevice(){
    return "$unRegisterdevice";
  }

  static String postAddParticipent(){
    return "$addParticipent";
  }

  static String postCallInitiate(){
    return "$callInitiate";
  }

  static String getCallsLog({required String pageNr, required String pageSize, required String filterType}){
    return "$callHistory/${pageNr}/${pageSize}/${filterType}";
  }
}
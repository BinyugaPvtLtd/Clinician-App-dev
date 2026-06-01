class ApiAppConstant {
  static  String domain = 'https://dev.symmetry.care/';
  static const String authDomain = 'https://auth.symmetry.care/';
  static  String clinicialBaseUrl = '${domain}api/';
  static const String clinicialAuthBaseUrl = '${authDomain}api/';
  static const googleApiKey = "AIzaSyCw6mXOPCtbKn5i0bWcAcnfXCkb0y5G7Lg";

  static const int proHealth = 2;
  static const int clinician = 1;
  // 👇 pass appType to get dynamic base URL
  static String endPointByAlias(int appType,String aliasString) {
    switch (appType) {
      case clinician:
        domain = "https://dev.symmetry.care";
        return "https://dev.symmetry.care";
      case proHealth:
        domain = "https://dev.symmetry.care";
        return "https://dev.symmetry.care";
      default:
        domain = "https://$aliasString.symmetry.care";
        return "https://$aliasString.symmetry.care";
    }
  }
}

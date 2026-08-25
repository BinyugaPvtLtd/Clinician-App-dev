// ///dev
// class ApiAppConstant {
//   static  String domain = 'https://prohealth-dev.symmetry.care/';
//   static const String authDomain = 'https://auth.symmetry.care/';
//   static  String clinicialBaseUrl = '${domain}api/';
//   static const String clinicialAuthBaseUrl = '${authDomain}api/';
//   static const googleApiKey = "AIzaSyCw6mXOPCtbKn5i0bWcAcnfXCkb0y5G7Lg";
//
//   static const int proHealth = 2;
//   static const int clinician = 1;
//   //  pass appType to get dynamic base URL
//   static String endPointByAlias(int appType,String aliasString) {
//     switch (appType) {
//       case clinician:
//         domain = "https://prohealth-dev.symmetry.care";
//         return "https://prohealth-dev.symmetry.care";
//       case proHealth:
//         domain = "https://prohealth-dev.symmetry.care";
//         return "https://prohealth-dev.symmetry.care";
//       default:
//         domain = "https://prohealth-dev.symmetry.care/";
//         return "https://prohealth-dev.symmetry.care/";
//     }
//   }
// }



import 'package:flutter_dotenv/flutter_dotenv.dart';

///demo
class ApiAppConstant {
  // Falls back to the demo values below when .env is missing or a key isn't
  // set in it (e.g. a fresh checkout before `.env` is created locally).
  static  String domain = dotenv.env['DOMAIN'] ?? 'https://demo.symmetry.care/';
  static  String authDomain = dotenv.env['AUTH_DOMAIN'] ?? 'https://auth.symmetry.care/';
  // `domain` can change at runtime (endPointByAlias), so this must recompute
  // on every access instead of freezing the value seen at class-load time.
  static  String get clinicialBaseUrl => '${domain}api/';
  static  String get clinicialAuthBaseUrl => '${authDomain}api/';
  static  String googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? "AIzaSyCw6mXOPCtbKn5i0bWcAcnfXCkb0y5G7Lg";

  static const int proHealth = 2;
  static const int clinician = 1;
  //  pass appType to get dynamic base URL
  static String endPointByAlias(int appType,String aliasString) {
    switch (appType) {
      case clinician:
        domain = "https://demo.symmetry.care";
        return "https://demo.symmetry.care";
      case proHealth:
        domain = "https://demo.symmetry.care";
        return "https://demo.symmetry.care";
      default:
        domain = "https://demo.symmetry.care/";
        return "https://demo.symmetry.care/";
    }
  }
}



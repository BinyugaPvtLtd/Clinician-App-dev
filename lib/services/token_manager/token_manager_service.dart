import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TokenManager extends GetxService {
  static final _box = GetStorage();

  /// ---------- GETTERS ----------

  static String getAccessToken() {
    // final bool isOnBoardToken = getIsOnBoardingToken();
    // if (isOnBoardToken) {
    //   return _box.read("accessTokenRegister") ?? "";
    // }
    return _box.read("accessToken") ?? "";
  }
  static String getRefreshAccessToken() {
    // final bool isOnBoardToken = getIsOnBoardingToken();
    // if (isOnBoardToken) {
    //   return _box.read("accessTokenRegister") ?? "";
    // }
    return _box.read("refreshToken") ?? "";
  }

  static String getUserName() {
    return _box.read("userName") ?? "";
  }

  static String getEmail() {
    return _box.read("email") ?? "";
  }

  static int getDepartmentId() {
    return _box.read("departmentId") ?? 0;
  }

  static int getCompanyId() {
    return _box.read("companyId") ?? 0;
  }

  static int getUserId() {
    return _box.read("userId") ?? 0;
  }

  static bool getIsOnBoardingToken() {
    return _box.read("isOnBoarding") ?? false;
  }

  static String getFcmTokenRegister() {
    return _box.read("fcmTokenRegistered") ?? "";
  }

  static int getDepIdRegister() {
    return _box.read("departmentId") ?? 0;
  }

  static int getCompanyIdRegister() {
    return _box.read("companyIdRegister") ?? 0;
  }

  static String getEmailIdRegister() {
    return _box.read("emailIdRegistered") ?? "";
  }

  static int getUserIDRegister() {
    return _box.read("userID") ?? 0;
  }

  static String getUserStatus() {
    return _box.read("status") ?? "";
  }

  /// ---------- SETTERS ----------

  static Future<void> setAccessToken({
    required String token,
    required String refreshToken,
    required String username,
    required int departmentId,
    required int companyId,
    required int userID,
    required String email,
    required String userStatus,
  }) async {
    _box.write("accessToken", token);
    _box.write("refreshToken", refreshToken);
    _box.write("userName", username);
    _box.write("companyId", companyId);
    _box.write("userId", userID);
    _box.write("email", email);
    _box.write("departmentId", departmentId);
    _box.write("status", userStatus);
    _box.write("isOnBoarding", false);
  }

  static void setAccessRegisterToken({
    required String token,
    required String username,
    required int companyId,
    required String emailId,
    required int userID,
    required int depID,
  }) {
    _box.write("accessTokenRegister", token);
    _box.write("userNameRegister", username);
    _box.write("companyIdRegister", companyId);
    _box.write("emailIdRegistered", emailId);
    _box.write("userID", userID);
    _box.write("departmentId", depID);
    _box.write("isOnBoarding", true);
  }

  static void setFcmToken({required String fcmToken}) {
    _box.write("fcmTokenRegistered", fcmToken);
  }

  /// ---------- REMOVE / CLEAR ----------

  static void removeAccessToken() {
    _box.remove("accessToken");
  }

  static void removeAccessRegisterToken() {
    _box.remove("accessTokenRegister");
  }

  static void removeFCMToken() {
    _box.remove("fcmTokenRegistered");
  }

  static void clearAll() {
    _box.erase();
  }
}

import 'package:clinician_app/core/constant/app_string.dart';
import 'package:get/get.dart';

import '../model/request/request_data_model.dart';
import '../services/auth_api_services/auth_services.dart';
import '../services/token_manager/token_manager_service.dart';
import 'calling_controller.dart';

class AuthController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final callController = Get.put(CallingController());
  final isLoading = false.obs;
  final error = ''.obs;
 final RxString _otpError = ''.obs;
  String get otpError => _otpError.value;
  set otpError(String value) => _otpError.value = value;

  Future<ApiData> signInAuth({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.post('/auth/signIn', {
        "email": email,
        "password": password,
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
       // final data = res.data as Map<String, dynamic>;
        print("accessToken ${res.data["accessToken"]}");
        String token = res.data["accessToken"] ?? "";
        String username = "${res.data['user']['firstName']} ${res.data['user']['lastName']}";
        int departmentId = res.data['user']["departmentId"] ?? 0;
        int companyId = res.data['user']["company_id"] ?? 0;
        int userId = res.data['user']["userId"] ?? 0;
        String userEmail = res.data['user']["email"] ?? email;
        callController.initFCM(deviceName: 'MOBILE',);
        TokenManager.setAccessToken(
          token: token,
          username: username,
          departmentId: departmentId,
          companyId: companyId,
          userID: userId,
          email: userEmail,
        );

        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = "Login failed";
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// forgot password
  Future<ApiData> forgetPasswordAuth({
    required String email,
  }) async {
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.post('/auth/ForgotPassword', {
        "email": email,
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        // print("Auth OTP ::::: ${res.data}");
        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = res.statusMessage!;
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isLoading.value = false;
    }
  }
  Future<ApiData> verifyOTPAuth({
    required String email,
    required String otp,
  }) async {
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.post('/auth/verifyOtp', {
        "email": email,
        "otp": int.parse(otp),
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        print("accessToken ${res.data["accessToken"]}");
        String token = res.data["accessToken"] ?? "";
        String username = "${res.data['user']['firstName']} ${res.data['user']['lastName']}";
        int departmentId = res.data['user']["departmentId"] ?? 0;
        int companyId = res.data['user']["company_id"] ?? 0;
        int userId = res.data['user']["userId"] ?? 0;
        String userEmail = res.data['user']["email"] ?? email;

        TokenManager.setAccessToken(
          token: token,
          username: username,
          departmentId: departmentId,
          companyId: companyId,
          userID: userId,
          email: userEmail,
        );

        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = "Verify failed";
        _otpError.value = res.statusMessage!;
        return ApiData(
        success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      _otpError.value = 'Invalid OTP';
      return ApiData(
          success: false,
          message:"Invalid OTP",
          statusCode: 404
      );
    } finally {
      isLoading.value = false;
    }
  }
  Future<ApiData> changePasswordAuth({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      isLoading.value = true;
      error.value = '';

      final res = await _api.post('/auth/ResetPassword', {
        "email": email,
        "otp": int.parse(otp),
        "password": newPassword
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = res.statusMessage!;
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> updatePassword(String email, String otp) async {
  //   String newPassword = newPasswordController.text;
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //     var data = json.encode({
  //       "email": email,
  //       "verificationCode": otp,
  //       "newPassword": newPassword
  //     });
  //
  //     var response = await Dio().post(
  //       '${AppConfig.baseUrl}/auth/ResetPassword',
  //       // http://54.245.136.133:3000/auth/ResetPassword
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     if (response.statusCode == 200) {
  //       print(AppString.resetsuccessfully);
  //       print(json.encode(response.data));
  //       Navigator.pop(context as BuildContext);
  //     } else {
  //       print('Failed to change password: ${response.statusMessage}');
  //       print(json.encode(response.data));
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //   }
  // }

  // int _toInt(dynamic v) {
  //   if (v == null) return 0;
  //   if (v is int) return v;
  //   return int.tryParse(v.toString()) ?? 0;
  // }
}

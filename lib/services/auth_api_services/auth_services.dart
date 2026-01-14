import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../core/constant/api_app_constant.dart';
import '../token_manager/token_manager_service.dart';

class ApiService extends GetxService {
  late dio.Dio dioClient;
  String? _accessToken;

  @override
  void onInit() {
    super.onInit();

    dioClient = dio.Dio(
      dio.BaseOptions(
        baseUrl: ApiAppConstant.domain,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dioClient.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) async {
          _accessToken = await TokenManager.getAccessToken();

          options.headers = {
            'accept': 'application/json',
            if (_accessToken != null && _accessToken!.isNotEmpty)
              'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json',
          };

          if (kDebugMode) {
            debugPrint('REQUEST => ${options.method} ${options.uri}');
          }

          handler.next(options);
        },
        onError: (dio.DioException error, handler) async {
          final response = error.response;

          if (kDebugMode) {
            debugPrint('DIO ERROR => type=${error.type} message=${error.message}');
            debugPrint('DIO ERROR => status=${response?.statusCode} data=${response?.data}');
          }

          // ✅ If response is null → network/timeout/cancel etc.
          if (response == null) {
            // Important: do NOT resolve with response! (it's null)
            // Pass error forward so calling code can handle it.
            return handler.next(error);
          }

          // ✅ Safely read "message" if response.data is a Map
          String? message;
          final data = response.data;
          if (data is Map) {
            final m = data['message'];
            if (m != null) message = m.toString();
          }
          // ✅ Handle auth cases
          if (error.response!.data["message"] == "Unauthorized") {
             TokenManager.removeAccessToken();
            Get.offAll(() => LoginScreen());
            // Pass the error along (or you can return a custom response)
            return handler.next(error);
          }
          // Example specific case
          if (response.statusCode == 404 && message == 'User with ID 0 not found') {
            // do nothing or handle
          }
          if (error.response!.statusCode == 401) {
            print(error.response!.data);
          }
          // ✅ Do NOT use handler.resolve(response) unless you intentionally want to treat errors as success
          // Most apps should forward errors:
          return handler.next(error);
        },
      ),
    );
  }

  // ---------------- API METHODS ----------------

  Future<dio.Response> get(String path) {
    return dioClient.get(path);
  }

  Future<dio.Response> post(String path, Map<String, dynamic> data) {
    return dioClient.post(path, data: data);
  }

  Future<dio.Response> postList(String path, List data) {
    return dioClient.post(path, data: data);
  }

  Future<dio.Response> patch(String path, Map<String, dynamic> data) {
    return dioClient.patch(path, data: data);
  }

  Future<dio.Response> patchList(String path, List data) {
    return dioClient.patch(path, data: data);
  }

  Future<dio.Response> delete(String path) {
    return dioClient.delete(path);
  }
}


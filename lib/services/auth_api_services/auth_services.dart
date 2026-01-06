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
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json',
          };

          if (kDebugMode) {
            print('REQUEST => ${options.method} ${options.uri}');
          }

          handler.next(options);
        },
        onError: (error, handler) async {
          final response = error.response;
          print('error response ${response?.data}');

          if (response != null) {
            final message = response.data?['message'];

            if (message == "Unauthorized") {
              TokenManager.removeAccessToken();
              Get.offAll(()=> LoginScreen());
            }

            if (response.statusCode == 404 &&
                message == 'User with ID 0 not found') {
              TokenManager.removeAccessToken();
              Get.offAll(()=> LoginScreen());
            }

            if (response.statusCode == 401) {
              print("401 Unauthorized");
            }
          }

          handler.resolve(error.response!);
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

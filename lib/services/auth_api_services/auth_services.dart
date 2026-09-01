// import 'package:clinician_app/pages/auth/login_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
//
// import '../../controller/profile_controller.dart';
// import '../../core/constant/api_app_constant.dart';
// import '../token_manager/token_manager_service.dart';
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Shared interceptor builder
// // ─────────────────────────────────────────────────────────────────────────────
// dio.InterceptorsWrapper buildAuthInterceptor(dio.Dio client) {
//   bool _isRefreshing        = false;
//   bool _isNavigatingToLogin = false;
//
//
//   // ✅ Bare Dio created locally — no GetX registration needed, no interceptors
//   final dio.Dio _bareDio = dio.Dio(
//     dio.BaseOptions(
//       baseUrl:        ApiAppConstant.authDomain,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ),
//   );
//
//   // Clears tokens and navigates to login exactly once
//   Future<void> forceLogout(
//       dio.ErrorInterceptorHandler handler,
//       dio.DioException error,
//       ) async {
//      TokenManager.removeAccessToken();
//     if (!_isNavigatingToLogin) {
//       _isNavigatingToLogin = true;
//       Get.offAll(() => LoginScreen())?.then((_) => _isNavigatingToLogin = false);
//     }
//     handler.next(error);
//   }
//
//   return dio.InterceptorsWrapper(
//
//     // ── attach latest token on every request ──────────────────────────────
//     onRequest: (options, handler) async {
//       final token = await TokenManager.getAccessToken();
//       options.headers = {
//         'accept':       'application/json',
//         'Content-Type': 'application/json',
//         if (token != null && token.isNotEmpty)
//           'Authorization': 'Bearer $token',
//       };
//       if (kDebugMode) debugPrint('REQUEST => ${options.method} ${options.uri}');
//       handler.next(options);
//     },
//
//     // ── handle errors ──────────────────────────────────────────────────────
//     onError: (dio.DioException error, handler) async {
//       final response = error.response;
//
//       if (kDebugMode) {
//         debugPrint('DIO ERROR => status=${response?.statusCode} | data=${response?.data}');
//       }
//
//       // No response → network/timeout/cancel → pass through
//       if (response == null) return handler.next(error);
//
//       // Safely extract message
//       String? message;
//       if (response.data is Map) {
//         final m = (response.data as Map)['message'];
//         if (m != null) message = m.toString();
//       }
//
//       final isUnauthorized =
//           response.statusCode == 401 || message == 'Unauthorized';
//
//       // Another request got 401 while refresh is already in progress → wait
//       if (isUnauthorized && _isRefreshing) {
//         return handler.next(error);
//       }
//
//       // ── 401 → refresh via local bare Dio (zero interceptors, no loop) ────
//       if (isUnauthorized && !_isRefreshing) {
//         _isRefreshing = true;
//
//         try {
//           final refreshToken = await TokenManager.getRefreshAccessToken();
//
//           if (refreshToken == null || refreshToken.trim().isEmpty) {
//             if (kDebugMode) debugPrint('No refresh token found → forcing logout');
//             return forceLogout(handler, error);
//           }
//
//           dio.Response refreshRes;
//           try {
//             // ✅ Use _bareDio directly — no GetX, no interceptor, no loop
//             refreshRes = await _bareDio.post(
//               '/auth/refresh',
//               data: {'refreshToken': refreshToken},
//               options: dio.Options(
//                 headers: {
//                   'accept':        'application/json',
//                   'Content-Type':  'application/json',
//                   'Authorization': 'Bearer $refreshToken', // ✅ sent immediately
//                 },
//                 // ✅ Treat 401 as a normal response so catch block handles it
//                 validateStatus: (status) => true,
//               ),
//             );
//           } catch (e) {
//             if (kDebugMode) debugPrint('Refresh network error: $e');
//             return forceLogout(handler, error);
//           }
//
//           if (kDebugMode) debugPrint('Refresh response status: ${refreshRes.statusCode}');
//
//           if (refreshRes.statusCode == 200 || refreshRes.statusCode == 201) {
//             print("New acess token received from refresh endpoint");
//             final d               = refreshRes.data;
//             final newAccessToken  = d['accessToken']  ?? '';
//             final newRefreshToken = d['refreshToken']  ?? '';
//             // final user            = (d['user'] as Map<String, dynamic>?) ?? {};
//
//             if (newAccessToken.isEmpty) {
//               if (kDebugMode) debugPrint('Empty access token in refresh response → logout');
//               return forceLogout(handler, error);
//             }
//
//             // ✅ Persist tokens BEFORE retry
//               await TokenManager.setAccessToken(
//               token:        newAccessToken,
//               refreshToken: newRefreshToken,
//               username:     '${d['user']['firstName'] ?? ''} ${d['user']['lastName'] ?? ''}',
//               departmentId: d['user']['departmentId']  ?? 0,
//               companyId:    d['user']['company_id']   ?? 0,
//               userID:       d['user']['userId']        ?? 0,
//               email:        d['user']['email']         ?? '',
//             );
//
//
//             if (kDebugMode) debugPrint('Token refreshed ✅ → retrying: ${error.requestOptions.path}');
//
//             // ✅ Retry original request with new token explicitly in header
//             final retryResponse = await client.request(
//               error.requestOptions.path,
//               data:            error.requestOptions.data,
//               queryParameters: error.requestOptions.queryParameters,
//               options: dio.Options(
//                 method: error.requestOptions.method,
//                 headers: {
//                   'accept':        'application/json',
//                   'Content-Type':  'application/json',
//                   'Authorization': 'Bearer $newAccessToken',
//                 },
//               ),
//             );
//
//             return handler.resolve(retryResponse);
//
//           } else {
//             // Refresh endpoint returned non-2xx (e.g. 401 = refresh token expired)
//             if (kDebugMode) debugPrint('Refresh failed with status ${refreshRes.statusCode} → logout');
//             try {
//               await _bareDio.post(
//                 '/auth/logout',
//                 data: {'refreshToken': refreshToken},
//                 options: dio.Options(validateStatus: (s) => true),
//               );
//             } catch (_) {}
//             return forceLogout(handler, error);
//           }
//
//         } catch (e) {
//           if (kDebugMode) debugPrint('Unexpected refresh error: $e');
//           return forceLogout(handler, error);
//         } finally {
//           _isRefreshing = false;
//         }
//       }
//
//       // ── 404 special case ─────────────────────────────────────────────────
//       if (response.statusCode == 404 && message == 'User with ID 0 not found') {
//         return forceLogout(handler, error);
//       }
//
//       return handler.next(error);
//     },
//   );
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // ApiService  (main domain)
// // ─────────────────────────────────────────────────────────────────────────────
// class ApiService extends GetxService {
//   late dio.Dio dioClient;
//
//   @override
//   void onInit() {
//     super.onInit();
//     dioClient = dio.Dio(dio.BaseOptions(
//       baseUrl:        ApiAppConstant.domain,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ));
//     dioClient.interceptors.add(buildAuthInterceptor(dioClient));
//   }
//
//   Future<dio.Response> get(String path)                              => dioClient.get(path);
//   Future<dio.Response> post(String path, Map<String, dynamic> data)  => dioClient.post(path, data: data);
//   Future<dio.Response> postList(String path, List data)              => dioClient.post(path, data: data);
//   Future<dio.Response> patch(String path, Map<String, dynamic> data) => dioClient.patch(path, data: data);
//   Future<dio.Response> patchList(String path, List data)             => dioClient.patch(path, data: data);
//   Future<dio.Response> delete(String path)                           => dioClient.delete(path);
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // ApiAuthService  (auth domain)
// // ─────────────────────────────────────────────────────────────────────────────
// class ApiAuthService extends GetxService {
//   late dio.Dio dioClient;
//
//   @override
//   void onInit() {
//     super.onInit();
//     dioClient = dio.Dio(dio.BaseOptions(
//       baseUrl:        ApiAppConstant.authDomain,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ));
//     dioClient.interceptors.add(buildAuthInterceptor(dioClient));
//   }
//
//   Future<dio.Response> get(String path)                              => dioClient.get(path);
//   Future<dio.Response> post(String path, Map<String, dynamic> data)  => dioClient.post(path, data: data);
//   Future<dio.Response> postList(String path, List data)              => dioClient.post(path, data: data);
//   Future<dio.Response> patch(String path, Map<String, dynamic> data) => dioClient.patch(path, data: data);
//   Future<dio.Response> patchList(String path, List data)             => dioClient.patch(path, data: data);
//   Future<dio.Response> delete(String path)                           => dioClient.delete(path);
// }

import 'package:clinician_app/pages/auth/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../controller/profile_controller.dart';
import '../../core/constant/api_app_constant.dart';
import '../token_manager/token_manager_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Shared interceptor builder
// ─────────────────────────────────────────────────────────────────────────────
dio.InterceptorsWrapper buildAuthInterceptor(dio.Dio client) {
  bool _isRefreshing        = false;
  bool _isNavigatingToLogin = false;

  // ✅ Bare Dio created locally — no GetX registration needed, no interceptors
  final dio.Dio _bareDio = dio.Dio(
    dio.BaseOptions(
      baseUrl:        ApiAppConstant.authDomain,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Clears tokens and navigates to login exactly once
  Future<void> forceLogout(
      dio.ErrorInterceptorHandler handler,
      dio.DioException error,
      ) async {
    TokenManager.removeAccessToken();
    if (!_isNavigatingToLogin) {
      _isNavigatingToLogin = true;
      Get.offAll(() => LoginScreen())?.then((_) => _isNavigatingToLogin = false);
    }
    handler.next(error);
  }

  return dio.InterceptorsWrapper(

    // ── attach latest token on every request ──────────────────────────────
    onRequest: (options, handler) async {
      final token = await TokenManager.getAccessToken();
      options.headers = {
        'accept':       'application/json',
        'Content-Type': 'application/json',
        if (token != null && token.isNotEmpty)
          'Authorization': 'Bearer $token',
      };
      if (kDebugMode) debugPrint('REQUEST => ${options.method} ${options.uri}');
      handler.next(options);
    },

    // ── handle errors ──────────────────────────────────────────────────────
    onError: (dio.DioException error, handler) async {
      final response = error.response;

      if (kDebugMode) {
        debugPrint('DIO ERROR => status=${response?.statusCode} | data=${response?.data}');
      }

      // No response → network/timeout/cancel → pass through
      if (response == null) return handler.next(error);

      // Safely extract message
      String? message;
      if (response.data is Map) {
        final m = (response.data as Map)['message'];
        if (m != null) message = m.toString();
      }

      final isUnauthorized =
          response.statusCode == 401 || message == 'Unauthorized';

      // Another request got 401 while refresh is already in progress → wait
      if (isUnauthorized && _isRefreshing) {
        return handler.next(error);
      }

      // ── 401 → refresh via local bare Dio (zero interceptors, no loop) ────
      if (isUnauthorized && !_isRefreshing) {
        _isRefreshing = true;

        try {
          final refreshToken = await TokenManager.getRefreshAccessToken();

          if (refreshToken == null || refreshToken.trim().isEmpty) {
            if (kDebugMode) debugPrint('No refresh token found → forcing logout');
            return forceLogout(handler, error);
          }

          dio.Response refreshRes;
          try {
            // ✅ Use _bareDio directly — no GetX, no interceptor, no loop
            refreshRes = await _bareDio.post(
              '/auth/refresh',
              data: {'refreshToken': refreshToken},
              options: dio.Options(
                headers: {
                  'accept':        'application/json',
                  'Content-Type':  'application/json',
                  'Authorization': 'Bearer $refreshToken',
                },
                validateStatus: (status) => true,
              ),
            );
          } catch (e) {
            if (kDebugMode) debugPrint('Refresh network error: $e');
            return forceLogout(handler, error);
          }

          if (kDebugMode) debugPrint('Refresh response status: ${refreshRes.statusCode}');

          if (refreshRes.statusCode == 200 || refreshRes.statusCode == 201) {
            print("New access token received from refresh endpoint");
            final d               = refreshRes.data;
            final newAccessToken  = d['accessToken']  ?? '';
            final newRefreshToken = d['refreshToken'] ?? '';

            if (newAccessToken.isEmpty) {
              if (kDebugMode) debugPrint('Empty access token in refresh response → logout');
              return forceLogout(handler, error);
            }

            // ✅ Persist tokens BEFORE retry
            await TokenManager.setAccessToken(
              token:        newAccessToken,
              refreshToken: newRefreshToken,
              username:     '${d['user']['firstName'] ?? ''} ${d['user']['lastName'] ?? ''}',
              departmentId: d['user']['departmentId']  ?? 0,
              companyId:    d['user']['company_id']   ?? 0,
              userID:       d['user']['userId']        ?? 0,
              email:        d['user']['email']         ?? '',
              userStatus:   d['user']['status']        ?? ''
            );

            // ✅ Call ProfileController after successful token refresh
            try {
              final ProfileController profileController =
              Get.isRegistered<ProfileController>()
                  ? Get.find<ProfileController>()
                  : Get.put(ProfileController());
              profileController.fetchRecordType();
            } catch (e) {
              if (kDebugMode) debugPrint('ProfileController error after refresh: $e');
            }

            if (kDebugMode) debugPrint('Token refreshed ✅ → retrying: ${error.requestOptions.path}');

            // ✅ Retry original request with new token explicitly in header
            final retryResponse = await client.request(
              error.requestOptions.path,
              data:            error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
              options: dio.Options(
                method: error.requestOptions.method,
                headers: {
                  'accept':        'application/json',
                  'Content-Type':  'application/json',
                  'Authorization': 'Bearer $newAccessToken',
                },
              ),
            );

            return handler.resolve(retryResponse);

          } else {
            // Refresh endpoint returned non-2xx (e.g. 401 = refresh token expired)
            if (kDebugMode) debugPrint('Refresh failed with status ${refreshRes.statusCode} → logout');
            try {
              await _bareDio.post(
                '/auth/logout',
                data: {'refreshToken': refreshToken},
                options: dio.Options(validateStatus: (s) => true),
              );
            } catch (_) {}
            return forceLogout(handler, error);
          }

        } catch (e) {
          if (kDebugMode) debugPrint('Unexpected refresh error: $e');
          return forceLogout(handler, error);
        } finally {
          _isRefreshing = false;
        }
      }

      // ── 404 special case ─────────────────────────────────────────────────
      if (response.statusCode == 404 && message == 'User with ID 0 not found') {
        return forceLogout(handler, error);
      }

      return handler.next(error);
    },
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// ApiService  (main domain)
// ─────────────────────────────────────────────────────────────────────────────
class ApiService extends GetxService {
  late dio.Dio dioClient;

  @override
  void onInit() {
    super.onInit();
    dioClient = dio.Dio(dio.BaseOptions(
      baseUrl:        ApiAppConstant.domain,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    dioClient.interceptors.add(buildAuthInterceptor(dioClient));
  }

  // ApiAppConstant.domain changes at runtime once the user picks a company
  // alias (post-email-lookup), but dioClient's baseUrl was only captured once
  // in onInit(). Re-sync it before every request instead of relying on that
  // stale snapshot.
  dio.Dio get _client {
    dioClient.options.baseUrl = ApiAppConstant.domain;
    return dioClient;
  }

  Future<dio.Response> get(String path)                              => _client.get(path);
  Future<dio.Response> getWithQueryParam({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) =>
      _client.get(
        path,
        queryParameters: queryParameters,
        options: dio.Options(headers: headers),
      );
  Future<dio.Response> post(String path, Map<String, dynamic> data)  => _client.post(path, data: data);
  Future<dio.Response> postList(String path, List data)              => _client.post(path, data: data);
  Future<dio.Response> patch(String path, Map<String, dynamic> data) => _client.patch(path, data: data);
  Future<dio.Response> patchList(String path, List data)             => _client.patch(path, data: data);
  Future<dio.Response> delete(String path)                           => _client.delete(path);
  Future<dio.Response> patchNoRequest({required String path, Map? data})     => _client.patch(path, data: data);
  Future<dio.Response> getBytes({required String path}) => _client.get(
    path,
    options: dio.Options(responseType: dio.ResponseType.bytes),
  );
  Future<dio.Response> deleteWithData({required String path, Map? data}) async {
    String token = await TokenManager.getAccessToken();
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await _client.delete(
      '${ApiAppConstant.authDomain}$path',
      data: data,
      options: dio.Options(
        headers: headers,
      ),
    );
    return response;
  }
  Future<dio.Response> postWithFormData(
      {required String path, required FormData formData}) async {
    var response = await _client.post(
      path,
      data: formData,
    );
    //  print(path);
    // print("Prachi POST:::::::::${response}");
    return response;
  }
  // Future<Response> patchList({required String path, required List data}) => dioClient.patch(path, data: data);
}

// ─────────────────────────────────────────────────────────────────────────────
// ApiAuthService  (auth domain)
// ─────────────────────────────────────────────────────────────────────────────
class ApiAuthService extends GetxService {
  late dio.Dio dioClient;

  @override
  void onInit() {
    super.onInit();
    dioClient = dio.Dio(dio.BaseOptions(
      baseUrl:        ApiAppConstant.authDomain,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    dioClient.interceptors.add(buildAuthInterceptor(dioClient));
  }

  Future<dio.Response> get(String path)                              => dioClient.get(path);
  Future<dio.Response> post(String path, Map<String, dynamic> data)  => dioClient.post(path, data: data);
  Future<dio.Response> postList(String path, List data)              => dioClient.post(path, data: data);
  Future<dio.Response> patch(String path, Map<String, dynamic> data) => dioClient.patch(path, data: data);
  Future<dio.Response> patchList(String path, List data)             => dioClient.patch(path, data: data);
  Future<dio.Response> delete(String path)                           => dioClient.delete(path);
}
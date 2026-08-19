import 'package:get/get.dart';
import '../pages/auth/login_screen.dart';
import '../pages/home/home_screen.dart';
import '../services/token_manager/token_manager_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () async{
      _checkAuth();
      // Get.put(SplashController());
    });

  }

  void _checkAuth() {
    final authToken = TokenManager.getAccessToken();

    print('Auth token: $authToken');

    if (authToken.isEmpty) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}

import 'package:get/get.dart';
import '../pages/auth/login_screen.dart';
import '../pages/home/home_screen.dart';
import '../services/token_manager/token_manager_service.dart';

class SplashController extends GetxController {
  /// Set to true before accepting a call so the 3-second timer never
  /// overrides the incoming-call navigation, regardless of API speed.
  bool _skipNavigation = false;

  void skipNavigation() {
    _skipNavigation = true;
  }

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

    // Skip if a call accept is in progress OR we've already left the splash route.
    if (_skipNavigation || Get.currentRoute != '/') return;

    if (authToken.isEmpty) {
      // Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}

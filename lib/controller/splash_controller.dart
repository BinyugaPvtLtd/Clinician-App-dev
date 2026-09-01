import 'package:get/get.dart';
import '../core/constant/api_app_constant.dart';
import '../pages/auth/login_screen.dart';
import '../pages/home/home_screen.dart';
import '../services/token_manager/token_manager_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Future.delayed(Duration(seconds: 3), () async{
    //   checkAuth();
    //   // Get.put(SplashController());
    // });

  }

  Future<void> checkAuth() async{
    final authToken = TokenManager.getAccessToken();
    final companyAlias = TokenManager.getCompanyAlias();

    print('Auth token: $authToken');

    if (authToken.isEmpty) {
      Get.offAll(() => LoginScreen());
    } else {
      ApiAppConstant.endPointByAlias(3, companyAlias);
      Get.offAll(() => HomeScreen());
    }
  }
}

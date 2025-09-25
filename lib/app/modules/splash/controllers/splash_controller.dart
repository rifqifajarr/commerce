import 'package:commerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void _navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.HOME);
    });
  }

  @override
  void onReady() {
    super.onReady();
    _navigateToHome();
  }
}

import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5));
    var token = Storage.getToken();
    var role = Storage.getRole();
    if (token != null) {
      if (role != "admin") {
        Get.offNamed(Routes.MAIN);
      } else {
        Get.offNamed(Routes.ADMIN_MAIN);
      }
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}

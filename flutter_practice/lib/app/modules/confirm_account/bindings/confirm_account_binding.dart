import 'package:get/get.dart';

import '../controllers/confirm_account_controller.dart';

class ConfirmAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmAccountController>(
      () => ConfirmAccountController(),
    );
  }
}

import 'package:flutter_practice/app/models/notification.dart';
import 'package:flutter_practice/app/storage.dart';

import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  NotificationResponse? notificationResponse;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getNotification() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getNotifications');

      var response = await http.post(url, body: {"token": Storage.getToken()});
      notificationResponse = notificationResponseFromJson(response.body);
      update();

      if (notificationResponse?.success ?? false) {
        // showCustomSnackBar(
        //   message: notificationResponse?.message ?? '',
        //   isSuccess: true,
        // );
      } else {
        Get.showSnackbar(GetSnackBar(
          message: notificationResponse?.message ?? '',
        ));
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(GetSnackBar(
        message: 'Something went wrong',
      ));
    }
  }

  void increment() => count.value++;
}

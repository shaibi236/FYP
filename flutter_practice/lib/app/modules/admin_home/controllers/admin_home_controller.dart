import 'package:flutter/material.dart';
import 'package:flutter_practice/app/models/stats.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminHomeController extends GetxController {
  StatsResponse? statsResponse;

  @override
  void onInit() {
    super.onInit();
    getStats();
  }

  Future<void> getStats() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getstats.php');

      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = statsResponseFromJson(body);

      if (result.success ?? false) {
        statsResponse = result;
        update();
      } else {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

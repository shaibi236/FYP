import 'package:flutter/material.dart';
import 'package:flutter_practice/app/models/profile.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  ProfileResponse? profileResponse;

  get user => null;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getMyDetails.php');

      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = profileResponseFromJson(body);

      if (result.success ?? false) {
        profileResponse = result;
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

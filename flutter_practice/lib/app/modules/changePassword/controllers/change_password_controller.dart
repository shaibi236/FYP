import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController

  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> onchangePassword() async {
    if (formKey.currentState!.validate()) {
      var url = Uri.http(ipAddress, 'pahuna_wheels/changePassword.php');
      var response = await http.post(url, body: {
        "token": Storage.getToken(),
        'old_password': oldPasswordController.text,
        'new_password': newPasswordController.text,
        'confirm_password': confirmPasswordController.text,
      });

      var body = response.body;
      print(body);
      var result = jsonDecode(body);

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: ' password changed Successfully',
          message: result['message'],
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: 'failed to change password',
          message: result['message'],
        ));
      }
    }
  }
}

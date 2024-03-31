// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  //TODO: Implement ForgetPasswordController
  Future<void> onforgetPassword() async {
    if (formKey.currentState!.validate()) {
      var url = Uri.http(ipAddress, 'pahuna_wheels/forgetPassword.php');
      var response = await http.post(url, body: {
        'email': emailController.text,
      });

      var body = response.body;
      print(body);
      var result = jsonDecode(body);

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: ' password reset link sent to your email',
          message: result['message'],
        ));
        Get.toNamed(Routes.CONFIRM_ACCOUNT);
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: 'failed to sent reset code ',
          message: result['message'],
        ));
      }
    }
  }
}

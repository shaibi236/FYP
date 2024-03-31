import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onLogin() async {
    if (formKey.currentState!.validate()) {
      var url = Uri.http(ipAddress, 'pahuna_wheels/auth/login.php');
      var response = await http.post(url, body: {
        'email': emailController.text,
        'password': passwordController.text,
      });

      var body = response.body;
      print(body);
      var result = jsonDecode(body);

      if (result['success']) {
        await Storage.setToken(result['token']);
        await Storage.setRole(result['role']);
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: 'Logged in Successfully',
          message: result['message'],
        ));

        if (result['role'] == 'admin') {
          Get.offAllNamed(Routes.ADMIN_MAIN);
        } else {
          Get.offAllNamed(Routes.MAIN);
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(
            seconds: 2,
          ),
          title: 'Login failed',
          message: result['message'],
        ));
      }
    }
  }
}

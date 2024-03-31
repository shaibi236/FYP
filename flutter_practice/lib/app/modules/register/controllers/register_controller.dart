import 'dart:convert';
import 'package:flutter_practice/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> onRegister() async {
    if (formKey.currentState!.validate()) {
      var url = Uri.http(ipAddress, 'pahuna_wheels/auth/register.php');
      var response = await http.post(url, body: {
        'email': emailController.text,
        'password': passwordController.text,
        'fullName': fullNameController.text,
      });

      var body = response.body;
      print(body);
      var result = jsonDecode(body);

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          title: 'Registration complete',
          message: result['message'],
        ));
        Get.close(1);
      } else {
        Get.showSnackbar(GetSnackBar(
          title: 'Registration failed',
          message: result['message'],
        ));
      }
    }
  }
}

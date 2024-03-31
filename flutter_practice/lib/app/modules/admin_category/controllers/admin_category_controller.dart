// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/app/modules/admin_category/views/admin_category_view.dart';

import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/app/storage.dart';

import '../../home/controllers/home_controller.dart';


class AdminCategoryController extends GetxController {
  var categoryController = TextEditingController();
  var key = GlobalKey<FormState>();
  void addCategory() async {
    if (key.currentState!.validate()) {
      var url = Uri.http(ipAddress, 'pahuna_wheels/addCategory.php');
      var response = await http.post(url, body: {
        'token': Storage.getToken(),
        'category_name': categoryController.text,
      });
      var body = response.body;
      var result = jsonDecode(body);

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          title: 'Category added successfully',
           message: result['message'],
        ));
        Get.close(1);
        categoryController.clear();

        Get.find<HomeController>().getCategories();
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          title: 'Failed to add category',
          // message: result['message'],
        ));
      }
    }
  }
}

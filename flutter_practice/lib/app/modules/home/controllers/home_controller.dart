// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_practice/app/models/profile.dart';
import 'package:flutter_practice/app/models/vehicles.dart';
import 'package:flutter_practice/app/models/category.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Vehiclesresponse? vehiclesResponse;
  CategoryResponse? categoryResponse;
  ProfileResponse? profileResponse;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getVehicles();
  }

  Future<void> getVehicles() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getVehicles.php');
      await Future.delayed(const Duration(seconds: 1));
      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = vehiclesresponseFromJson(body);

      if (result.success) {
        vehiclesResponse = result;
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

  Future<void> getCategories() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getCategories.php');
      // await Future.delayed(const Duration(seconds: 1));
      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = categoryResponseFromJson(body);

      if (result.success ?? false) {
        categoryResponse = result;
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

  void updateCategoryStatus(
    String categoryId,
  ) async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/updateCategory.php');
      var response = await http.post(url,
          body: {'category_id': categoryId, 'token': Storage.getToken()});

      var body = response.body;

      var result = jsonDecode(body);

      if (result['success'] ?? false) {
        // Get.close(1);
        Get.back();
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          message: result['message'],
          duration: const Duration(seconds: 2),
        ));
        // Get.close(1);
        await getCategories();
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

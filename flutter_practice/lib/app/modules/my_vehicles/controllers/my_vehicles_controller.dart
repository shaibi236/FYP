import 'package:flutter/material.dart';
import 'package:flutter_practice/app/models/vehicles.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyVehiclesController extends GetxController {
  Vehiclesresponse? vehiclesResponse;

  @override
  void onInit() {
    super.onInit();
    getMyVehicles();
  }

  Future<void> getMyVehicles() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getMyVehicles.php');

      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = Vehiclesresponse.fromJson(body as Map<String, dynamic>);

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
}

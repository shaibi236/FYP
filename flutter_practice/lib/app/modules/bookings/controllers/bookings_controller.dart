import 'package:flutter/material.dart';
import 'package:flutter_practice/app/models/bookings.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookingsController extends GetxController {
  BookingResponse? bookingResponse;

  @override
  void onInit() {
    super.onInit();
    getBookings();
  }

  Future<void> getBookings() async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/getBookings.php');
      await Future.delayed(const Duration(seconds: 1));
      var response = await http.post(url, body: {'token': Storage.getToken()});

      var body = response.body;

      var result = bookingResponseFromJson(body);

      if (result.success ?? false) {
        bookingResponse = result;
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

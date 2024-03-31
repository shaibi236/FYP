import 'dart:convert';

import 'package:flutter_practice/app/models/vehicles.dart';
import 'package:flutter_practice/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:khalti_flutter/khalti_flutter.dart';

class DetailVehicleController extends GetxController {
  var vehicleRating = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    vehicleRating.value =
        double.tryParse((Get.arguments as Vehicle).rating) ?? 0.0;
  }

  void bookVehicle() async {
    try {
      DateTimeRange? dateRange = await showDateRangePicker(
          context: Get.context!,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 30)));

      if (dateRange == null) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: Colors.red,
          message: 'Start and End Date is required',
          duration: Duration(seconds: 2),
        ));
        return;
      }

      var url = Uri.http(ipAddress, 'pahuna_wheels/makeBooking.php');
      var vehicle = Get.arguments as Vehicle;
      var response = await http.post(url, body: {
        'token': Storage.getToken(),
        'vehicle_id': vehicle.vehicleId,
        'start_date': dateRange.start.toIso8601String(),
        'end_date': dateRange.end.toIso8601String(),
      });

      var body = response.body;

      var result = jsonDecode(body);

      if (result['success'] ?? false) {
        var amount = (dateRange.end.difference(dateRange.start).inDays + 1) *
            (double.tryParse(vehicle.perDayPrice) ?? 0);
        startPayment(
            (amount * 100).toInt(), vehicle.name, result['booking_id']);
        // Get.close(1);
        // Get.back();
        // Get.showSnackbar(GetSnackBar(
        //   backgroundColor: Colors.green,
        //   message: result['message'],
        //   duration: const Duration(seconds: 2),
        // ));
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.red,
          message: result['message'] ?? 'Failed to book vehicle',
          duration: const Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void giveRating(double rating, String vehicleId) async {
    try {
      var url = Uri.http(ipAddress, 'pahuna_wheels/giveRating.php');

      var response = await http.post(url, body: {
        'token': Storage.getToken(),
        'vehicle_id': vehicleId,
        'rating': rating.toString(),
      });

      var body = response.body;

      var result = jsonDecode(body);

      if (result['success'] ?? false) {
        Get.close(1);

        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          message: result['message'] ?? 'Rating added successfully',
          duration: const Duration(seconds: 2),
        ));
        Get.find<HomeController>().getVehicles();
        double? rating = double.tryParse(result['rating']);
        if (rating != null) {
          vehicleRating.value = rating;
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void startPayment(int amount, String vehicleName, int bookingId) async {
    try {
      var config = PaymentConfig(
          amount: amount,
          productIdentity: bookingId.toString(),
          productName: vehicleName);
      KhaltiScope.of(Get.context!).pay(
          preferences: [
            PaymentPreference.khalti,
          ],
          config: config,
          onSuccess: (v) async {
            var url = Uri.http(ipAddress, 'pahuna_wheels/makePayment.php');

            var response = await http.post(url, body: {
              'token': Storage.getToken(),
              'booking_id': bookingId.toString(),
              'amount': amount.toString(),
            });

            var body = response.body;

            var result = jsonDecode(body);

            if (result['success'] ?? false) {
              Get.close(1);
              Get.back();
              Get.showSnackbar(const GetSnackBar(
                backgroundColor: Colors.green,
                message: 'Vehicle booked successfully',
                duration: Duration(seconds: 2),
              ));
            } else {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: Colors.red,
                message: result['message'] ?? 'Failed to book vehicle',
                duration: const Duration(seconds: 2),
              ));
            }
          },
          onFailure: (v) {
            Get.showSnackbar(const GetSnackBar(
              backgroundColor: Colors.red,
              message: 'Failed to book vehicle',
              duration: Duration(seconds: 2),
            ));
          });
    } catch (e) {
      print(e.toString());
    }
  }
}

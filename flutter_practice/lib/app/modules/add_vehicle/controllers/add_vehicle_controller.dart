import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_practice/app/storage.dart';
import 'package:flutter_practice/constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../home/controllers/home_controller.dart';


class AddVehicleController extends GetxController {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
   var speedController = TextEditingController();
    var fuelTypeController= TextEditingController();
     var seatsController = TextEditingController();

  XFile? image;
  var imageError = false.obs;
  String? selectedCategoryId;
  var formkey = GlobalKey<FormState>();

  Future<void> addVehicle() async {
    if (image == null) {
      imageError.value = true;
    }
    if (formkey.currentState != null && formkey.currentState!.validate() && image != null) {

      var url = Uri.http(ipAddress, 'pahuna_wheels/addVehicle.php');
      var request = http.MultipartRequest('POST', url);
      request.fields['token'] = Storage.getToken();
      request.fields['vehicle_name'] = titleController.text;
      request.fields['description'] = descriptionController.text;
      request.fields['per_day_price'] = priceController.text;
      request.fields['category_id'] = selectedCategoryId!;
      request.files
          .add(await http.MultipartFile.fromPath('image', image!.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var body = response.body;
      var result = jsonDecode(body);

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          title: 'Vehicle added successfully',
          message: result['message'],
        ));
        Get.close(1);

        Get.find<HomeController>().getVehicles();
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          title: 'Vehicle add failed',
          message: result['message'],
        ));
      }
    }
  }

  void onPickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    imageError.value = false;
  }
}

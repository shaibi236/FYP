import 'package:flutter_practice/app/models/category.dart';
import 'package:flutter_practice/app/models/vehicles.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';



class SingleCategoryController extends GetxController {
  List<Vehicle> vehicles = [];

  @override
  void onInit() {
    super.onInit();
    var controller = Get.find<HomeController>();
    var totalVehicles = controller.vehiclesResponse?.vehicles ?? [];
    var category = Get.arguments as Category;
    for (var vehicle in totalVehicles) {
      if (vehicle.categoryId == category.categoryId) {
        vehicles.add(vehicle);
      }
    }
  }
}

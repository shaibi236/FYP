import 'package:flutter_practice/app/modules/bookings/views/bookings_view.dart';


import 'package:flutter_practice/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';



class MainController extends GetxController {
  List<Widget> pages = [
    HomeView(),
    BookingsView(),
    ProfileView(),
  ];
  var currentIndex = 0.obs;
}

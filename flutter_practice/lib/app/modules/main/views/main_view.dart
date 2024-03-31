import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8, 20),
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blue,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey,
                  currentIndex: controller.currentIndex.value,
                  onTap: (index) {
                    if (index == 3) {
                      // If the fourth item is clicked
                      showSearch(context: context, delegate: SearchView());
                    } else {
                      controller.currentIndex.value = index;
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: 'home'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.book),
                      label: 'bookings'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: 'profile'.tr,
                    ),
                   
                     
                    
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
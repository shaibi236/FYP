// import 'package:flutter/material.dart';
// import 'package:flutter_practice/app/modules/home/controllers/home_controller.dart';

// import 'package:get/get.dart';

// import '../controllers/edit_profile_controller.dart';

// class EditProfileView extends GetView<EditProfileController> {
//   const EditProfileView({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Add Vehicle'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Create a New Vehicle Listing',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (v) => v?.isEmpty ?? false ? 'Please enter the vehicle title' : null,
//                 controller: controller.titleController,
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(
//                   labelText: "Vehicle Title",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   errorStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (v) {
//                   if (v?.isEmpty ?? false) {
//                     return 'Please enter your vehicle description';
//                   } else if (v!.length < 10) {
//                     return 'Description must be at least 10 characters';
//                   }
//                   return null;
//                 },
//                 controller: controller.descriptionController,
//                 decoration: InputDecoration(
//                   labelText: "Vehicle Description",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   errorStyle: TextStyle(color: Colors.red),
//                 ),
//                 maxLines: 5,
//                 minLines: 3,
//                 maxLength: 2000,
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (v) {
//                   if (v?.isEmpty ?? false) {
//                     return 'Please enter the per day price';
//                   } else if (int.tryParse(v!) == null) {
//                     return 'Please enter a valid price';
//                   }
//                   return null;
//                 },
//                 controller: controller.priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: "Per Day Price",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   errorStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 20),
//               DropdownButtonFormField<String>(
//                 value: controller.selectedCategoryId,
//                 items: Get.find<HomeController>()
//                     .categoryResponse!
//                     .categories!
//                     .map((e) => DropdownMenuItem(
//                           value: e.categoryId,
//                           child: Text(e.category!),
//                         ))
//                     .toList(),
//                 onChanged: (v) {
//                   controller.selectedCategoryId = v;
//                 },
//                 validator: (v) => v?.isEmpty ?? true ? 'Please select your vehicle type' : null,
//                 decoration: InputDecoration(
//                   labelText: 'Vehicle Type',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   errorStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: controller.onPickImage,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                   onPrimary: Colors.white,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add, color: Colors.white),
//                     SizedBox(width: 10),
//                     Text(
//                       'Upload Image',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Obx(
//                 () => Visibility(
//                   visible: controller.imageError.value,
//                   child: const Text(
//                     'Image is required',
//                     style: TextStyle(color: Colors.red, fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: controller.addVehicle,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.redAccent,
//                   onPrimary: Colors.white,
//                   shadowColor: Colors.red,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Add Vehicle',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('ChangePasswordView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 80,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: controller.oldPasswordController,
                    decoration: InputDecoration(
                        label: Text('old password'),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.newPasswordController,
                    decoration: InputDecoration(
                        label: Text('new password'),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.confirmPasswordController,
                    decoration: InputDecoration(
                        label: Text('confirm password'),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
  onPressed: () {
    if (controller.formKey.currentState!.validate()) {
      controller.onchangePassword();
    }
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.black, // Set the background color here
  ),
  child: Text('Change Password'),
),

                ],
              ),
            ),
          ),
        ));
  }
}

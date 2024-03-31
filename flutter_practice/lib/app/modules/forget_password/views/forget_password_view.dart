import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ForgetPasswordView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Find your account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your email address',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (v) {
                      if (v == null) {
                        return null;
                      }
                      if (v.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        fillColor: Colors.grey,
                        label: Text('Enter your email'),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: (controller.onforgetPassword),
                        child: const Text('Find your account')),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_practice/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/confirm_account_controller.dart';

class ConfirmAccountView extends GetView<ConfirmAccountController> {
  const ConfirmAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text('ConfirmAccountView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Confirm your account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'We sent a code via email.Enter that code to confirm your account.'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.ADD_CATEGORY);
                      },
                      child: Text('Continue')))
            ],
          ),
        ));
  }
}

import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 280,
                  decoration: BoxDecoration(             image: DecorationImage(image: 
                    AssetImage('assets/images/welcome.png'),
                    ),
                  ),
                ),
              ),
              Text('Login!',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              SizedBox(height: 10,),
              Text('Please login to continue',style: TextStyle(
                fontSize: 16,
                
          
              ),),
              SizedBox(
                height: 15,
              ),
            
                                
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
                                        validator: (v) {
                                          if (v == null) {
                                            return null;
                                          }
                                          if (v.isEmpty) {
                                            return 'Please enter your email';
                                          } else if (!GetUtils.isEmail(v)) {
                                            return 'Please enter valid email';
                                          }
                                          return null;
                                        },
                                        controller: controller.emailController,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your email',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
          ),
                                  
                                 
                                  Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: TextFormField(
                                      validator: (v) {
                                        if (v == null) {
                                          return null;
                                        }
                                        if (v.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                        
                                      ),
                                      controller: controller.passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter your password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                
                                   
                                  TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.CONFIRM_ACCOUNT);
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            const Text('forget password?',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.blue)),
                                          ],
                                        ),
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: ElevatedButton(
                                      onPressed: controller.onLogin,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          Lottie.asset(
                                            'assets/lottie/login.json',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('OR'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account?",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.REGISTER);
                                        },
                                        child: const Text('Register',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.blue,
                                      ),))
                                    ],
                                  )
                                ]),
        ),
      ));
                     

  }
}

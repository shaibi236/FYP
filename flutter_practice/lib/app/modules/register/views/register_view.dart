import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 15,
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child:
                          Text('Please enter your Sign up credentials below'),
                    ),
                    const SizedBox(height: 20),

                    // logo
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: TextFormField(
                      
                        
                        validator: (v) {
                          if (v == null) {
                            return null;
                          }
                          if (v.isEmpty) {
                            return 'Please enter your Full Name';
                          }
                          return null;
                        },
                        controller: controller.fullNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                      
                          ),
                          
                          hintText: "FullName",
                         
                        ),
                      ),
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                         // You can customize the border properties as needed
                      
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            11), // Adjust the padding as needed
                        child: TextFormField(
                          controller: controller.emailController,
                          validator: (v) {
                            if (v == null) {
                              return null;
                            }
                            if (v.isEmpty) {
                              return 'Please enter your email';
                            } else if (!GetUtils.isEmail(v)) {
                              return 'please enter valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                           
                            hintText: "Email",
                            
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: TextFormField(
                        controller: controller.passwordController,
                        validator: (v) {
                          if (v == null) {
                            return null;
                          }
                          if (v.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                    

                   

                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(380, 52),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(

                              //to set border radius to button
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: controller.onRegister,
                        child: (Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              "assets/images/apple.png",
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              "assets/images/download.jpeg",
                              height: 20,
                            ),
                          ),

                          // google + apple sign in buttons

                          const SizedBox(height: 40),

                          // not a member? register now
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            )),
                        TextButton(
                          onPressed: () {
                            Get.back();
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: Text('Login',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              )),
                        )
                      ],
                    ), // not a member? register now
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

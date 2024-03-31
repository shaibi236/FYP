import 'package:flutter/material.dart';
import 'package:flutter_practice/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('My Profile',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          builder: (controller) {
            if (controller.profileResponse == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=${controller.profileResponse?.user?.fullName ?? ''}&background=0D8ABC&color=fff',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.profileResponse?.user?.fullName ?? 'User',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.profileResponse?.user?.email ?? 'Email',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.profileResponse?.user?.role?.toUpperCase() ??
                          'Role',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                       const SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
                    child: ListTile(
                      title: const Text('Edit Profile'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        
      Get.to(Routes.EDIT_PROFILE);
                        }
                    ),
                  ),
                   const SizedBox(height: 10),
                  ThemeSwitcher(),
                  const SizedBox(height: 10),
                  LanguageSwitcher(),
                  const SizedBox(height: 10),
                  
                  const SizedBox(height: 10),
                  Visibility(
                    visible: Storage.getRole() != 'admin',
                    child: Container(
                      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
                      child: ListTile(

                        title: const Text('My Vehicles'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Get.toNamed(Routes.MY_VEHICLES);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
                    child: ListTile(
                      title: const Text('Change Password'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Get.toNamed(Routes.CHANGE_PASSWORD);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
                    child: ListTile(
                      title: Text('Logout'.tr),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Logout'),
                              content: Text('Are you sure you want to Logout'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Storage.removeAll();
                                    Get.offAllNamed(Routes.LOGIN);
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),
    );
  }
}

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        
        title: const Text('Switch Language'),
        trailing: Get.locale == const Locale('en')
            ? const Text('English')
            : const Text('Nepali'),
        onTap: () {
          Get.updateLocale(Get.locale == const Locale('en')
              ? const Locale('np')
              : const Locale('en'));
          setState(() {});
        },
      ),
    );
  }
}

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        
        title: const Text('Switch Theme'),
        trailing: Get.isDarkMode
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
        onTap: () {
          Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          setState(() {});
        },
      ),
    );
  }
}

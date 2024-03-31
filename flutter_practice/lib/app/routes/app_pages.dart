import 'package:get/get.dart';

import '../modules/Edit_Profile/bindings/edit_profile_binding.dart';
import '../modules/Edit_Profile/views/edit_profile_view.dart';
import '../modules/OtpScreen/bindings/otp_screen_binding.dart';
import '../modules/OtpScreen/views/otp_screen_view.dart';
import '../modules/add_vehicle/bindings/add_vehicle_binding.dart';
import '../modules/add_vehicle/views/add_vehicle_view.dart';
import '../modules/admin_category/bindings/admin_category_binding.dart';
import '../modules/admin_category/views/admin_category_view.dart';
import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_main/bindings/admin_main_binding.dart';
import '../modules/admin_main/views/admin_main_view.dart';
import '../modules/bookings/bindings/bookings_binding.dart';
import '../modules/bookings/views/bookings_view.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/confirm_account/bindings/confirm_account_binding.dart';
import '../modules/confirm_account/views/confirm_account_view.dart';
import '../modules/detail_vehicle/bindings/detail_vehicle_binding.dart';

import '../modules/detail_vehicle/views/detail_vehicle_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/my_vehicles/bindings/my_vehicles_binding.dart';
import '../modules/my_vehicles/views/my_vehicles_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/single_category/bindings/single_category_binding.dart';
import '../modules/single_category/views/single_category_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: unused_import

// import '../modules/add_category/bindings/add_category_binding.dart';
// import '../modules/add_category/views/add_category_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),

    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MAIN,
      page: () => const AdminMainView(),
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_VEHICLE,
      page: () => const DetailVehicleView(),
      binding: DetailVehicleBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_VEHICLE,
          page: () => const DetailVehicleView(),
          binding: DetailVehicleBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ADD_VEHICLE,
      page: () => const AddVehicleView(),
      binding: AddVehicleBinding(),
    ),
    // GetPage(
    //   name: _Paths.ADD_CATEGORY,
    //   page: () => AddCategoryView(),
    //   binding: AddCategoryBinding(),
    // ),
    GetPage(
      name: _Paths.ADMIN_CATEGORY,
      page: () => AdminCategoryView(),
      binding: AdminCategoryBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => const BookingsView(),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: _Paths.MY_VEHICLES,
      page: () => const MyVehiclesView(),
      binding: MyVehiclesBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_CATEGORY,
      page: () => const SingleCategoryView(),
      binding: SingleCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_ACCOUNT,
      page: () => const ConfirmAccountView(),
      binding: ConfirmAccountBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    // GetPage(
    //   name: _Paths.OTP_SCREEN,
    //   page: () => OtpScreen(),
    //   binding: OtpScreenBinding(),
    // ),

    // GetPage(
    //   name: _Paths.EDIT_PROFILE,
    //   page: () => const EditProfileView(),
    //   binding: EditProfileBinding(),
    // ),
  ];
}

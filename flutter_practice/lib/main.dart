import 'package:flutter_practice/translations.dart';
import 'package:flutter_practice/app/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/theme.dart';

import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  // var token = Storage.getToken();
  // var role = Storage.getRole();

  runApp(
    KhaltiScope(
        publicKey: 'test_public_key_dde0878862604f24b2475a9806c833d2',
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            translations: MyTranslations(),
            locale: const Locale('en'),
            fallbackLocale: const Locale('np'),
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            defaultTransition: Transition.cupertino,
            // theme: ThemeData(
            //   useMaterial3: false,
            // ),
            theme: lightTheme,
            // darkTheme: darkTheme,
            title: "Application",

            // initialRoute: token == null
            //     ? Routes.LOGIN
            //     : role == 'admin'
            //         ? Routes.ADMIN_MAIN
            //         : Routes.MAIN,
            initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
          );
        }),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/modules/auth/controllers/auth_controller.dart';
import 'package:spaces/spaces.dart';

import 'app/core/values/app_translations.dart';
import 'app/modules/app_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AppController());
  Get.put(AuthController());
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Money Calculator",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      builder: (context, child) => Spacing(
        dataBuilder: (context) {
          final mediaQuery = MediaQuery.of(context);
          if (mediaQuery.size.width > 500) {
            return SpacingData.generate(30);
          }
          return SpacingData.generate(10);
        },
        child: child ?? SizedBox(),
      ),
    );
  }
}

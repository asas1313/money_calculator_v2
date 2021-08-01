import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/data/services/app_controller.dart';

import 'app/core/values/app_translations.dart';
import 'app/routes/app_pages.dart';

void main() {
  final _appController = Get.put(AppController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Money Calculator",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}

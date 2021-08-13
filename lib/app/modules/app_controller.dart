import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';

class AppController extends GetxController {
  static var instance = Get.find<AppController>();

  final isLoginWidgetDisplayed = true.obs;

  set locale(String value) {
    Get.updateLocale(Locale(value));
    update();
  }

  changeTheme() {
    Get.changeTheme(
        Get.isDarkMode ? CustomTheme.lightTheme : CustomTheme.darkTheme);
    print('Theme changed to dark: ${Get.isDarkMode}');
    update();
  }

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }
}

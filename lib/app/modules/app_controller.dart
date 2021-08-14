import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';

class AppController extends GetxController {
  static var instance = Get.find<AppController>();
  late final isDarkMode = Get.isDarkMode.obs;

  final isLoginWidgetDisplayed = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  set locale(String value) {
    Get.updateLocale(Locale(value));
    print('locale updated to: $value');
    update();
  }

  changeTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
        isDarkMode.value ? CustomTheme.darkTheme : CustomTheme.lightTheme);
    print('Theme changed to dark: ${isDarkMode.value}');
    update();
  }

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }
}

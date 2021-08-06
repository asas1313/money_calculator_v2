import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';

class AppController extends GetxController {
  static var instance = Get.find<AppController>();

  final _locale = 'en_US'.obs;
  final isLoginWidgetDisplayed = true.obs;
  final backgroundColor = Get.theme.scaffoldBackgroundColor.obs;

  String get locale => _locale.value;

  set locale(String value) {
    Get.updateLocale(Locale(value));
    _locale.value = value;
    print('Locale set to: ${_locale.value}.');
  }

  changeTheme() {
    backgroundColor.value =
        Get.isDarkMode ? Light.backgroundColor : Dark.backgroundColor;
    Get.changeTheme(
        Get.isDarkMode ? CustomTheme.lightTheme : CustomTheme.darkTheme);
  }

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }
}

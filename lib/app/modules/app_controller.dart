import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/theme/theme_dark.dart';
import 'package:money_calculator_v2/app/core/theme/theme_light.dart';

class AppController extends GetxController {
  static var instance = Get.find<AppController>();

  final _locale = 'en_US'.obs;
  final isLoginWidgetDisplayed = true.obs;

  String get locale => _locale.value;

  set locale(String value) {
    Get.updateLocale(Locale(value));
    _locale.value = value;
    print('Locale set to: ${_locale.value}.');
  }

  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? LightTheme() : DarkTheme());
  }

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }
}

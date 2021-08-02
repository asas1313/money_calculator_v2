import 'dart:ui';

import 'package:get/get.dart';

class AppController extends GetxController {
  static var instance = Get.find<AppController>();

  final _locale = 'en_US'.obs;

  String get locale => _locale.value;

  set locale(String value) {
    Get.updateLocale(Locale(value));
    _locale.value = value;
    print('Locale set to: ${_locale.value}.');
  }
}

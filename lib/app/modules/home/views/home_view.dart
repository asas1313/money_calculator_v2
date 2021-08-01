import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/data/services/app_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final _appController = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              MessageKeys.hello.tr,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => _appController.locale = 'lt_LT',
              child: Text('Lietuviškai'),
            ),
            ElevatedButton(
              onPressed: () => _appController.locale = 'en_EN',
              child: Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}

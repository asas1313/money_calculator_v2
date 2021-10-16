import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';

class CustomThemeSwitch extends StatelessWidget {
  const CustomThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return Row(
          children: [
            appController.isDarkMode.value
                ? Icon(Icons.wb_sunny_rounded)
                : Container(),
            Switch(
              value: appController.isDarkMode.value,
              onChanged: (value) => appController.changeTheme(),
            ),
            appController.isDarkMode.value
                ? Container()
                : Icon(Icons.nightlight_round),
          ],
        );
      }),
    );
  }
}

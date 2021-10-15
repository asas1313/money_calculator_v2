import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/asset_path.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_layout.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_text.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/bottom_text.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/login.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/registration.dart';
import 'package:spaces/spaces.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Obx(
                () => appController.isDarkMode.value
                    ? CustomText(text: MessageKeys.app_bar_theme_turn_light)
                    : CustomText(text: MessageKeys.app_bar_theme_switch_dark),
              ),
              Obx(() => Switch(
                    value: appController.isDarkMode.value,
                    onChanged: (value) => appController.changeTheme(),
                  )),
              Space.semiBig(),
              LanguageBar(),
            ],
          )
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Space.semiBig(),
              Obx(() {
                return appController.isDarkMode.value
                    ? Image.asset(
                        logo_white_sm,
                        width: 140,
                      )
                    : Image.asset(
                        logo_sm,
                        width: 140,
                      );
              }),
              Visibility(
                  visible: appController.isLoginWidgetDisplayed.value,
                  child: LoginWidget()),
              Visibility(
                  visible: !appController.isLoginWidgetDisplayed.value,
                  child: RegistrationWidget()),
              Visibility(
                visible: appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onPressed: () {
                    appController.changeDisplayedAuthWidget();
                  },
                  text1: MessageKeys.auth_create_account1.tr,
                  text2: MessageKeys.auth_create_account2.tr,
                ),
              ),
              Visibility(
                visible: !appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onPressed: () {
                    appController.changeDisplayedAuthWidget();
                  },
                  text1: MessageKeys.auth_sign_in1.tr,
                  text2: MessageKeys.auth_sign_in2.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

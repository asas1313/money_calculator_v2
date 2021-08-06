import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/asset_path.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/bottom_text.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/login.dart';
import 'package:money_calculator_v2/app/modules/auth/views/widgets/registration.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo_white_sm,
                width: 140,
              ),
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
                  text1: "Don\'t have an account?",
                  text2: "Create account!",
                ),
              ),
              Visibility(
                visible: !appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onPressed: () {
                    appController.changeDisplayedAuthWidget();
                  },
                  text1: "Already have an account?",
                  text2: "Sign in!!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

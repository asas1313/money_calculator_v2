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
          child: Stack(
            children: [
              Image.asset(
                bg1,
                width: double.infinity,
                height: Get.height,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: appController.isLoginWidgetDisplayed.value,
                      child: LoginWidget()),
                  Visibility(
                      visible: !appController.isLoginWidgetDisplayed.value,
                      child: RegistrationWidget()),
                  Visibility(
                    visible: appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        appController.changeDisplayedAuthWidget();
                      },
                      text1: "Don\'t have an account?",
                      text2: "Create account!",
                    ),
                  ),
                  Visibility(
                    visible: !appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        appController.changeDisplayedAuthWidget();
                      },
                      text1: "Already have an account?",
                      text2: "Sign in!!",
                    ),
                  ),
                ],
              ),
              Positioned(
                top: Get.height / 6,
                left: 20,
                child: Image.asset(
                  logo_sm,
                  width: 140,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

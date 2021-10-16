import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_layout.dart';
import 'package:money_calculator_v2/app/modules/app_controller.dart';
import 'package:money_calculator_v2/app/modules/home/views/home_view.dart';
import 'package:spaces/spaces.dart';

import 'custom_text_button.dart';

class CustomMenu extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Obx(() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: controller.isDarkMode.value
              ? Dark.accentColor
              : Light.accentColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextButton(
                text: MessageKeys.home_title,
                onPressed: () => Get.to(CustomLayout(
                  child: HomeView(),
                )),
                textSize: 18,
              ),
              SizedBox(width: spacing.spaces.big),
              Obx(
                () => Visibility(
                  visible: authController.isLoggedIn.value,
                  child: CustomTextButton(
                    onPressed: () => authController.signOut(),
                    text: MessageKeys.sign_out.tr,
                    width: 80.0,
                    textSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    Container(
      child: Column(
        children: [
          SizedBox(width: spacing.spaces.big),
          Obx(
            () => Visibility(
              visible: authController.isLoggedIn.value,
              child: CustomTextButton(
                onPressed: () => authController.signOut(),
                text: MessageKeys.sign_out.tr,
                width: 80.0,
                textSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

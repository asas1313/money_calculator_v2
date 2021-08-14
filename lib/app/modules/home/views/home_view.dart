import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_widgets.dart';
import 'package:spaces/spaces.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextButton(
            onPressed: () => HomeView(),
            text: MessageKeys.app_name.tr,
            width: 220,
          ),
          actions: [
            Obx(() {
              return Row(
                children: [
                  appController.isDarkMode.value
                      ? CustomText(
                          text: MessageKeys.app_bar_theme_turn_light.tr)
                      : CustomText(
                          text: MessageKeys.app_bar_theme_switch_dark.tr),
                  Switch(
                    value: appController.isDarkMode.value,
                    onChanged: (value) => appController.changeTheme(),
                  ),
                ],
              );
            }),
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
            SizedBox(width: spacing.spaces.big),
            LanguageBar(),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: CustomText(text: MessageKeys.app_bar_tab_main.tr),
              ),
              Tab(
                text: 'Values',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainTab(),
            ValuesTab(),
          ],
        ),
      ),
    );
  }
}

class MainTab extends GetWidget<HomeController> {
  MainTab();

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: MessageKeys.home_title.tr),
        centerTitle: true,
      ),
      body: CustomForm(
        child: ListView(
          children: [
            SpacedColumn.normal(
              padding: spacing.insets.all.normal,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class ValuesTab extends StatelessWidget {
  const ValuesTab();

  Widget _box(BuildContext context, String title, double height) {
    final spacing = Spacing.of(context);
    return Padding(
      padding: spacing.insets.all.normal,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          Container(
            color: Colors.red,
            width: spacing.spaces.big,
            height: height,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      color: Colors.red.withOpacity(0.2),
      margin: spacing.insets.all.big,
      padding: spacing.insets.all.normal,
      child: ListView(
        children: <Widget>[
          _box(context, 'extraSmall', spacing.spaces.extraSmall),
          _box(context, 'small', spacing.spaces.small),
          _box(context, 'semiSmall', spacing.spaces.semiSmall),
          _box(context, 'normal', spacing.spaces.normal),
          _box(context, 'semiBig', spacing.spaces.semiBig),
          _box(context, 'big', spacing.spaces.big),
          _box(context, 'extraBig', spacing.spaces.extraBig),
        ],
      ),
    );
  }
}

class LanguageBar extends StatelessWidget {
  const LanguageBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextButton(
            text: 'LT',
            onPressed: () => appController.locale = 'lt_LT',
            textSize: 12.0,
            width: 20.0,
            margins: 6.0,
          ),
          CustomTextButton(
            text: 'EN',
            onPressed: () => appController.locale = 'en_US',
            textSize: 12.0,
            width: 20.0,
            margins: 6.0,
          ),
        ],
      ),
    );
  }
}

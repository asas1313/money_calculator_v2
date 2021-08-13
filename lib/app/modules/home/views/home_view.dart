import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/global_names.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_widgets.dart';
import 'package:money_calculator_v2/app/routes/app_pages.dart';
import 'package:spaces/spaces.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final appData = GetStorage();
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    bool isDarkMode = appData.read(GlobalNames.DARK_MODE);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            text: MessageKeys.app_name.tr,
            width: 220,
          ),
          actions: [
            Row(
              children: [
                isDarkMode
                    ? CustomText(text: 'Turn light')
                    : CustomText(text: 'Switch dark'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) =>
                      appData.write(GlobalNames.DARK_MODE, value),
                ),
              ],
            ),
            SizedBox(width: spacing.spaces.extraBig),
            LanguageBar(),
          ],
          flexibleSpace: Align(
            alignment: Alignment.centerRight,
            child: Obx(
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
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: MessageKeys.app_bar_tab_main.tr,
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

class MainTab extends StatelessWidget {
  MainTab();

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: CustomForm(
        child: ListView(
          children: [
            SpacedColumn.normal(
              padding: spacing.insets.all.normal,
              children: <Widget>[
                Text(
                  MessageKeys.app_name.tr,
                  style: TextStyle(fontSize: 20),
                ),
                CustomButton(
                  onPressed: () => authController.signIn(),
                  text: 'Sign In',
                ),
              ],
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
            onPressed: () => appController.locale = 'lt_lt',
            textSize: 12.0,
            width: 25,
          ),
          CustomTextButton(
            text: 'EN',
            onPressed: () => appController.locale = 'en_US',
            textSize: 12.0,
            width: 25,
          ),
        ],
      ),
    );
  }
}

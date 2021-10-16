import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_drawer.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_theme_switch.dart';
import 'package:money_calculator_v2/app/modules/home/views/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spaces/spaces.dart';

import 'custom_form.dart';
import 'custom_menu.dart';
import 'custom_text.dart';
import 'custom_text_button.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;

  const CustomLayout({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: ResponsiveBuilder(builder: (context, sizingInformation) {
          return sizingInformation.isDesktop
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.menu),
                  ));
        }),
        title: ResponsiveBuilder(builder: (context, sizingInformation) {
          return sizingInformation.isMobile
              ? Container()
              : CustomTextButton(
                  onPressed: () => Get.to(CustomLayout(child: HomeView())),
                  text: MessageKeys.app_name,
                  width: 220,
                );
        }),
        actions: [
          CustomThemeSwitch(),
          SizedBox(width: spacing.spaces.big),
          LanguageBar(),
          SizedBox(width: spacing.spaces.small),
        ],
      ),
      drawer: CustomDrawer(),
      body: CustomForm(
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          return ListView(
            children: [
              SizedBox(height: spacing.spaces.small),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: MessageKeys.home_title,
                    size: 32,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: spacing.spaces.normal),
              SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.7,
                child: Row(
                  children: [
                    sizingInformation.isDesktop
                        ? Flexible(child: CustomMenu())
                        : Container(),
                    sizingInformation.isDesktop
                        ? SizedBox(width: spacing.spaces.big)
                        : Container(),
                    Flexible(
                      flex: 5,
                      child: child,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
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

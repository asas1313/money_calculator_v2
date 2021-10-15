import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_layout.dart';
import 'package:money_calculator_v2/app/modules/home/views/home_view.dart';
import 'package:spaces/spaces.dart';

import 'app/core/values/app_translations.dart';
import 'app/core/values/firebase.dart';
import 'app/modules/app_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(AuthController());
  });
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Money Calculator",
        translations: Messages(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        builder: (context, child) => Spacing(
          dataBuilder: (context) {
            final mediaQuery = MediaQuery.of(context);
            if (mediaQuery.size.width > 500) {
              return SpacingData.generate(30);
            }
            return SpacingData.generate(10);
          },
          child: child ?? Container(),
        ),
        themeMode:
            controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        home: CustomLayout(child: HomeView()),
      );
    });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

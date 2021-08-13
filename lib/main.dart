import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_calculator_v2/app/core/theme/custom_theme.dart';
import 'package:money_calculator_v2/app/core/values/global_names.dart';
import 'package:spaces/spaces.dart';

import 'app/core/values/app_translations.dart';
import 'app/core/values/firebase.dart';
import 'app/modules/app_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

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
  final appData = GetStorage();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appData.writeIfNull(GlobalNames.DARK_MODE, false);

    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appData.read(GlobalNames.DARK_MODE);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Money Calculator",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
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
          theme: isDarkMode ? CustomTheme.darkTheme : CustomTheme.lightTheme,
        );
      },
    );
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

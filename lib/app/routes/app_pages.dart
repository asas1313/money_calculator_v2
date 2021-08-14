import 'package:get/get.dart';
import 'package:money_calculator_v2/app/modules/auth/bindings/auth_binding.dart';
import 'package:money_calculator_v2/app/modules/auth/views/auth_view.dart';
import 'package:money_calculator_v2/app/modules/home/bindings/home_binding.dart';
import 'package:money_calculator_v2/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final pages = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}

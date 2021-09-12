import 'package:get/get.dart';

import 'package:totask/app/modules/auth/bindings/auth_binding.dart';
import 'package:totask/app/modules/auth/views/auth_view.dart';
import 'package:totask/app/modules/detail/bindings/detail_binding.dart';
import 'package:totask/app/modules/detail/views/detail_view.dart';
import 'package:totask/app/modules/home/bindings/home_binding.dart';
import 'package:totask/app/modules/home/views/home_view.dart';
import 'package:totask/app/modules/input/bindings/input_binding.dart';
import 'package:totask/app/modules/input/views/input_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INPUT,
      page: () => InputView(),
      binding: InputBinding(),
    ),
    GetPage(
      name: _Paths.Detail,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}

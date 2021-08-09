import 'package:get/get.dart';

import 'package:totask/app/modules/home/bindings/home_binding.dart';
import 'package:totask/app/widget/landing_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Example(),
      binding: HomeBinding(),
    ),
    
  ];
}

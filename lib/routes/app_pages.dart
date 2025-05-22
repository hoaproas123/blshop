import 'package:blshop/modules/home/bindings/home_binding.dart';
import 'package:blshop/modules/home/view/home_view.dart';
import 'package:get/get.dart';





part 'app_routes.dart';

class AppPages {
  static const INITIAL = _Paths.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

import 'package:blshop/modules/category/bindings/category_binding.dart';
import 'package:blshop/modules/category/view/category_view.dart';
import 'package:blshop/modules/detail/bindings/detail_binding.dart';
import 'package:blshop/modules/detail/view/detail_view.dart';
import 'package:blshop/modules/home/bindings/home_binding.dart';
import 'package:blshop/modules/home/view/home_view.dart';
import 'package:blshop/modules/login/bindings/login_binding.dart';
import 'package:blshop/modules/login/view/login_view.dart';
import 'package:blshop/modules/splash/splash_view.dart';
import 'package:get/get.dart';





part 'app_routes.dart';

class AppPages {
  static const INITIAL = _Paths.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}

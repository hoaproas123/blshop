
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/modules/home/provider/home_provider.dart';
import 'package:blshop/modules/home/repository/home_repository.dart';
import 'package:blshop/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => HomeRepository(homeProvider: Get.find<HomeProvider>()),
        fenix: true);
    Get.lazyPut(
            () => HomeController(homeRepository: Get.find<HomeRepository>()),
        fenix: true);
  }
}
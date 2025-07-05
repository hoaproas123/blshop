
import 'package:blshop/modules/login/controller/login_controller.dart';
import 'package:blshop/modules/login/provider/login_provider.dart';
import 'package:blshop/modules/login/repository/login_repository.dart';
import 'package:blshop/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => LoginRepository(loginProvider: Get.find<LoginProvider>()),
        fenix: true);
    Get.lazyPut(
            () => LoginController(loginRepository: Get.find<LoginRepository>()),
        fenix: true);
  }
}
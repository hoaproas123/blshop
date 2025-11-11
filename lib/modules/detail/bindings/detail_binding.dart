
import 'package:blshop/modules/detail/controller/detail_controller.dart';
import 'package:blshop/modules/detail/provider/detail_provider.dart';
import 'package:blshop/modules/detail/repository/detail_repository.dart';
import 'package:blshop/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => DetailRepository(detailProvider: Get.find<DetailProvider>()),
        fenix: true);
    Get.lazyPut(
            () => DetailController(detailRepository: Get.find<DetailRepository>()),
        fenix: true);
  }
}

import 'package:blshop/modules/detail_order/controller/detail_order_controller.dart';
import 'package:blshop/modules/detail_order/provider/detail_order_provider.dart';
import 'package:blshop/modules/detail_order/repository/detail_order_repository.dart';
import 'package:blshop/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class DetailOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailOrderProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => DetailOrderRepository(detailOrderProvider: Get.find<DetailOrderProvider>()),
        fenix: true);
    Get.lazyPut(
            () => DetailOrderController(detailOrderRepository: Get.find<DetailOrderRepository>()),
        fenix: true);
  }
}
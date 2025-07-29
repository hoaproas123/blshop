
import 'package:blshop/modules/category/controller/category_controller.dart';
import 'package:blshop/modules/category/provider/category_provider.dart';
import 'package:blshop/modules/category/repository/category_repository.dart';
import 'package:blshop/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => CategoryRepository(categoryProvider: Get.find<CategoryProvider>()),
        fenix: true);
    Get.lazyPut(
            () => CategoryController(categoryRepository: Get.find<CategoryRepository>()),
        fenix: true);
  }
}
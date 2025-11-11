
import 'dart:io';
import 'package:blshop/constant/app_string.dart';
import 'package:blshop/core/alert.dart';
import 'package:blshop/core/base_response.dart';
import 'package:blshop/models/category_model.dart';
import 'package:blshop/models/product_model.dart';
import 'package:blshop/modules/category/repository/category_repository.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController with GetSingleTickerProviderStateMixin{
  final CategoryRepository categoryRepository;
  CategoryController({required this.categoryRepository});
  CategoryModel category=Get.arguments[0];
  List<CategoryModel> path=Get.arguments[1];
  String search=Get.arguments[2];
  RxList<ProductModel> listProductModel=<ProductModel>[].obs;
  RxBool isLoading=true.obs;
  RxBool isLoadingItem=false.obs;
  RxBool isSeeMore=false.obs;
  int totalPage=0;
  int page=1;
  String searchString='';

  @override
  void onInit() async {
    super.onInit();
    await getProductFromId(category.id!);
    isLoading.value=false;
  }
  ///***************************
  Future<void> getProductFromId(int id,{page=1}) async {
    final BaseResponse? response;
    response = await categoryRepository.loadProductFromCategoryId(id,page: page,search: search);
    if (response?.statusCode == HttpStatus.ok ) {
      totalPage=response?.totalPage;
      response?.data.forEach((item){
        listProductModel.addIf(true,ProductModel.fromJson(item));
      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }
}

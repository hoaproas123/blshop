import 'dart:io';

import 'package:blshop/constant/app_string.dart';
import 'package:blshop/core/alert.dart';
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/detail/model/detail_model.dart';
import 'package:blshop/modules/detail/repository/detail_repository.dart';
import 'package:get/get.dart';


class DetailController extends GetxController {
  final DetailRepository detailRepository;
  DetailController({required this.detailRepository});
  RxBool isLoading = true.obs;
  String url = Get.arguments;
  Rx<DetailModel> detailModel = DetailModel().obs;
  Rx<int> currentOptionIndex = 0.obs;
  Rx<int> currentVariantIndex = 0.obs;
  Rx<Variant> currentVariant = Variant().obs;

  @override
  void onInit() async {
    super.onInit();
    await getDetailProductFromUrl(url);
    currentVariant.value = detailModel.value.variants![0];
    isLoading.value = false;
  }
  ///***************************
  Future<void> getDetailProductFromUrl(String url) async {
    final BaseResponse? response;
    response = await detailRepository.loadDetailProductFromUrl(url);
    if (response?.statusCode == HttpStatus.ok) {
      detailModel.value = DetailModel.fromJson(response?.data);
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText: CommonString.CANCEL);
    }
  }
  }


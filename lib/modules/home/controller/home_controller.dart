
import 'dart:io';

import 'package:blshop/constant/app_string.dart';
import 'package:blshop/core/alert.dart';
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:blshop/modules/home/model/orders_model.dart';
import 'package:blshop/modules/home/repository/home_repository.dart';
import 'package:blshop/services/domain_service.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeModel? homeModel;
  HomeController({required this.homeRepository});

  String id='1017172';
  Rx<OrderModel> orderModel=OrderModel().obs;

  @override
  void onInit() async {
    super.onInit();
    getOrdersDataFromId(null);
  }
  ///***************************
  Future<void> getOrdersDataFromId(HomeModel? data) async {
    final BaseResponse? response;
    if(data!=null) {
      response = await homeRepository.loadData(data);
    } else {
      response = await homeRepository.loadData(HomeModel(
        url: DomainProvider.orders+'/$id',
      ));
    }
    if (response?.statusCode == HttpStatus.ok) {
      // print(response?.data);
      orderModel.value=OrderModel.fromJson(response?.data);
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
    // Alert.closeLoadingIndicator();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

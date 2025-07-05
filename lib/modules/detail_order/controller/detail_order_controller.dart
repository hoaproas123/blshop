
import 'dart:io';

import 'package:blshop/constant/app_string.dart';
import 'package:blshop/core/alert.dart';
import 'package:blshop/core/base_response.dart';
import 'package:blshop/data/rank.dart';
import 'package:blshop/models/arguments_model.dart';
import 'package:blshop/models/customer_model.dart';
import 'package:blshop/modules/detail_order/model/detail_order_model.dart';
import 'package:blshop/modules/detail_order/model/invoices_model.dart';
import 'package:blshop/modules/detail_order/model/orders_model.dart';
import 'package:blshop/modules/detail_order/repository/detail_order_repository.dart';
import 'package:blshop/models/rank_model.dart';
import 'package:blshop/services/domain_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailOrderController extends GetxController with GetSingleTickerProviderStateMixin{
  final DetailOrderRepository detailOrderRepository;
  DetailOrderModel? detailOrderModel;
  DetailOrderController({required this.detailOrderRepository});
  ArgumentsModel arguments=Get.arguments;
  Rx<OrderModel> orderModel=OrderModel().obs;
  Rx<InvoicesModel> invoiceModel=InvoicesModel().obs;
  CustomerModel customerModel=CustomerModel();
  RankModel rank=listRank.first;
  RxBool isHideDigit=true.obs;
  RxBool isLoading=true.obs;
  late TabController tabController;
  @override
  void onInit() async {
    super.onInit();
    tabController=TabController(length: 2, vsync: this);
    rank=arguments.rank!;
    customerModel=arguments.customerModel!;
    getInvoicesDataFromId();
    await getOrdersDataFromId();
    isLoading.value=false;

  }
  ///***************************
  Future<void> getOrdersDataFromId() async {
    final BaseResponse? response;
    response = await detailOrderRepository.loadOrders(DetailOrderModel(
      url: DomainProvider.orders+'?lastModifiedFrom=2025-01-01T00:00:00&orderBy=modifiedDate&orderDirection=Desc&customerIds=${customerModel.id}',
    ));
    if (response?.statusCode == HttpStatus.ok) {
      orderModel.value=OrderModel.fromJson(response?.data);
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }
  ///***************************
  Future<void> getInvoicesDataFromId() async {
    final BaseResponse? response;
    response = await detailOrderRepository.loadOrders(DetailOrderModel(
      url: DomainProvider.invoices+'?lastModifiedFrom=2025-01-01T00:00:00&orderBy=modifiedDate&orderDirection=Desc&customerIds=${customerModel.id}',
    ));
    if (response?.statusCode == HttpStatus.ok) {
      invoiceModel.value=InvoicesModel.fromJson(response?.data);
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

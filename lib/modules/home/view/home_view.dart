
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/modules/home/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bạch Long MB'),
        backgroundColor: Colors.yellow,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.orderModel.value.customerName??"",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Điểm: ${controller.orderModel.value.totalPayment}'??"",
                style: TextStyle(fontSize: 30),
              ),
            ],
          );
        },)
      ),
    );
  }
}





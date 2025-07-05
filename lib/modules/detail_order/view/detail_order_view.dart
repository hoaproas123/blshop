
import 'package:blshop/constant/app_color.dart';
import 'package:blshop/constant/app_string.dart';
import 'package:blshop/modules/detail_order/controller/detail_order_controller.dart';
import 'package:blshop/modules/detail_order/model/invoices_detail_model.dart';
import 'package:blshop/modules/detail_order/model/orders_detail_model.dart';
import 'package:blshop/services/utils.dart';
import 'package:blshop/widgets/loading_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DetailOrderView extends GetView<DetailOrderController> {
  const DetailOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo-website-1.png',width: 150,),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Obx(() {
          return controller.isLoading.value==true?
          LoadingView()
            :
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUserInforCard(context),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CalendarDatePicker',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Card(
                    child: TabBar(
                      controller: controller.tabController,
                      indicator: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Tab(text: "Orders"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tab(text: "Invoices"),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: (Get.width*0.3+24)*controller.orderModel.value.orderDetails!.length,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      buildOrdersList(context),
                      buildInvoicesList(context)
                    ],
                  ),
                ),
              ],
            ),
          );
        },)
      ),
    );
  }

  Padding buildUserInforCard(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400,width: 6),
                                borderRadius: BorderRadius.circular(Get.width*0.11,),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.person,size: 40,color: Colors.black,),
                              )
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.customerModel.name??"",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)
                              ),
                              SizedBox(height: 2,),
                              Row(
                                children: [
                                  Text(
                                    controller.customerModel.contactNumber==null?"": Utils.hideMiddleDigits(controller.isHideDigit.value, controller.customerModel.contactNumber!),
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15)
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: () {
                                      controller.isHideDigit.value= !controller.isHideDigit.value;
                                    },
                                    child: Icon(
                                        controller.isHideDigit.value==true ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                                        size: 15,
                                        color: Colors.blueGrey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(color: Colors.pinkAccent)

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 2),
                                    child: Text(
                                      controller.rank.rankName??"",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.pinkAccent,fontSize: 10),
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      child: SizedBox(
                        height: Get.height*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width*0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.orderModel.value.orderDetails?.length ?? 0}',
                                        style: Theme.of(context).textTheme.displayLarge
                                      ),
                                      Text(
                                        'đơn hàng',
                                        style: Theme.of(context).textTheme.headlineLarge
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              endIndent: 30,
                              indent: 30,
                              thickness: 1,
                              width: 20, // khoảng cách giữa các widget
                            ),
                            SizedBox(
                              width: Get.width*0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Utils.formatCurrency(controller.orderModel.value.totalPayment?.toInt().toString() ?? "") ,
                                        style: Theme.of(context).textTheme.displayLarge
                                      ),
                                      SizedBox(
                                        width: Get.width*0.4,
                                        child: Text(
                                          'Tổng tiền tích lũy từ ${AppString.MODIFIED_DATE_FROM}',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: Theme.of(context).textTheme.headlineLarge
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

  Column buildOrdersList(BuildContext context) {
    return Column(
                children: List.generate(controller.orderModel.value.orderDetails?.length ?? 0, (index) {
                  OrderDetail item=controller.orderModel.value.orderDetails![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        width: Get.width,
                        child: Row(
                          children: [
                            Container(
                              width: Get.width*0.3,
                              height: Get.width*0.3,
                              color: AppColor.mainColor,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width*0.6,
                                  child: Text(
                                    '${item.productName}',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  Utils.formattedDate(controller.orderModel.value.purchaseDate!),
                                  style: Theme.of(context).textTheme.bodyLarge
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      controller.orderModel.value.statusValue!,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.green)
                                    ),
                                  ),
                                ),
                                Text(
                                  '${Utils.formatCurrency(item.price!.toInt().toString())}đ',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red,fontSize: 17)
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },)
              );
  }
  Column buildInvoicesList(BuildContext context) {
    return Column(
        children: List.generate(controller.invoiceModel.value.invoiceDetails?.length ?? 0, (index) {
          InvoicesDetail item=controller.invoiceModel.value.invoiceDetails![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SizedBox(
                width: Get.width,
                child: Row(
                  children: [
                    Container(
                      width: Get.width*0.3,
                      height: Get.width*0.3,
                      color: AppColor.mainColor,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width*0.6,
                          child: Text(
                            '${item.productName}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          Utils.formattedDate(controller.orderModel.value.purchaseDate!),
                          style: Theme.of(context).textTheme.bodyLarge
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              controller.orderModel.value.statusValue!,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.green)
                            ),
                          ),
                        ),
                        Text(
                          '${Utils.formatCurrency(item.price!.toInt().toString())}đ',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red,fontSize: 17)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },)
    );
  }
}





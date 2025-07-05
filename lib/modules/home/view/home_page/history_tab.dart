
import 'package:blshop/constant/app_color.dart';
import 'package:blshop/modules/home/model/orders_detail_model.dart';
import 'package:blshop/modules/home/model/orders_model.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTab extends GetView<HomeController> {
  const HistoryTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              controller.listOrderModel.length, (orderIndex) {
              OrderModel orderItem = controller.listOrderModel[orderIndex];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Utils.formattedDate(orderItem.purchaseDate!)),
                  ] +
                      List.generate(
                        orderItem.orderDetails?.length ?? 0, (index) {
                        OrderDetail item = orderItem.orderDetails![index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.2,
                                      height: Get.width * 0.2,
                                      color: AppColor.mainColor,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.6,
                                          child: Text(
                                            '${item.productName}',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(fontSize: 17),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Text(
                                            Utils.formattedDate(
                                                orderItem.purchaseDate!),
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyLarge
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              borderRadius: BorderRadius
                                                  .circular(12)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                4.0),
                                            child: Text(
                                                orderItem.statusValue!,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                    color: Colors.green)
                                            ),
                                          ),
                                        ),
                                        Text(
                                            '${Utils.formatCurrency(
                                                item.price!
                                                    .toInt().toString())}đ',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(color: Colors.red,
                                                fontSize: 17)
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },),
                ),
              );
            },)
        ),
      ),
    );
  }
}

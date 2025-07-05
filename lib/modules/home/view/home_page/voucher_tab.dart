
import 'package:blshop/models/voucher_model.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherTab extends GetView<HomeController> {
  const VoucherTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            controller.listVoucherModel.length, (index) {
            VoucherModel item = controller.listVoucherModel[index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                      width: Get.width * 0.9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset('assets/voucher.png', width: 90,
                                color: Colors.red,),
                              Positioned(
                                  left: 22,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 55,
                                    child: Text(
                                      Utils.formatCurrency(
                                          item.discountAmount.toString()),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 9),
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      item.description ?? "",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 18),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Hạn sử dụng: ',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium,
                                          children: [
                                            TextSpan(
                                                text: item.toDate ?? "",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight
                                                        .bold),
                                                children: [
                                                ]
                                            ),
                                          ]
                                      ),
                                    ),
                                    Text(
                                      '**Voucher chỉ áp dụng với Bmember',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            );
          },),
        ),
      ),
    );
  }
}

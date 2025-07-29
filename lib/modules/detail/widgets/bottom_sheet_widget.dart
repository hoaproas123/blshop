import 'package:blshop/constant/app_color.dart';
import 'package:blshop/modules/detail/controller/detail_controller.dart';
import 'package:blshop/modules/detail/model/detail_model.dart';
import 'package:blshop/services/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.controller,
  });

  final DetailController controller;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.2,
      maxChildSize: 0.2,
      minChildSize: 0.1,
      builder: (context, scrollController) {
        return Obx(() {
          return controller.isLoading.value==true ?
          Container()
              :
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:  8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.currentVariant.value.product!.image!.url!,
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.detailModel.value.name!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        )
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.mainColor,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                          child: Text(
                                              controller.currentVariant.value.attributes![0].label!,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        controller.detailModel.value.attributes?.firstWhere((attr) => attr.attributeCode == 'version',).value=="" ?
                                        SizedBox()
                                            :
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.mainColor,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                          child: Text(
                                              controller.detailModel.value.attributes!.firstWhere((attr) => attr.attributeCode == 'version',).value!,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        controller.detailModel.value.options==null ? '${Utils.formatCurrency(controller.detailModel.value.variants![0].product!.priceRange!.minimumPrice!.finalPrice!.value.toString())} ${controller.detailModel.value.variants![0].product?.priceRange?.minimumPrice?.finalPrice?.currency}'
                                            :
                                        '${Utils.formatCurrency(((controller.currentVariant.value.product?.priceRange?.minimumPrice?.finalPrice?.value)! + controller.detailModel.value.options![0].value![controller.currentOptionIndex.value].price!).toString())} ${controller.currentVariant.value.product?.priceRange?.minimumPrice?.finalPrice!.currency!}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    'MUA NGAY',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    'Giao hàng tận nơi',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.red)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.cart_fill,color: Colors.red,size: 15,),
                                Text(
                                    'Giỏ hàng',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    )
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          );
        },);
      },
    );
  }
}
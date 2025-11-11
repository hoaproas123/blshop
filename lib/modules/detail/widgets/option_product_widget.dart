import 'package:blshop/constant/app_color.dart';
import 'package:blshop/modules/detail/controller/detail_controller.dart';
import 'package:blshop/modules/detail/model/detail_model.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:blshop/services/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OptionProductWidget extends GetView<DetailController> {
  const OptionProductWidget({
    super.key,
    required this.item,
  });

  final DetailModel item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        color: AppColor.mainColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name??"",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: item.reviewCount!=0 ?
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          int rating=(item.ratingSummary??0)~/20;
                          return Icon(
                            Icons.star,
                            color: index<=rating-1 ? Colors.yellow : Colors.grey,
                            size: 30,
                          );
                        },),
                        SizedBox(width: 5,),
                        Text('(${(item.ratingSummary??0)~/20})',style: TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(width: 10,),
                        SizedBox(
                            height: 22,
                            child: VerticalDivider(color: Colors.black,)
                        ),
                        SizedBox(width: 10,),
                        Text('${item.reviewCount.toString()} lượt đánh giá',style: TextStyle(color: Colors.blue,fontSize: 20),),
                      ],
                    )
                        :
                    SizedBox(height: 20,),
                  ),
                  item.upsellProducts==null ?
                  SizedBox()
                      :
                  Row(
                    children: List.generate(item.upsellProducts!.length, (index) {
                      final product = item.upsellProducts?[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: (){
                            Get.offNamed(Routes.DETAIL,arguments: product?.urlKey,preventDuplicates: false);
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${product?.attributeNew?.versionNew}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      );
                    },),
                  ),
                  item.variants==null ?
                  SizedBox()
                      :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Chọn màu để xem giá và chi nhánh có hàng',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(item.variants!.length, (index) {
                            final variant = item.variants?[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: InkWell(
                                onTap: (){
                                  controller.currentVariantIndex.value=index;
                                  controller.currentVariant.value=variant!;
                                },
                                child: Obx(() {
                                  return Card(
                                    color: Colors.white,
                                    shape: controller.currentVariantIndex.value==index ? Border.all(color: AppColor.mainColor,width: 2) : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: variant!.product!.image!.url!,
                                            width: 50,
                                          ),
                                          SizedBox(width: 5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${variant.attributes?[0].label}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${Utils.formatCurrency(variant.product!.priceRange!.minimumPrice!.finalPrice!.value.toString())} ${variant.product?.priceRange?.minimumPrice?.finalPrice?.currency}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },)
                              ),
                            );
                          },),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      color: AppColor.mainColor,
                      child: Column(
                        children: [
                          item.attributes?.firstWhere((attr) => attr.attributeCode == 'price_original',) != null ?
                          Row(
                            mainAxisAlignment: item.options !=null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                            children: [
                              item.options !=null ?
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${Utils.formatCurrency(item.attributes?.firstWhere((attr) => attr.attributeCode == 'price_original',).value ?? '')} VNĐ",
                                        style: TextStyle(
                                            fontSize: 16 ,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Colors.black,
                                            decorationThickness: 2
                                        )
                                    ),
                                  ),
                                  Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.circular(2)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                        child: Text('-${100-((((((((controller.currentVariant.value.product?.priceRange?.minimumPrice?.finalPrice?.value)! + item.options![0].value![controller.currentOptionIndex.value].price!)??0)/(double.parse(item.attributes?.firstWhere((attr) => attr.attributeCode == 'price_original',).value ?? '0')))*100).floor()/100)*100))~/1}%',style: TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.bold),)

                                    ),
                                    );
                                  },)
                                ],
                              )
                              :
                              SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "(Giá đã gồm VAT)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                            ],
                          )
                              :
                          SizedBox(),
                          item.options == null ?
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${Utils.formatCurrency(((item.priceRange?.minimumPrice?.finalPrice?.value)! ).toString())} ${item.priceRange?.minimumPrice?.finalPrice!.currency!}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          )
                              :
                          Obx(() {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(item.options![0].value!.length, (index) {
                                  final option = item.options?[0].value?[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical:  8.0),
                                    child: InkWell(
                                      onTap: (){
                                        controller.currentOptionIndex.value=index;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: controller.currentOptionIndex.value==index ? Border.all(color: Colors.red,width: 2) : null,

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  option!.title!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  )
                                              ),
                                              Text(
                                                '${Utils.formatCurrency(((controller.currentVariant.value.product?.priceRange?.minimumPrice?.finalPrice?.value)! + option.price!).toString())} ${controller.currentVariant.value.product?.priceRange?.minimumPrice?.finalPrice!.currency!}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },)
                            );
                          },)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
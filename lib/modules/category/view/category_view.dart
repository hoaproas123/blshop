
import 'dart:math';

import 'package:blshop/constant/app_color.dart';
import 'package:blshop/models/category_model.dart';
import 'package:blshop/models/product_model.dart';
import 'package:blshop/modules/category/controller/category_controller.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:blshop/services/utils.dart';
import 'package:blshop/widgets/loading_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width*0.6,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  controller.searchString=value;
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(fontSize: 17),
                    border: InputBorder.none, // Ẩn đường viền mặc định
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search,),
                    )
                ),
              ),
            ),
            IconButton(
                onPressed: (){
                  List<CategoryModel> list=[];
                  CategoryModel item=CategoryModel(
                      id: 0,
                      name: controller.searchString,
                      childrenCount: '0',
                      description: null
                  );
                  list.add(item);
                  Get.offNamed(Routes.CATEGORY,arguments: [item,list,controller.searchString],preventDuplicates:  false);
                },
                icon: Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(controller.path.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    List<CategoryModel> list=controller.path;
                                    if(list.length!=1){
                                      list.removeRange(
                                          index + 1, controller.path.length);
                                      CategoryModel item = list[list.length - 1];
                                      Get.offNamed(Routes.CATEGORY,
                                          arguments: [item, list,''],
                                          preventDuplicates: false);
                                    }
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: controller.search==''? '' : 'Kết quả tìm kiếm cho: ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                      children: [
                                        TextSpan(
                                          text: controller.path[index].name!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: controller.search==''? null : Colors.red
                                          )
                                        )
                                      ]
                                    ),


                                  ),
                                ),
                                SizedBox(width: 5,),
                                index!=controller.path.length-1 ? Icon(Icons.arrow_forward_ios_rounded,size: 16,):SizedBox()
                              ],
                            ),
                          );
                        },),
                      ),
                    ),
                    controller.category.childrenCount== '0' ?
                    SizedBox()
                        :
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(controller.category.children!.length, (index) {
                          CategoryModel item= controller.category.children![index];
                          return item.iconImage==null && item.checkShowCategoryInPage==1 ?
                            SizedBox()
                              :
                            Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: (){
                                  List<CategoryModel> list=controller.path;
                                  list.add(item);
                                  Get.offNamed(Routes.CATEGORY,arguments: [item,list,''],preventDuplicates: false);
                              },
                              child: SizedBox(
                                  height: 60,
                                  child: Card(
                                    color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: item.iconImage!=null ?
                                        CachedNetworkImage(imageUrl: item.iconImage??"",height: 90,)
                                          :
                                        Center(child: Text(item.name!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                      )
                                  )
                              ),
                            ),
                          );
                        },),
                      ),
                    ),
                    controller.isLoading.value==true ?
                    LoadingItem()
                        :
                    controller.listProductModel.length==0 ?
                    SizedBox(
                      width: Get.width,
                      height: Get.height*0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: 'https://bachlongmobile.com/_next/image/?url=%2Fassets%2Fimages%2Fimg-no-pro-matching.png&w=256&q=75',
                                width: Get.width,
                              ),
                              Text(
                                'Không có sản phẩm nào',
                                style: TextStyle(
                                  fontSize: 22,color: Colors.black
                                ),
                              ),
                            ],
                          )
                        ),
                    )
                    :
                    SizedBox(
                      width: Get.width,
                      child: Wrap(
                        children: List.generate(controller.listProductModel.length, (index1) {
                          ProductModel item= controller.listProductModel[index1];
                          CategoryModel? category_item= controller.category.childrenCount !='0' ? controller.category.children![0] : null;
                          return SizedBox(
                            width: Get.width*0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.DETAIL,arguments: item.urlKey);
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 25.0),
                                            child: CachedNetworkImage(imageUrl: item.image?.url??"",height: 200,),
                                          ),
                                          item.imageBanner != null ?
                                          Positioned(
                                              bottom: 0,
                                              child: CachedNetworkImage(imageUrl: item.imageBanner!,height: 200,))
                                              :
                                          SizedBox(),
                                          Positioned(
                                              top: 5,
                                              left: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.red),
                                                    borderRadius: BorderRadius.circular(2)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text('Trả góp 0%',style: TextStyle(color: Colors.red,fontSize: 10,fontWeight: FontWeight.bold),),
                                                ),
                                              )
                                          ),
                                          item.attributeNew?.brandNew=='Apple' ?
                                          Positioned(
                                              top: 5,
                                              right: 5,
                                              child: CachedNetworkImage(
                                                imageUrl: 'https://bachlongmobile.com/_next/image/?url=%2Fassets%2Fimages%2Fap-author.png&w=640&q=75',
                                                width: 60,
                                              )
                                          )
                                              :
                                          SizedBox(),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: category_item?.contentHot !=null && category_item !=null ?
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              right: 14,
                                              child: Transform.rotate(
                                                angle: pi/4,
                                                child: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:BorderRadius.circular(5)
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.local_fire_department_rounded,color: Colors.orange,size: 17,),
                                                    Html(
                                                      data: category_item.contentHot,
                                                      style: {
                                                        ".tag_sale": Style(
                                                          color: Colors.white, // 🎯 Ghi đè màu chữ tại class .tag_sale
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: FontSize(12),
                                                        ),
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        )
                                            :
                                        SizedBox(height: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 30,
                                          child: Text(
                                            item.name??"",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: SizedBox(
                                          height: 50,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${Utils.formatCurrency(((item.priceRange?.minimumPrice?.finalPrice?.value??0)/10).toString() ?? "")} ${item.priceRange?.minimumPrice?.finalPrice?.currency}",
                                                style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                                              item.attributeNew?.priceOriginalNew!=null ?
                                              Row(
                                                children: [
                                                  Text(
                                                      "${Utils.formatCurrency(item.attributeNew?.priceOriginalNew ?? "")} ${item.priceRange?.minimumPrice?.finalPrice?.currency}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey.shade400,
                                                          fontWeight: FontWeight.bold,
                                                          decoration: TextDecoration.lineThrough,
                                                          decorationColor: Colors.grey.shade400
                                                      )
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.red),
                                                        borderRadius: BorderRadius.circular(2)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                                      child: Text('-${100-((((((item.priceRange?.minimumPrice?.finalPrice?.value??0)/(double.parse(item.attributeNew!.priceOriginalNew!)))*100).floor()/100)*100))~/1}%',style: TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.bold),),
                                                    ),
                                                  )
                                                ],
                                              )
                                                  :
                                              SizedBox(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Trả trước từ ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "${Utils.formatCurrency((((item.priceRange?.minimumPrice?.finalPrice?.value??0)/10)*30/100).toString() ?? "")} ${item.priceRange?.minimumPrice?.finalPrice?.currency}",
                                                  style: TextStyle(color: Colors.red)
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: item.reviewCount!=0 ?
                                        SizedBox(
                                          height: 20,
                                          child: Row(
                                            children: [
                                              ...List.generate(5, (index) {
                                                int rating=(item.ratingSummary??0)~/20;
                                                return Icon(
                                                  Icons.star,
                                                  color: index<=rating-1 ? Colors.yellow : Colors.grey,
                                                  size: 15,
                                                );
                                              },),
                                              SizedBox(width: 5,),
                                              Text(item.reviewCount.toString(),style: TextStyle(color: Colors.black),),
                                            ],
                                          ),
                                        )
                                            :
                                        SizedBox(height: 20,),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },),
                      ),
                    ),
                  ],
                ),
                controller.page==controller.totalPage || controller.listProductModel.isEmpty ?
                SizedBox()
                    :
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)
                  ),
                  onPressed: () async {
                    controller.isLoadingItem.value=true;
                    if(controller.page==controller.totalPage-1){
                      await Future.delayed(Duration(milliseconds: 500));
                    }
                    await controller.getProductFromId(controller.category.id!,page: ++controller.page);
                    controller.isLoadingItem.value=false;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Xem Thêm',
                        style: TextStyle(color: Colors.black),
                      ),
                      controller.isLoadingItem.value == true ?
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(color: AppColor.mainColor,),
                        ),
                      )
                        :
                      SizedBox()
                    ],
                  )
                ),
                SizedBox(height: 20,),
                controller.category.description==null ?
                SizedBox()
                    :
                SizedBox(
                  height: controller.isSeeMore.value==false ? 200 : null,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Html(
                              data: controller.category.description,
                              style: {
                                "img": Style(
                                  width: Width(Get.width*0.9),
                                  height: Height(Get.width*0.9*(900/1600))
                                ),
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.white)
                            ),
                            onPressed: ()  {
                              controller.isSeeMore.value=!controller.isSeeMore.value;
                            },
                            child: Text(
                              controller.isSeeMore.value==false ? 'Xem Thêm' : 'Thu Gọn',
                              style: TextStyle(color: Colors.black),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            );
          },)
        ),
      ),
    );
  }
}

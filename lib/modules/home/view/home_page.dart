
import 'dart:math';

import 'package:blshop/constant/app_color.dart';
import 'package:blshop/constant/app_integer.dart';
import 'package:blshop/models/category_model.dart';
import 'package:blshop/models/detail_banner_model.dart';
import 'package:blshop/models/product_model.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:blshop/services/utils.dart';
import 'package:blshop/widgets/loading_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value==true?
      Center(child: CircularProgressIndicator(color: AppColor.mainColor,))
          :
      CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            toolbarHeight: 60,
            floating: true,
            pinned: false,
            bottom: PreferredSize(
              preferredSize: Size(80, 30),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 30,right: 30,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width*0.72,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        controller: controller.textSearchEditingController,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Tìm kiếm',
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
                            name: controller.textSearchEditingController.text,
                            childrenCount: '0',
                            description: null
                          );
                          list.add(item);
                          Get.toNamed(Routes.CATEGORY,arguments: [item,list,controller.textSearchEditingController.text]);
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Image.asset('assets/logo-website-1.png',width: 150,),
              centerTitle: true,
              expandedTitleScale: 1.5,
              titlePadding: EdgeInsets.only(bottom: 60),
            ),
          ),

          SliverToBoxAdapter(
            child: ColoredBox(
              color: Colors.grey.shade300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                        controller: controller.carouselController,
                        items: List.generate(controller.listBannerModel[AppBanner.HOME_PAGE_FOOTER_SMALL].banner!.length, (index) {
                          int banner_index=AppBanner.HOME_PAGE_FOOTER_SMALL;
                          DetailBannerModel item = controller.listBannerModel[banner_index].banner![index];
                          return item == null ?
                          SizedBox()
                              :
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: () => controller.onBannerPress(
                                  index, banner_index),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.all(0),
                                child: CachedNetworkImage(
                                  imageUrl: item.media!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },),
                        options: CarouselOptions(
                          height: Get.width * (450 / 1200),
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          viewportFraction: 1,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            controller.currentBanner_index.value = index;
                          },)
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 120.0*(controller.listCategoryModel[0].children!.length-1)/2,
                        child: Wrap(
                          children: List.generate(controller.listCategoryModel[0].children!.length, (index) {
                            CategoryModel item= controller.listCategoryModel[0].children![index];
                            return index==controller.listCategoryModel[0].children!.length-1 ?
                            SizedBox()
                                :
                            SizedBox(
                              width: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    List<CategoryModel> list=[];
                                    list.add(item);
                                    Get.toNamed(Routes.CATEGORY,arguments: [item,list,'']);
                                  },
                                  child: Column(
                                    children: [
                                      Card(child: CachedNetworkImage(imageUrl: item.image??"",height: 90,)),
                                      Text(item.name??"",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },),
                        ),
                      ),
                    ),
                    CarouselSlider(
                        controller: controller.carouselController,
                        items: List.generate(10, (index) {
                          int banner_index=AppBanner.HOME_PAGE_BIG;
                          DetailBannerModel item = controller.listBannerModel[banner_index].banner![index];
                          return item == null ?
                          SizedBox()
                              :
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: () => controller.onBannerPress(
                                  index, banner_index),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.all(0),
                                child: CachedNetworkImage(
                                  imageUrl: item.media!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },),
                        options: CarouselOptions(
                          height: Get.width * (450 / 1200),
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          viewportFraction: 1,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            controller.currentBanner_index.value = index;
                          },)
                    ),
                    ...List.generate(controller.listCategoryModel[0].children!.length-4, (index) {
                      ListProductModel? product = controller.listCategoryModel[0].children!.length-4 > controller.listProductModel.length? null :controller.listProductModel[index];
                      return product==null ?
                      LoadingProduct()
                          :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                            child: InkWell(
                              onTap: () {
                                CategoryModel item= controller.listCategoryModel[0].children![index];
                                List<CategoryModel> list=[];
                                list.add(item);
                                Get.toNamed(Routes.CATEGORY,arguments: [item,list,'']);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.arrow_forward_ios_rounded,size: 16,)
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                children: List.generate(controller.listCategoryModel[0].children![index].children!.length, (index1) {
                                  CategoryModel brand_item= controller.listCategoryModel[0].children![index].children![index1];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        if(product.selectIndex!=index1){
                                          controller.listProductModel[index]= ListProductModel(selectIndex: index1,title: product.title,listProductModel: []);
                                          int id=controller.listCategoryModel[0].children![index].children![index1].id!;
                                          List<ProductModel> listProduct= await controller.getProductFromId(id);
                                          controller.listProductModel[index]= ListProductModel(selectIndex: index1,title: product.title,listProductModel: listProduct);
                                        }
                                      },
                                      child: Chip(
                                        backgroundColor: product.selectIndex==index1 ? AppColor.mainColor : Colors.white,
                                        label: Padding(
                                          padding: const EdgeInsets.symmetric(vertical:  8.0),
                                          child: Text(
                                            brand_item.name??"",
                                            style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                  );
                                },),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 210.0*(controller.listCategoryModel[0].children!.length-1)/2,),
                              child: controller.listProductModel[index].listProductModel.isEmpty ?
                              LoadingItem()
                                  :
                              Wrap(
                                children: List.generate(product.listProductModel.length, (index1) {
                                  ProductModel item= product.listProductModel[index1];
                                  CategoryModel? category_item= controller.listCategoryModel[0].children![index].children?.length !=0 ? controller.listCategoryModel[0].children![index].children![0] : null;
                                  return SizedBox(
                                    width: 210,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,bottom: 8),
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
                                                  child: item.attributeNew?.renewContentNew!=null ?
                                                  Container(
                                                    width: Get.width,
                                                    height: 70,
                                                    color: Colors.red.withOpacity(0.1),
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        item.attributeNew!.renewContentNew!,
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.red.shade800,
                                                            fontSize: 13
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                    :
                                                  SizedBox(height: 70,),
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
                          ),
                        ],
                      );
                    },)
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },);
  }

  SingleChildScrollView buildListCategory(RxBool isShow, RxBool isShow1, RxBool isShow2, RxBool isShow3) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(controller.listCategoryModel.length, (index) {
          CategoryModel item= controller.listCategoryModel[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => isShow.value=!isShow.value,
                child: Row(
                  children: [
                    Text(item.name??"", style: TextStyle(fontSize: 30,color: Colors.red),),
                    SizedBox(width: 10,),
                    Icon(isShow.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up ,color: Colors.red, size: 30,)
                  ],
                )),
              if (isShow.value)
                ...List.generate(item.children!.length, (index1) {
                  CategoryModel? item1= item.children?[index1];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => isShow1.value=!isShow1.value,
                        child: Row(
                          children: [
                            Text(item1?.name??"", style: TextStyle(fontSize: 28,color: Colors.green),),
                            SizedBox(width: 10,),
                            Icon(isShow.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up ,color: Colors.green, size: 28,)
                          ],
                        )),
                      if(isShow1.value)
                        ...List.generate(item1!.children?.length ?? 0, (index2) {
                          CategoryModel? item2= item1.children?[index2];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => isShow2.value=!isShow2.value,
                                child: Row(
                                  children: [
                                    Text(item2?.name??"", style: TextStyle(fontSize: 25,color: Colors.blue),),
                                    SizedBox(width: 10,),
                                    Icon(isShow.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up ,color: Colors.blue, size: 25,)
                                  ],
                                )),
                              if(isShow2.value)
                                ...List.generate(item2!.children?.length ?? 0, (index3) {
                                  CategoryModel? item3= item2.children?[index3];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () => isShow3.value=!isShow3.value,
                                          child: Row(
                                            children: [
                                              Text(item3?.name??"", style: TextStyle(fontSize: 22,color: Colors.black),),
                                              SizedBox(width: 10,),
                                              Icon(isShow.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up ,color: Colors.black, size: 22,)
                                            ],
                                          )),
                                      if(isShow3.value)
                                        ...List.generate(item3!.children?.length ?? 0, (index4) {
                                          CategoryModel? item4= item3.children?[index4];
                                          return Column(
                                              children: <Widget>[
                                                Text(item4?.name??"", style: TextStyle(fontSize: 20,color: Colors.pinkAccent),),
                                              ]
                                          );
                                        },),
                                    ]
                                  );
                                },),
                            ]

                          );
                        },),
                    ]
                  );
                },),
            ]
          );
        },),
      ),
    );
  }
}

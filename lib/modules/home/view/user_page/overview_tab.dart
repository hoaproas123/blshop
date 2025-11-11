
import 'package:blshop/constant/app_color.dart';
import 'package:blshop/constant/app_integer.dart';
import 'package:blshop/models/detail_banner_model.dart';
import 'package:blshop/models/support_model.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/support.dart';

class OverviewTab extends GetView<HomeController> {
  const OverviewTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.listBannerModel[AppBanner.HOME_PAGE_BIG].banner!
                  .take(10)
                  .toList()
                  .asMap()
                  .entries
                  .map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(
                          entry.key),
                  child: Container(
                    width: controller.currentBanner_index.value == entry.key
                        ? 20.0
                        : 8.0,
                    height: 4.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: controller.currentBanner_index
                            .value == entry.key
                            ? BorderRadius.circular(10)
                            : null,
                        shape: controller.currentBanner_index.value ==
                            entry.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        color: controller.currentBanner_index.value ==
                            entry.key ? AppColor.mainColor : Colors.white
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Khuyến mãi',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
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
              height: Get.width * 0.3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 0.8,
              disableCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Đối tác',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CarouselSlider(
            controller: controller.carouselController,
            items: List.generate(controller.listBannerModel[AppBanner.SMALL_HOME_BANNER_PAGE].banner!.length, (index) {
              int banner_index=AppBanner.SMALL_HOME_BANNER_PAGE;
              DetailBannerModel item = controller.listBannerModel[banner_index].banner![index];
              return Padding(
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
              height: Get.width * 0.3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 0.6,
              disableCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hợp tác',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CarouselSlider(
            controller: controller.carouselController,
            items: List.generate(controller.listBannerModel[AppBanner.TRADEMARK_HOME_FOOTER].banner!.length, (index) {
              int banner_index=AppBanner.TRADEMARK_HOME_FOOTER;
              DetailBannerModel item = controller.listBannerModel[banner_index].banner![index];
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () => controller.onBannerPress(
                      index, banner_index),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(0),
                    child: CachedNetworkImage(
                      imageUrl: item.media!,
                    ),
                  ),
                ),
              );
            },),
            options: CarouselOptions(
              height: Get.width * 0.2,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 0.32,
              disableCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Thông tin hỗ trợ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Wrap(
              children: List.generate(listSupportModel.length, (index) {
                SupportModel item = listSupportModel[index];
                return SizedBox(
                  width: index % 2 == 0 ? Get.width * 0.55 : Get.width * 0.40,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(item.urlImg!, width: 30,),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.label!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                item.info!,
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 11
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Khách hàng',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/thanks_customer_background.jpg'), // Đường dẫn ảnh
                fit: BoxFit.cover, // Tùy chọn: cover, contain, fill, none, scaleDown
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  controller: controller.carouselController,
                  items: List.generate(controller.listBannerModel[AppBanner.THANKS_CUSTOMER].banner!.length, (index) {
                    int banner_index=AppBanner.THANKS_CUSTOMER;
                    DetailBannerModel item = controller.listBannerModel[banner_index].banner![index];
                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.white,width: 3)

                          ),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: item.media!,
                            width: 120,
                            fit: BoxFit.fill,

                          ),
                        ),
                        // Expanded(child: SizedBox()),
                      ],
                    );
                  },),
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0,top: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: '\n',
                        style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'TRIỆU\n',
                            style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          TextSpan(
                            text: '\n',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '\n',
                            style: TextStyle(color: Colors.black,fontSize: 31,fontWeight: FontWeight.bold),
                          ),
                        ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0,top: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'CẢM ƠN\n',
                        style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'TRIỆU\n',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),
                          ),
                          TextSpan(
                            text: 'KHÁCH HÀNG\n',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'ĐÃ TIN YÊU\n',
                            style: TextStyle(color: Colors.black,fontSize: 31,fontWeight: FontWeight.bold),
                          ),
                        ]
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

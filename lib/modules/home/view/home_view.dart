
import 'package:blshop/constant/app_color.dart';
import 'package:blshop/models/store_address_model.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: controller.selectedPageIndex.value == 2 ?
        AppBar(
          title: Image.asset('assets/logo-website-1.png',width: 150,),
          actions: [
            controller.selectedPageIndex.value == 2 ?
            IconButton(
              onPressed: (){
                Get.offAndToNamed(Routes.SPLASH);
              },
              icon: Icon(Icons.logout))
                :
            SizedBox(),
          ],
        )
          :
        null,
        body: controller.pages[controller.selectedPageIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.mainColor,
          currentIndex: controller.selectedPageIndex.value,
          onTap:(value) {
            controller.onChangePage(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Trang Chủ'),
            BottomNavigationBarItem(icon: Icon(Icons.storefront),label: 'Cửa Hàng'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Người Dùng'),
          ],
        ),
        bottomSheet: controller.selectedPageIndex.value ==1 ? buildBottomSheetMap() : null,
      );
    },);
  }

  Widget buildBottomSheetMap() {
    return DraggableScrollableSheet(
      controller: controller.sheetController,
      expand: false,
      initialChildSize: 0.3,
      maxChildSize: 0.6,
      minChildSize: 0.2,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return SizedBox(
                width: Get.width,
                child: controller.isLoadingMap.value==true ?
                SizedBox()
                    :
                Column(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(height: 16),
                  ] +
                      List.generate(controller.listStoreAddressModel.length, (index) {
                        StoreAddressModel item= controller.listStoreAddressModel[index];
                        return SizedBox(
                          width: Get.width,
                          height: 160,
                          child: InkWell(
                            onTap: () => controller.onSelectStoreAddress(index),
                            child: Container(
                              color: controller.selectStore_index.value==index ? Colors.grey.shade300 : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name??"",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),),
                                    Text(item.street??"",style: Theme.of(context).textTheme.bodyMedium,),
                                    Text('Mở cửa: ${item.sortDescription}',style: Theme.of(context).textTheme.bodyMedium,),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => controller.onButtonCallPress(index),
                                          child: Row(
                                            children: [
                                              Icon(Icons.phone,color: Colors.blueAccent,),
                                              SizedBox(width: 5,),
                                              Text('Gọi cửa hàng',style: TextStyle(color: Colors.blueAccent),)
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 40,),
                                        GestureDetector(
                                          onTap: () => controller.onButtonDirectionPress(index),
                                          child: Row(
                                            children: [
                                              Icon(Icons.subdirectory_arrow_right,color: Colors.blueAccent,),
                                              SizedBox(width: 5,),
                                              Text('Chỉ đường',style: TextStyle(color: Colors.blueAccent),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
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
        );
      },
    );
  }

}






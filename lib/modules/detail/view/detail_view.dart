import 'package:blshop/modules/detail/controller/detail_controller.dart';
import 'package:blshop/modules/detail/widgets/bottom_sheet_widget.dart';
import 'package:blshop/modules/detail/widgets/option_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/loading_screen_widget.dart';
import '../widgets/review_Image_widget.dart';
class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo-website-1.png',width: 150,),
      ),
      body: Obx(() {
        final item= controller.detailModel.value;
        return controller.isLoading.value==true ?
          LoadingDetail()
            :
          SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewImageWidget(item: item),
              OptionProductWidget(item: item, controller: controller),
              SizedBox(
                width: Get.width,
                height: 500,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },),
      bottomSheet: BottomSheetWidget(controller: controller)
    );
  }
}

import 'package:blshop/modules/detail/controller/detail_controller.dart';
import 'package:blshop/modules/detail/widgets/bottom_sheet_widget.dart';
import 'package:blshop/modules/detail/widgets/option_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
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
              OptionProductWidget(item: item),
              SizedBox(
                width: Get.width,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        item.shortDescription?.html==null ?
                        SizedBox()
                            :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Thông tin sản phẩm",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            Html(
                              data: item.shortDescription!.html!,
                              style: {
                                "img": Style(

                                ),"table": Style(
                                  width: Width(Get.width),
                                  height: Height(350),

                                ),
                                "td": Style(
                                  width: Width(Get.width*0.8),
                                  height: Height(160),
                                  padding: HtmlPaddings.all(12),
                                ),
                                "span": Style(
                                  fontSize: FontSize(16),
                                  color: Colors.blueGrey.shade800,
                                ),

                              },
                              extensions: [
                                TableHtmlExtension()
                              ],
                            ),
                          ],
                        ),

                        Text(
                          "Thông số kĩ thuật",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FixedColumnWidth(40),
                              1: FlexColumnWidth(),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.phone),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Máy mới 100%, chính hãng Apple Việt Nam."),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.book),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Html(
                          data: item.description?.html,
                          style: {
                            "img": Style(
                              width: Width(Get.width*0.8),
                              height: Height(Get.width*0.8*(9/16))

                            ),
                          }

                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },),
      bottomSheet: BottomSheetWidget()
    );
  }
}

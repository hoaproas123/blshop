import 'package:blshop/constant/app_color.dart';
import 'package:blshop/constant/app_string.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/modules/home/view/home_page/history_tab.dart';
import 'package:blshop/modules/home/view/home_page/overview_tab.dart';
import 'package:blshop/modules/home/view/home_page/rank_tab.dart';
import 'package:blshop/modules/home/view/home_page/voucher_tab.dart';
import 'package:blshop/modules/home/widgets/show_currentPoint.dart';
import 'package:blshop/services/utils.dart';
import 'package:blshop/widgets/loading_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserPage extends GetView<HomeController> {
  const UserPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade300,
        child: Obx(() {
          return controller.isLoading.value==true?
          LoadingView()
              :
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildUserInforCard(context),
              buildListIconFunctionCard(context),
              // buildListButtonFunctionCard(context),
              buildListTabFunction(),
            ],
          );
        },)
    );
  }

  Expanded buildListTabFunction() {
    return Expanded(
                child: SizedBox(
                  width: Get.width,
                  child: TabBarView(
                      controller: controller.tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        OverviewTab(),
                        RankTab(),
                        VoucherTab(),
                        HistoryTab(),
                      ]
                  ),
                )
            );
  }

  Padding buildListButtonFunctionCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 0),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  height: 25,
                  child: Center(
                    child: Text(
                        'Lịch sử',
                        style: Theme.of(context).textTheme.headlineMedium
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () => controller.onToOrderPage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt_long,color: Colors.grey.shade700),
                          SizedBox(width: 5,),
                          Text(
                              'Lịch sử mua hàng',
                              style: Theme.of(context).textTheme.headlineLarge
                          ),

                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,size: 12,)
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt,color: Colors.grey.shade700),
                          SizedBox(width: 5,),
                          Text(
                              'Hóa đơn mua hàng',
                              style: Theme.of(context).textTheme.headlineLarge
                          ),

                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,size: 12,)
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Padding buildListIconFunctionCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 0),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TabBar(
              controller: controller.tabController,
              padding: EdgeInsets.all(4),
              dividerColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.red,
              indicatorColor: AppColor.mainColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Column(
                  children: [
                    Icon(Icons.grid_view_outlined,color: Colors.grey.shade700),
                    SizedBox(height: 5,),
                    Text(
                        'Overview',
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.diamond,color: Colors.grey.shade700),
                    SizedBox(height: 5,),
                    Text(
                        'Rank',
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.receipt,color: Colors.grey.shade700),
                    SizedBox(height: 5,),
                    Text(
                        'Voucher',
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.receipt_long,color: Colors.grey.shade700),
                    SizedBox(height: 5,),
                    Text(
                        'History',
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  Padding buildUserInforCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width*0.11,),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              AppColor.mainColor.withAlpha(0x40),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.person,size: 50,color: Colors.black,),
                        )
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          controller.customerModel.value.name??"",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.customerModel.value.contactNumber==null?"": Utils.hideMiddleDigits(controller.isHideDigit.value, controller.customerModel.value.contactNumber!),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                controller.isHideDigit.value= !controller.isHideDigit.value;
                              },
                              child: Icon(
                                controller.isHideDigit.value==true ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                                size: 15,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                          ],
                        ),
                        // showCurrentPoint(controller: controller),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.onToOrderPage(),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Get.width*0.11,),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  AppColor.mainColor.withAlpha(0x10),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.shopping_cart,color: Colors.black,size: 16,),
                            )
                        ),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${controller.listOrderModel.length}',
                                style: Theme.of(context).textTheme.titleLarge
                            ),
                            Text(
                                'Tổng số đơn hàng',
                                style: Theme.of(context).textTheme.bodySmall
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Get.width*0.11,),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                AppColor.mainColor.withAlpha(0x10),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.receipt,color: Colors.black,size: 16),
                          )
                      ),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              Utils.formatCurrency(controller.totalPayment.toInt().toString() ?? ""),
                              style: Theme.of(context).textTheme.titleLarge
                          ),
                          Text(
                              'Tổng tiền tích lũy  Từ ${AppString.MODIFIED_DATE_FROM}',
                              style: Theme.of(context).textTheme.bodySmall
                          ),
                        ],
                      ),
                      SizedBox(width: 30,)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

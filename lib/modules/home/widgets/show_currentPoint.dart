import 'package:blshop/data/rank.dart';
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:blshop/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class showCurrentPoint extends StatelessWidget {
  const showCurrentPoint({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    if(controller.rank.value.id!=listRank[listRank.length-1].id) {
      double currentPoint=(controller.customerModel.value.totalPoint??0)/1000;
      double nextLevelPoint=listRank[controller.rank.value.id! +1].leastPoints!;
      double previousLevelPoint=controller.rank.value.leastPoints!;
      double currentPosition=((currentPoint-previousLevelPoint)/(nextLevelPoint-previousLevelPoint))*100;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.11,),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x40),
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x60),
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x30),
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x40),
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x80),
                    (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                        0x10),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 2),
                child: Text(
                    controller.rank.value.rankName ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall
                ),
              )
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20),
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 1 + currentPosition,
                bottom: 6,
                child: Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down, size: 20, color: Colors.red,),
                    Text(
                        Utils.formatCurrency(
                            (controller.customerModel.value.totalPoint! / 10000)
                                .toString()),
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontSize: 11)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20),
                child: SizedBox(
                  width: currentPosition,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
              ),

            ],
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.11,),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x40),
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x60),
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x30),
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x40),
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x80),
                    (listRank[0].colorRank ?? Colors.white).withAlpha(0x10),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 2),
                child: Text(
                    listRank[controller.rank.value.id! + 1].rankName ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall
                ),
              )
          ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.11,),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x40),
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x60),
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x30),
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x40),
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x80),
                  (controller.rank.value.colorRank ?? Colors.white).withAlpha(
                      0x10),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 2),
              child: Text(
                  controller.rank.value.rankName ?? "",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall
              ),
            )
        ),
        Stack(
          children: [
            Positioned(
              left: 1 + 100,
              bottom: 6,
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down, size: 20, color: Colors.red,),
                  Text(
                      Utils.formatCurrency(
                          (controller.customerModel.value.totalPoint! / 10000)
                              .toString()),
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: 11)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 20),
              child: SizedBox(
                width: 100,
                child: Divider(
                  color: Colors.red,
                ),
              ),
            ),

          ],
        ),

      ],
    );
  }
}
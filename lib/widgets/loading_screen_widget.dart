import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlinkingBorderController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController borderController;
  late Animation<double> borderAnimation;

  @override
  void onInit() {
    borderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Tốc độ nhấp nháy
    )..repeat(reverse: true); // Lặp lại hiệu ứng

    borderAnimation = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(parent: borderController, curve: Curves.easeInOut),
    );

    super.onInit();
  }

  @override
  void onClose() {
    borderController.dispose();
    super.onClose();
  }
}

class LoadingView extends StatelessWidget {
  final BlinkingBorderController controller = Get.put(BlinkingBorderController());

  LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.borderAnimation,
      builder: (context, child) {
        return Container(
            width: Get.width,
            height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                child: Container(
                  width: Get.width,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                child: Container(
                  width: Get.width,
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),

            ],
          ),
        );
      },);

  }
}
class LoadingProduct extends StatelessWidget {
  final BlinkingBorderController controller = Get.put(BlinkingBorderController());

  LoadingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.borderAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: List.generate(5, (index1) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){},
                        child: Chip(
                          label: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                            ),
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
              child: SizedBox(
                width: 210.0*(10)/2,
                child: Wrap(
                  children: List.generate(10, (index1) {
                    return SizedBox(
                      width: 210,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,bottom: 8),
                        child: InkWell(
                          onTap: (){},
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            child: Container(
                              height: Get.height*0.65,
                              decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                              borderRadius: BorderRadius.circular(15)
                              ),
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
      },);

  }
}
class LoadingItem extends StatelessWidget {
  final BlinkingBorderController controller = Get.put(BlinkingBorderController());

  LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.borderAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 210.0*(10)/2,
                child: Wrap(
                  children: List.generate(10, (index1) {
                    return SizedBox(
                      width: 210,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,bottom: 8),
                        child: InkWell(
                          onTap: (){},
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            child: Container(
                              height: Get.height*0.65,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                                  borderRadius: BorderRadius.circular(15)
                              ),
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
      },);

  }
}
class LoadingDetail extends StatelessWidget {
  final BlinkingBorderController controller = Get.put(BlinkingBorderController());

  LoadingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.borderAnimation,
      builder: (context, child) {
        return ColoredBox(
          color: Colors.grey.shade300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 300,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index1) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        ),
                      );
                    },),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Container(
                      height: 800,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100.withOpacity(controller.borderAnimation.value),
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },);

  }
}
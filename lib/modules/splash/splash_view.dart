import 'package:blshop/constant/app_color.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() => Get.toNamed(Routes.LOGIN));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Hero(
          tag: 'banner',
          child: Image.asset('assets/logo-website-1.png',width: MediaQuery.of(context).size.width,)
        ),
      ),
    );
  }
}

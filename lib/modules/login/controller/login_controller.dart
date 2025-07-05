
import 'dart:io';
import 'package:blshop/modules/login/model/login_model.dart';
import 'package:blshop/modules/login/repository/login_repository.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController with GetSingleTickerProviderStateMixin{
  final LoginRepository loginRepository;
  LoginModel? loginModel;
  LoginController({required this.loginRepository});
  late AnimationController _animationController;
  late Animation<double> animation;
  TextEditingController phoneNumbereController=TextEditingController(text: '0379170200');
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward(); // bắt đầu animation
  }

  onLoginPress(){
    // Khi nhấn nút:
    if (formKey.currentState!.validate()) {
      Get.back();
      Future.delayed(Duration(milliseconds: 600),() {
        Get.offAllNamed(Routes.HOME,arguments: phoneNumbereController.text);
      },);
    } else {
      // Không hợp lệ: báo lỗi
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


import 'package:blshop/constant/app_color.dart';
import 'package:blshop/modules/login/controller/login_controller.dart';
import 'package:blshop/modules/login/widgets/custom_textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: 'banner',
                child: Image.asset('assets/logo-website-1.png',width: 250)
            ),
            SizedBox(height: 20,),
            FadeTransition(
              opacity: controller.animation,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Nhập Số Điện Thoại',style: const TextStyle(color: Colors.black, fontSize: 15),textAlign: TextAlign.start,),
                      )
                    ),
                    SizedBox(
                      height: 90,
                      width:  280,
                      child: customTextFormField(controller: controller,hintText: 'Số Điện Thoại',),
                    ),
                    SizedBox(height: 10,),
                    IconButton(
                      onPressed: controller.onLoginPress,
                      icon: Icon(Icons.arrow_forward_ios_rounded,size: 30,)
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}







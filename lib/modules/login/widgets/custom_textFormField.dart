import 'package:blshop/modules/login/controller/login_controller.dart';
import 'package:blshop/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscureText=false
  });
  final bool isObscureText;
  final String hintText;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.phoneNumbereController,
      keyboardType: TextInputType.number, // hiển thị bàn phím số
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // chỉ cho phép nhập số
        LengthLimitingTextInputFormatter(10),   // giới hạn độ dài (VD: 10 số)
      ],
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color:Colors.black,
            ),
            borderRadius: BorderRadius.circular(14)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(14)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(14)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(14)),
        errorStyle: TextStyle(fontSize: 15)
      ),
      style: const TextStyle(color: Colors.black, fontSize: 20),
      obscureText: isObscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng nhập số điện thoại';
        } else if (!Utils.isValidPhoneNumber(value)) {
          return 'Số điện thoại không hợp lệ';
        }
        return null;
      },
    );
  }
}
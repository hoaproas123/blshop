import 'package:blshop/constant/app_color.dart';
import 'package:flutter/material.dart';

class ThemeCustom {
  static final themeData = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.mainColor,
    ),
    textTheme: TextTheme(
      displayLarge: displayLarge,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
    ),


  );
  static final displayLarge = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static final headlineLarge = TextStyle(
      fontSize: 14,
      color: Colors.black
  );
  static final headlineMedium = TextStyle(
      fontSize: 12,
      color: Colors.black
  );
  static final titleLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
  static final bodyLarge = TextStyle(
      fontSize: 15,
      color: Colors.blueGrey.shade800
  );
  static final bodyMedium = TextStyle(
      fontSize: 13,
      color: Colors.blueGrey.shade800
  );
  static final bodySmall = TextStyle(
      fontSize: 9,
      color: Colors.blueGrey.shade800
  );
  static final labelSmall = TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
}
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF39A552);
  static ThemeData appTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent);
}

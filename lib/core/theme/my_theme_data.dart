import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF39A552);
  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
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
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )),
    textTheme: const TextTheme(
      //chapter name
      labelMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      //sura title
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      //content sura
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      //theme setting
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

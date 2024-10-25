// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingProvider extends ChangeNotifier {
//   Locale currentLang = const Locale("ar");
//
//   void changeLanguage(String newLanguage) {
//     if (currentLang == newLanguage) return;
//     currentLang = Locale(newLanguage);
//     saveLanguage(newLanguage);
//     notifyListeners();
//   }
//
//   void saveLanguage(String lang) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("lang", lang);
//   }
//
//   void getLang() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String lang = prefs.getString("lang") ?? "ar";
//     currentLang = Locale(lang);
//     notifyListeners();
//   }
// }

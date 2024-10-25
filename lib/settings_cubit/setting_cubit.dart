import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingCubit extends Cubit<Locale> {
  SettingCubit() : super(const Locale("ar")) {
    getLang(); // Load saved language on initialization
  }

  // Change language and save it
  Future<void> changeLanguage(String newLanguage) async {
    if (state.languageCode == newLanguage) return; // No change needed
    emit(Locale(newLanguage)); // Emit new state
    await saveLanguage(newLanguage); // Save new language
  }

  // Save the selected language to SharedPreferences
  Future<void> saveLanguage(String lang) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("lang", lang);
    } catch (e) {
      // Handle error (e.g., log the error)
      print("Error saving language: $e");
    }
  }

  // Load the saved language from SharedPreferences
  Future<void> getLang() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String lang = prefs.getString("lang") ?? "ar"; // Default to "ar"
      emit(Locale(lang)); // Emit the loaded language
    } catch (e) {
      // Handle error (e.g., log the error)
      print("Error loading language: $e");
    }
  }

  // Optionally, provide a getter for the current language code
  String get currentLanguageCode => state.languageCode;
}

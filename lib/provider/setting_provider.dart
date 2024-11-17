import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
bool isDarkMode ()=> currentMode == ThemeMode.dark;
  void setCurrentProvider(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
  void setCurrentMode(ThemeMode newMode){
    currentMode = newMode;
    notifyListeners();
  }
}
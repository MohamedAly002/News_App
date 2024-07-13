import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentlanguage='en';
  ThemeMode currentTheme=ThemeMode.system;
  void ChangeTheme(ThemeMode newThemeMode){
    currentTheme=newThemeMode;
    notifyListeners();
  }


  void ChangeLanguage(String language){
    currentlanguage=language;
    notifyListeners();
  }

  bool isDarkmode(){
    return currentTheme== ThemeMode.dark;
  }
  bool islangEN(){
    return currentlanguage== 'en';
  }


}
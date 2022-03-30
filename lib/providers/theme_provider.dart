import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  //constructor solicitando el tema isDarkMode y luego 2 puntos para validar si está dark true o false light
  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}

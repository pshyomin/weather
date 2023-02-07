import 'package:flutter/material.dart';

import '../main.dart';

class ThemeManager {
  static void themeChange() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static IconData themeIcon(IconData lightIcon, IconData darkIcon) {
    return MyApp.themeNotifier.value == ThemeMode.light ? lightIcon : darkIcon;
  }

  static Color themeColor(
      [Color lightColor = Colors.white,
      Color darkColor = const Color.fromRGBO(51, 51, 51, 1)]) {
    return MyApp.themeNotifier.value == ThemeMode.light
        ? lightColor
        : darkColor;
  }

  static Color themeTextColor(
      [Color lightColor = Colors.black, Color darkColor = Colors.white]) {
    return MyApp.themeNotifier.value == ThemeMode.light
        ? lightColor
        : darkColor;
  }
}

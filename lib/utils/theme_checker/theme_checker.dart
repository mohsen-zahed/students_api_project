import 'package:flutter/material.dart';

class ThemeChecker {
  bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}

ThemeChecker themeChecker = ThemeChecker();

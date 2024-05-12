import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: colors.kGreyColorShade100,
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colors.kPurpleColor,
      ),
    ),
  );
}

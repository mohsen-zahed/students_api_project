import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colors.kWhiteColor,
      ),
    ),
  );
}

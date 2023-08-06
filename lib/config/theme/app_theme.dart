import 'package:flutter/material.dart';
import 'package:recipe_app/config/color/colors.dart';
import 'package:recipe_app/config/font/fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          primaryContainer: primaryColorDark,
          secondary: secondaryColor,
        ),
        textTheme: font.copyWith(),
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        textTheme: font.copyWith(),
      );
}

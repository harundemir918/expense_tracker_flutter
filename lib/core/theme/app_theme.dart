import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkPurpleColor2,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  fontFamily: 'Poppins',
  inputDecorationTheme: appInputDecorationTheme,
);

InputDecorationTheme appInputDecorationTheme = InputDecorationTheme(
  border: _border(borderColor: AppColors.lightPurpleColor1),
  errorBorder: _border(borderColor: AppColors.redColor),
);

OutlineInputBorder _border({
  required Color borderColor,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: borderColor),
    );

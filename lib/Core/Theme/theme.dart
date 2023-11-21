import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: _inputDecorationTheme,
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: false,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 20.w),
    fillColor: AppColors.neutralColor,
    alignLabelWithHint: true,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.secondaryColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12)),
    hintStyle: TextStyle(
        color: AppColors.neutralColor.withOpacity(0.5),
        fontStyle: FontStyle.italic),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.neutralColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12)),
  );
}

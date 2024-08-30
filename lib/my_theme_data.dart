import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';

class MyThemeData{
  static final ThemeData LightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.orangeColor,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        color: AppColors.whiteColor
      ),

      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w100,
        color: AppColors.whiteColor
      ),

      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.greyWritingColor
      ),
    ),
  );
}
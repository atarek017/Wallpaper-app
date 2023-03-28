import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/resources/value_manger.dart';

import 'color_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManger.scaffoldDarkBack,
    brightness: Brightness.dark,
    splashColor: Colors.black.withOpacity(0.0),
    primaryColor: Colors.black,
    dividerColor: Colors.white54,
    primaryIconTheme: const IconThemeData(color: Colors.black87),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: ColorManger.mainColor,
        selectedIconTheme: IconThemeData(color: ColorManger.mainColor),
        unselectedIconTheme: const IconThemeData(color: Colors.white)),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManger.bgTextFieldColor,
      // content padding
      contentPadding: const EdgeInsets.all(AppSize.s20),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.white, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.white, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16))),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.white, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16))),
    ),
  );
}

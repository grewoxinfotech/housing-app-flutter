import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_res.dart';
import '../constants/font_res.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  // Enable Material 3
  fontFamily: FontRes.poppins,
  primaryColor: ColorRes.primary,
  scaffoldBackgroundColor: ColorRes.background,
  dividerColor: ColorRes.divider,
  disabledColor: ColorRes.disabled,
  shadowColor: ColorRes.shadow,
  dialogBackgroundColor: ColorRes.overlay,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: ColorRes.textPrimary,
    ),
  ),

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    // theme colors
    primary: ColorRes.primary,
    secondary: ColorRes.secondary,
    background: ColorRes.background,
    surface: ColorRes.surface,
    shadow: ColorRes.shadow,
    error: ColorRes.error,

    // text colors
    onPrimary: ColorRes.textPrimary,
    onSecondary: ColorRes.textSecondary,
    onBackground: ColorRes.textDisabled,
    onSurface: ColorRes.textSecondary,
    onError: ColorRes.error,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(ColorRes.white),
    // or any desired color
  ),
);

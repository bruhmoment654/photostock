import 'package:flutter/material.dart';
import 'package:photostock/assets/fonts.dart';
import 'package:photostock/uikit/colors/dark_color_scheme.dart';
import 'package:photostock/uikit/colors/light_color_scheme.dart';
import 'package:photostock/uikit/text/text_theme.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
      fontFamily: Fonts.manrope,
      textTheme: defaultTextTheme(),
      colorScheme: lightColorScheme);

  static final darkTheme = ThemeData(
      fontFamily: Fonts.manrope,
      textTheme: defaultTextTheme(),
      colorScheme: darkColorScheme);
}

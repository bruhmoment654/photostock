import 'package:flutter/material.dart';
import 'package:photostock/assets/fonts.dart';
import 'package:photostock/uikit/text/text_theme.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
    fontFamily: Fonts.manrope,
    textTheme: defaultTextTheme(),
  );

  static final darkTheme = ThemeData(
    fontFamily: Fonts.manrope,
    textTheme: defaultTextTheme(),
  );
}

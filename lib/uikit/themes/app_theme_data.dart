import 'package:flutter/material.dart';
import 'package:photostock/uikit/text/fonts.dart';
import 'package:photostock/uikit/text/text_theme.dart';


abstract class AppThemeData {

  static final lightTheme = ThemeData(
      // fontFamily: manropeFontFamily,
      textTheme: defaultTextTheme()
  );

  static final darkTheme = ThemeData(
    // fontFamily: manropeFontFamily,
      textTheme: defaultTextTheme()
  );

}
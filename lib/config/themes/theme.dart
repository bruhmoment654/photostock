import 'package:flutter/material.dart';
import 'package:photostock/config/themes/fonts.dart';
import 'package:photostock/config/themes/text_theme.dart';

ThemeData theme() {
  return ThemeData(fontFamily: manropeFontFamily, textTheme: createTextTheme());
}

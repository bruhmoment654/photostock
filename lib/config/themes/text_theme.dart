import 'package:flutter/material.dart';

part 'text_theme_styles.dart';

TextTheme createTextTheme() {
  return const TextTheme(
    headlineLarge: text32,
    titleLarge: text20,
    labelLarge: text16,
    labelMedium: text12,
    labelSmall: text10,
  );
}

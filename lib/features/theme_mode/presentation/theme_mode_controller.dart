import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class ThemeModeController {
  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode;

  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode theme);

  /// Switch theme mode to the opposite.
  Future<void> switchThemeMode();
}

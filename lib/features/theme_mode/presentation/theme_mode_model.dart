import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/repository/i_theme_mode_repository.dart';

const _themeByDefault = ThemeMode.system;

/// {@template theme_model.class}
/// [ElementaryModel] for [ThemeModeWidget].
/// {@endtemplate}
final class ThemeModeModel extends ElementaryModel {
  final IThemeModeRepository _repository;

  final _themeMode = ValueNotifier<ThemeMode>(_themeByDefault);

  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode => _themeMode;

  /// {@macro theme_model.class}
  ThemeModeModel({
    required IThemeModeRepository repository,
  }) : _repository = repository;

  @override
  void init() {
    super.init();
    final theme = _repository.getThemeMode();
    _themeMode.value = theme ?? _themeByDefault;
  }

  /// Switch theme mode to the opposite.
  Future<void> switchThemeMode() async {
    final newThemeMode =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _repository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _repository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }
}

import 'package:flutter/material.dart';
import '../../../../persistence/storage/theme_storage/i_theme_mode_storage.dart';
import '../../domain/repository/i_theme_mode_repository.dart';

/// {@template theme_repository.class}
/// Implementation of [IThemeModeRepository].
/// {@endtemplate}
final class ThemeModeRepository implements IThemeModeRepository {
  final IThemeModeStorage _themeModeStorage;

  /// {@macro theme_repository.class}
  ThemeModeRepository({
    required IThemeModeStorage themeModeStorage,
  }) : _themeModeStorage = themeModeStorage;

  @override
  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    await _themeModeStorage.saveThemeMode(mode: newThemeMode);
  }

  @override
  ThemeMode? getThemeMode() {
    return _themeModeStorage.getThemeMode();
  }
}

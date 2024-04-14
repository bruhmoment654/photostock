import 'dart:ui';

import 'package:photostock/persistence/storage/locale_storage/i_locale_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocaleStorage implements ILocaleStorage {
  final SharedPreferences _preferences;

  const LocaleStorage(this._preferences);

  //TODO: remove nullable type
  @override
  Locale? getLocale() {
    final localeStrings =
        _preferences.getString(_localeKey)?.split('_') ?? ['en', 'EN'];
    return Locale(localeStrings[0], localeStrings[1]);
  }

  @override
  Future<void> setLocale(Locale locale) {
    return _preferences.setString(_localeKey, locale.toString());
  }
}

const _localeKey = 'LOCALE_FIELD';

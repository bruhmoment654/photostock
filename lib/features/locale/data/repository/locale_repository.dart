import 'dart:ui';

import 'package:photostock/persistence/storage/locale_storage/i_locale_storage.dart';

import '../../domain/repository/i_locale_repository.dart';

final class LocaleRepository implements ILocaleRepository {
  final ILocaleStorage _storage;

  const LocaleRepository(this._storage);

  @override
  Locale? getLocale() {
    return _storage.getLocale();
  }

  @override
  Future<void> setLocale(Locale locale) {
    return _storage.setLocale(locale);
  }
}

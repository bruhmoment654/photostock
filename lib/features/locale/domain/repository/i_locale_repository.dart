import 'dart:ui';

abstract interface class ILocaleRepository {
  Future<void> setLocale(Locale locale);

  Locale? getLocale();
}

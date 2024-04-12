import 'dart:ui';

abstract interface class ILocaleStorage{

  Locale? getLocale();

  Future<void> setLocale(Locale locale);
}
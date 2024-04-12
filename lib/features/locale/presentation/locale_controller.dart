import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract interface class LocaleController {
  ValueListenable<Locale> get locale;

  Future<void> setLocale(Locale locale);
}

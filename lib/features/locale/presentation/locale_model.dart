import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/features/locale/domain/repository/i_locale_repository.dart';

const _defaultLocale = Locale("en", "EN");

final class LocaleModel extends ElementaryModel {

  final ILocaleRepository _repository;

  final _locale = ValueNotifier<Locale>(_defaultLocale);

  LocaleModel({required ILocaleRepository repository})
      : _repository = repository;

  ValueListenable<Locale> get locale => _locale;

  @override
  void init() {
    super.init();
    _locale.value = _repository.getLocale() ?? _defaultLocale;
  }

  Future<void> setLocale(Locale newLocale) async {
    if (newLocale == _locale.value) return;
    await _repository.setLocale(newLocale);
    _locale.value = newLocale;
  }
}

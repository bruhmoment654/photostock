import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/features/locale/di/locale_scope.dart';
import 'package:photostock/features/locale/presentation/locale_controller.dart';
import 'package:photostock/features/locale/presentation/locale_model.dart';
import 'package:photostock/features/locale/presentation/locale_widget.dart';
import 'package:provider/provider.dart';

LocaleWM defaultLocaleWMFactory(BuildContext context) {
  final scope = context.read<ILocaleScope>();
  return LocaleWM(LocaleModel(repository: scope.repository));
}

abstract interface class ILocaleWM implements LocaleController, IWidgetModel {}

final class LocaleWM extends WidgetModel<LocaleWidget, LocaleModel>
    implements ILocaleWM {
  LocaleWM(super.model);

  @override
  ValueListenable<Locale> get locale => model.locale;

  @override
  Future<void> setLocale(Locale locale) => model.setLocale(locale);
}

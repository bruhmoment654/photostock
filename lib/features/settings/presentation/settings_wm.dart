import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/locale/presentation/locale_provider.dart';
import 'package:photostock/features/settings/presentation/settings_model.dart';
import 'package:photostock/features/settings/presentation/settings_screen.dart';
import 'package:photostock/l10n/app_localizations_x.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.g.dart';
import '../../theme_mode/presentation/theme_mode_provider.dart';

SettingsWM defaultSettingsWM(BuildContext context) {
  final scope = context.read<IAppScope>();

  return SettingsWM(SettingsModel(scope.sharedPreferences));
}

abstract interface class ISettingsWM implements IWidgetModel {
  void clearCache();

  void swapLanguage();

  void swapTheme();

  ThemeData get theme;

  void showDetails();

  AppLocalizations get l10n;
}

final class SettingsWM extends WidgetModel<SettingsScreen, SettingsModel>
    implements ISettingsWM {
  SettingsWM(super.model);

  @override
  void clearCache() => model.clearCache();

  @override
  void swapLanguage() {
    final localeController = LocaleProvider.of(context);

    if (localeController.locale.value == const Locale('ru', 'RU')) {
      localeController.setLocale(const Locale('en', 'EN'));
    } else {
      localeController.setLocale(const Locale('ru', 'RU'));
    }
  }

  @override
  void swapTheme() async {
    await ThemeModeProvider.of(context).switchThemeMode();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  AppLocalizations get l10n => context.l10n;

  @override
  void showDetails() {
    final l10n = context.l10n;
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l10n.detailDialogText),
                    const Text('t.me/Chees8069'),
                    const Text('discord: urbaevartem')
                  ],
                ),
              ),
            ));
  }
}

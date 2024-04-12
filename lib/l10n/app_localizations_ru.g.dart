import 'app_localizations.g.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get photosAppSliverTemplate => 'Фотографии';

  @override
  String get bottomNavBarHomeButtonText => 'Домой';

  @override
  String get bottomNavBarFavouriteButtonText => 'Избранное';

  @override
  String get bottomNavBarSettingsButtonText => 'Настройки';

  @override
  String get swapThemeSetting => 'Сменить тему';

  @override
  String get changeLanguageSetting => 'Сменить язык';

  @override
  String get clearCacheSetting => 'Очистить кэш';

  @override
  String get showDetailsSetting => 'Показать детали';

  @override
  String get detailDialogText => 'Лицензий у меня точно нет..';
}

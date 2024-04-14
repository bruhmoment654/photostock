import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get photosAppSliverTemplate => 'Photos';

  @override
  String get bottomNavBarHomeButtonText => 'Home';

  @override
  String get bottomNavBarFavouriteButtonText => 'Favourite';

  @override
  String get bottomNavBarSettingsButtonText => 'Settings';

  @override
  String get swapThemeSetting => 'Swap Theme';

  @override
  String get changeLanguageSetting => 'Change language';

  @override
  String get clearCacheSetting => 'Clear Cache';

  @override
  String get showDetailsSetting => 'Show Detail';

  @override
  String get detailDialogText => 'Some data about developer';
}

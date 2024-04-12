import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:photostock/features/locale/presentation/widgets/locale_builder.dart';
import 'package:photostock/features/theme_mode/presentation/widgets/theme_mode_builder.dart';
import 'package:photostock/l10n/app_localizations.g.dart';
import 'package:photostock/uikit/themes/app_theme_data.dart';
import 'package:provider/provider.dart';

import '../navigation/domain/service/app_router.dart';

/// {@template app.class}
/// Application.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app.class}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = context.read<AppRouter>();
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(builder: (_, themeMode) {
      return LocaleBuilder(
        builder: (_, locale) => MaterialApp.router(
          /// Navigation.
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: themeMode,

          /// Localization.
          locale: locale,
          supportedLocales: _localizations,
          localizationsDelegates: _localizationsDelegates,
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}

const _localizations = [
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

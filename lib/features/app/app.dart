import 'package:flutter/material.dart';
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


  //TODO: add ThemeMod builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// Navigation.
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.light,
      /// Localization.
      locale: _localizations.firstOrNull,
      supportedLocales: _localizations,
      debugShowCheckedModeBanner: false,
    );
  }
}

const _localizations = [
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
];

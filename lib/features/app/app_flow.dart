import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:photostock/features/theme_mode/presentation/theme_mode_provider.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/di_scope.dart';
import '../navigation/domain/service/app_router.dart';
import 'app.dart';
import 'di/app_scope.dart';

/// {@template app_flow.class}
/// Entry point for the application.
/// {@endtemplate}
class AppFlow extends StatelessWidget {
  /// {@macro app_flow.class}
  const AppFlow({
    required this.appScope,
    super.key,
  });

  /// {@macro app_scope.class}
  final IAppScope appScope;

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        DiScope<IAppScope>(onFactory: (_) => appScope),
        ChangeNotifierProvider<AppRouter>(create: (_) => AppRouter()),
        const ThemeModeProvider()
      ],
      child: const App(),
    );
  }
}

import 'package:flutter/material.dart';
import 'config/environment/environment.dart';
import 'features/app/app_flow.dart';
import 'features/app/di/app_scope_register.dart';

Future<void> run(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _runApp(env);
}

Future<void> _runApp(Environment env) async {
  const scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope(env);

  runApp(AppFlow(appScope: scope));
}

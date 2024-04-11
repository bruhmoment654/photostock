import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_config.dart';
import '../../../config/environment/environment.dart';
import '../../../persistence/storage/photo_storage/i_photo_storage.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  @override
  final Environment env;
  @override
  final AppConfig appConfig;
  @override
  final SharedPreferences sharedPreferences;
  @override
  final Dio dio;
  @override
  final IPhotoStorage photoStorage;

  /// {@macro app_scope.class}
  const AppScope(
      {required this.env,
      required this.appConfig,
      required this.sharedPreferences,
      required this.dio,
      required this.photoStorage});
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// Environment.
  Environment get env;

  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  Dio get dio;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  IPhotoStorage get photoStorage;
}

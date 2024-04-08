import 'package:photostock/config/url.dart';

/// {@template app_config.class}
/// Application configuration.
/// {@endtemplate}
class AppConfig {
  /// Server url.
  final Url url;

  /// Proxy url.
  final String? proxyUrl;

  /// {@macro app_config.class}
  const AppConfig({
    required this.url,
    this.proxyUrl,
  });
}

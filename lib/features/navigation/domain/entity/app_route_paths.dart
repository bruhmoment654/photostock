/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// photo list screen path
  static const photosHomePath = '/photos';

  /// photo detail screen path
  static const photoDetailPath = '/photo';

  static const photoFavPath = '/favourite';

  static const rootScreenPath = '/';

  static const settingsPath = '/settings';
}

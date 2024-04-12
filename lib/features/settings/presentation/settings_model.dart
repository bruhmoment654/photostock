import 'package:elementary/elementary.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SettingsModel extends ElementaryModel {
  final SharedPreferences _prefs;

  void clearCache() async {
    await _prefs.clear();
  }

  SettingsModel(this._prefs);
}

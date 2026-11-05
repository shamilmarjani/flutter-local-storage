import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  PrefService._(this._prefs);

  final SharedPreferences _prefs;

  static const _openCountKey = 'open_count';

  static Future<PrefService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PrefService._(prefs);
  }

  int get openCount => _prefs.getInt(_openCountKey) ?? 0;

  Future<void> increaseOpenCount() async {
    await _prefs.setInt(_openCountKey, openCount + 1);
  }
}

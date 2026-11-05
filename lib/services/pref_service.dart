import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_data.dart';

class PrefService {
  PrefService._(this._prefs);

  final SharedPreferences _prefs;

  static const _openCountKey = 'open_count';
  static const _kDarkMode = 'is_dark_mode';

  // ---------- Tema ----------
  bool get isDarkMode => _prefs.getBool(_kDarkMode) ?? false;

  Future<void> setDarkMode(bool value) => _prefs.setBool(_kDarkMode, value);

  static Future<PrefService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PrefService._(prefs);
  }

  int get openCount => _prefs.getInt(_openCountKey) ?? 0;

  Future<void> increaseOpenCount() async {
    await _prefs.setInt(_openCountKey, openCount + 1);
  }

  static const _kProfile = 'profile_data';

  // ---------- Profil ----------
  ProfileData get profile {
    final raw = _prefs.getString(_kProfile);
    if (raw == null) return ProfileData.defaultData;
    try {
      return ProfileData.fromJson(raw);
    } catch (_) {
      // Data rusak? Jangan crash, kembali ke bawaan.
      return ProfileData.defaultData;
    }
  }

  Future<void> saveProfile(ProfileData profile) =>
      _prefs.setString(_kProfile, profile.toJson());

  Future<void> clearProfile() => _prefs.remove(_kProfile);

  Set<String> get debugKeys => _prefs.getKeys();
  }

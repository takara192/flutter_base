import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_preference_constants.dart';

class SharedPreferencesManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> getInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putDouble(SharedPreferenceKey key, double value) =>
      _sharedPreferences.setDouble(key.name, value);

  static double? getDouble(SharedPreferenceKey key) =>
      _sharedPreferences.getDouble(key.name);

  static Future<bool> putInt(SharedPreferenceKey key, int value) =>
      _sharedPreferences.setInt(key.name, value);

  static int? getInt(SharedPreferenceKey key) => _sharedPreferences.getInt(key.name);

  static Future<bool> putBool(SharedPreferenceKey key, bool value) =>
      _sharedPreferences.setBool(key.name, value);

  static bool? getBool(SharedPreferenceKey key) =>
      _sharedPreferences.getBool(key.name);

  static Future<bool> putString(SharedPreferenceKey key, String value) =>
      _sharedPreferences.setString(key.name, value);

  static String? getString(SharedPreferenceKey key) =>
      _sharedPreferences.getString(key.name);

  static Future<bool> putStringList(SharedPreferenceKey key, List<String> value) =>
      _sharedPreferences.setStringList(key.name, value);

  static List<String> getStringList(SharedPreferenceKey key) =>
      _sharedPreferences.getStringList(key.name) ?? [];

  static Future<void> removeByKey(SharedPreferenceKey key) =>
      _sharedPreferences.remove(key.name);

  //TODO: Add Object type

  /// Clear is now will set the value of each keys to [Null] excluding
  /// the values from excluded keys.
  static Future<void> clear([List<SharedPreferenceKey>? exclude]) async {
    [...SharedPreferenceKey.values]
      ..removeWhere((element) => exclude?.contains(element) ?? false)
      ..forEach(
            (element) {
          if (element != SharedPreferenceKey.keyAccessToken) {
            putString(element, '');
          }
        },
      );
  }
}

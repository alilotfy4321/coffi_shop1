// ignore_for_file: type_literal_in_constant_pattern

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> getInit() async {
    return await _getInstance();
  }

  // Save String
  static Future<void> saveSharedPrefData({required key, required value}) async {
    final prefs = await _getInstance();
    switch (value) {
      case String:
        await prefs.setString(key, value);
      case int:
        await prefs.setInt(key, value);
      case double:
        await prefs.setDouble(key, value);
      case bool:
        await prefs.setBool(key, value);
    }
  }

  // Get String
  static Future<dynamic> getSharedPrefData(String key) async {
    final prefs = await _getInstance();
    return prefs.getString(key);
  }

  // Remove a specific key
  static Future<void> remove(String key) async {
    final prefs = await _getInstance();
    await prefs.remove(key);
  }

  // Clear all keys
  static Future<void> clear() async {
    final prefs = await _getInstance();
    await prefs.clear();
  }

  // Check if a key exists
  static Future<bool> containsKey(String key) async {
    final prefs = await _getInstance();
    return prefs.containsKey(key);
  }
}

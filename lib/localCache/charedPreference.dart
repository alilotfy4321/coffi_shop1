import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences>getInit() async{
      return await _getInstance();
  } 

  // Save String
  static Future<void> saveString(String key, String value) async {
    final prefs = await _getInstance();
    await prefs.setString(key, value);
  }

  // Get String
  static Future<String?> getString(String key) async {
    final prefs = await _getInstance();
    return prefs.getString(key);
  }

  // Save Integer
  static Future<void> saveInt(String key, int value) async {
    final prefs = await _getInstance();
    await prefs.setInt(key, value);
  }

  // Get Integer
  static Future<int?> getInt(String key) async {
    final prefs = await _getInstance();
    return prefs.getInt(key);
  }

  // Save Boolean
  static Future<void> saveBool(String key, bool value) async {
    final prefs = await _getInstance();
    await prefs.setBool(key, value);
  }

  // Get Boolean
  static Future<bool?> getBool(String key) async {
    final prefs = await _getInstance();
    return prefs.getBool(key);
  }

  // Save Double
  static Future<void> saveDouble(String key, double value) async {
    final prefs = await _getInstance();
    await prefs.setDouble(key, value);
  }

  // Get Double
  static Future<double?> getDouble(String key) async {
    final prefs = await _getInstance();
    return prefs.getDouble(key);
  }

  // Save List of Strings
  static Future<void> saveStringList(String key, List<String> value) async {
    final prefs = await _getInstance();
    await prefs.setStringList(key, value);
  }

  // Get List of Strings
  static Future<List<String>?> getStringList(String key) async {
    final prefs = await _getInstance();
    return prefs.getStringList(key);
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

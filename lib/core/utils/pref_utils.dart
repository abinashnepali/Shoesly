import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  static final PrefUtils _instance = PrefUtils._internal();

  factory PrefUtils() {
    return _instance;
  }

  PrefUtils._internal();

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharePreferneces Initialized');
  }

  void clearSharePreferences() {
    if (_sharedPreferences != null) {
      _sharedPreferences!.clear();
    } else {
      print('SharedPreferences not initialized');
    }
  }

  Future<void> removePref(String key) async {
    if (_sharedPreferences != null) {
      await _sharedPreferences!.remove(key);
    } else {
      print('SharedPreferences not initialized');
    }
  }

  Future<void> setThemeData(String value) async {
    if (_sharedPreferences != null) {
      await _sharedPreferences!.setString('themeData', value);
    } else {
      print('SharedPreferences not initialized');
    }
  }

  String getThemeData() {
    if (_sharedPreferences != null) {
      return _sharedPreferences!.getString('themeData') ?? 'primary';
    } else {
      print('SharedPreferences not initialized');
      return 'primary';
    }
  }

  Future<void> setString(String key, String value) async {
    if (_sharedPreferences != null) {
      await _sharedPreferences!.setString(key, value);
    } else {
      print('SharedPreferences not initialized');
    }
  }

  String? getString(String key) {
    return _getString(key);
  }

  String? _getString(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences!.getString(key);
    } else {
      print('SharedPreferences not initialized');
      return null;
    }
  }
}

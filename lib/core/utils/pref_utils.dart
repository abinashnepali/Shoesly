import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharePreferences = value;
    });
  }

  static SharedPreferences? _sharePreferences;

  Future<void> init() async {
    _sharePreferences ??= await SharedPreferences.getInstance();
    print('SharePreferneces Initialized');
  }

  void clearSharePreferences() {
    _sharePreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharePreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharePreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}

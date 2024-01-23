import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<void> saveLocalCode(String code) async {
    final cache = await SharedPreferences.getInstance();
    cache.setString('LANG_CODE', code);
  }

  Future<String> getLocalCode() async {
    final cache = await SharedPreferences.getInstance();
    return cache.getString('LANG_CODE') ?? 'en';
  }

  Future<void> saveThemeIndex(int index) async {
    final cache = await SharedPreferences.getInstance();
    cache.setInt('THEME_INDEX', index);
  }

  Future<int> getThemeIndex() async {
    final cache = await SharedPreferences.getInstance();
    return cache.getInt('THEME_INDEX') ?? 0;
  }
}

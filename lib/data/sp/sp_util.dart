import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {

  static Future<SharedPreferences> get _getSp async => SharedPreferences.getInstance();

  static final _userName = 'user_name';
  static final _userPassword = 'user_password';

  Future<String> getName() async {
    final prefs = await _getSp;
    return prefs.getString(_userName) ?? '';
  }

  Future<String> getPassword() async {
    final prefs = await _getSp;
    return prefs.getString(_userPassword) ?? '';
  }

  Future<void> setName(String name) async {
    final prefs = await _getSp;
    await prefs.setString(_userName, name);
  }

  Future<void> setPassword(String password) async {
    final prefs = await _getSp;
    await prefs.setString(_userPassword, password);
  }
}
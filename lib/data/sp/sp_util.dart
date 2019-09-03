import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static final _userName = 'user_name';
  static final _userPassword = 'user_password';

  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName) ?? '';
  }

  static Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPassword) ?? '';
  }

  static Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, name);
  }

  static Future<void> setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPassword, password);
  }

}
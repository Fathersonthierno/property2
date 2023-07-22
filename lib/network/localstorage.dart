import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static final String _authToken = "token";
  static final String _authRefreshToken = "refresh_token";

  static Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(token) async {
    final prefs = await getSharedPreferences();

    await prefs.setString(_authToken, token);
    await prefs.reload();
  }
  static Future<void> saveRefreshToken(token) async {
    final prefs = await getSharedPreferences();

    await prefs.setString(_authRefreshToken, token);
    await prefs.reload();
  }

  static Future<void> clearToken() async {
    final prefs = await getSharedPreferences();

    prefs.remove(_authToken);
  }

  static Future<Object?> getToken() async {
    final prefs = await getSharedPreferences();
    return prefs.get(_authToken);
  }
  static Future<Object?> getRefreshToken() async {
    final prefs = await getSharedPreferences();
    return prefs.get(_authRefreshToken);
  }
}
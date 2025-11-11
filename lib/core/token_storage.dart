import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _expiryTimeKey = 'token_expiry';

  static Future<void> saveToken(String token, int expiresInSeconds) async {
    final prefs = await SharedPreferences.getInstance();
    final expiry = DateTime.now().add(Duration(seconds: expiresInSeconds));
    await prefs.setString(_accessTokenKey, token);
    await prefs.setString(_expiryTimeKey, expiry.toIso8601String());
  }

  static Future<String?> getValidAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_accessTokenKey);
    final expiryStr = prefs.getString(_expiryTimeKey);

    if (token != null && expiryStr != null) {
      final expiryTime = DateTime.tryParse(expiryStr);
      if (expiryTime != null && expiryTime.isAfter(DateTime.now())) {
        return token; // Token vẫn còn hạn
      }
    }

    return null; // Token hết hạn hoặc không tồn tại
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_expiryTimeKey);
  }
}
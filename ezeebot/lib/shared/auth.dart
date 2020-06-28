import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  Future<bool> isUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return (preferences.getString("authToken") != null);
  }

  Future<bool> setAuthTokenPreference(String authToken, String userCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userCode', userCode);
    prefs.setString('authToken', authToken);
    return true;
  }

  Future<bool> setFcmAuthTokenPreference(String fcmAuthToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fcmAuthToken', fcmAuthToken);
    return true;
  }

  Future<String> getAuthToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("authToken");
  }

  Future<String> getFcmAuthToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("fcmAuthToken");
  }

  Future<String> getUserCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("userCode");
  }

  Future<bool> clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
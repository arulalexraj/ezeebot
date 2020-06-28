import 'dart:async';
import 'dart:convert';

import 'package:ezeebot/models/auth.dart';
import 'package:ezeebot/services/http-client.dart';
import 'package:ezeebot/shared/auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  UserAuth _userAuth;

  AuthService() {
    _userAuth = UserAuth();
  }

  Future<AuthModel> validateOtp(String Otp) async {
    try {
      var response = await HttpClient.post('/busservices/api/bot/notification/authenticate/otp/$Otp');
      var responseBody = jsonDecode(response.body);
      if (responseBody['data'] != null) {
        var authModel = AuthModel.fromJson(responseBody['data']);
        await _userAuth.setAuthTokenPreference(authModel.authToken, authModel.userCode);
        return authModel;
      }
    } catch (ex) {
      debugPrint('Exception: ' + ex.toString());
    }
    return null;
  }
}

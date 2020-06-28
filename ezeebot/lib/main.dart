import 'package:ezeebot/home/home-page.dart';
import 'package:ezeebot/services/fcm-api.dart';
import 'package:ezeebot/shared/auth.dart';
import 'package:ezeebot/subscriptions/subscriptions.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _startupPage = EzeeBotForm();
  var _userAuth = UserAuth();
  var _fcmService = FcmService();
  var fcmToken = await _userAuth.getFcmAuthToken();
  if (fcmToken == null) {
    await _fcmService.getFcmAuthToken();
  }
  await _fcmService.initialize();
  if (await _userAuth.isUserLoggedIn()) {
    _startupPage = MaterialApp(title: 'EzeeBot', debugShowCheckedModeBanner: false, home: SubscriptionForm());
  }
  runApp(_startupPage);
}

class EzeeBotForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzeeBot',
      debugShowCheckedModeBanner: false,
      home: HomePageForm(),
    );
  }
}

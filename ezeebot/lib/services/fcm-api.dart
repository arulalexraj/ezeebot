import 'package:ezeebot/shared/auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  UserAuth _userAuth;

  FcmService() {
    _userAuth = UserAuth();
  }

  Future<String> getFcmAuthToken() async {
    var fcmToken = await _firebaseMessaging.getToken();
    await _userAuth.setFcmAuthTokenPreference(fcmToken);
    return fcmToken;
  }

  Future initialize() async {
    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) async {
      print('onMessage $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('onResume $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch $message');
    });
  }
}

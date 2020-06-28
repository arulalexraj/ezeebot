import 'package:ezeebot/services/http-client.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionService {
  Future<bool> getSubscriptionList(String authToken, Map<String, dynamic> body) async {
    try {
      var response = await HttpClient.post('/busservices/api/bot/notification/authenticate/subscription/' + authToken, data: body);
      var responseBody = response.body;
    } catch (ex) {
      debugPrint('Exception: ' + ex.toString());
    }
  }
}

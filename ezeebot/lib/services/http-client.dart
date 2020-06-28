import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  static String baseUrl = "http://app.ezeebits.com/";

  static Future<http.Response> get(url) async {
    return await http.get(Uri.encodeFull(baseUrl + url));
  }

  static Future<http.Response> post(url, {Map<String, dynamic> data}) async {
    return await http.post(Uri.encodeFull(baseUrl + url), body: jsonEncode(data), headers: {"Content-type": "application/json"});
  }
}

import 'package:flutter/material.dart';

class CustomNavigator {
  static void pushAndRemoveUntil(BuildContext context, Object page) {
    var navigator = Navigator.of(context);
    var route = MaterialPageRoute(builder: ((BuildContext context) => page));
    navigator.pushAndRemoveUntil(route, (Route<dynamic> route) {
      return route.isFirst;
    });
  }

  static void push(BuildContext context, Object page) {
    var navigator = Navigator.of(context);
    navigator.push(MaterialPageRoute(builder: ((BuildContext context) => page))) ;
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

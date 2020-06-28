import 'package:ezeebot/shared/navigator.dart';
import 'package:flutter/material.dart';

class MessageBox {
  static void toastMessage(BuildContext context, String message){
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Yay! A SnackBar!'),
      behavior: SnackBarBehavior.fixed,
    ));
  }
  static void successMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green)),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => CustomNavigator.pop(context),
              )
            ],
          );
        });
  }

  static void warningMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => CustomNavigator.pop(context),
              )
            ],
          );
        });
  }

  static void errorMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => CustomNavigator.pop(context),
              )
            ],
          );
        });
  }
}

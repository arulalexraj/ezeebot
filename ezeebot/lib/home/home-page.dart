import 'package:ezeebot/shared/navigator.dart';
import 'package:ezeebot/subscriptions/subscriptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageFormState();
  }
}

class _HomePageFormState extends State<HomePageForm> {
  double _minPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: screenSize.height / 1.2,
          ),
          child: Image(image: AssetImage('images/bottom-bg-bot.png'), width: 100, height: 142, fit: BoxFit.fill),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height / 6, left: _minPadding * 5),
          alignment: Alignment.topCenter,
          child: Image(image: AssetImage('images/bg-bot.png'), width: 250, height: 240, fit: BoxFit.fill),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height / 9, right: _minPadding * 7),
          alignment: Alignment.topCenter,
          child: Image(image: AssetImage('images/robot.png'), width: 400, height: 400, fit: BoxFit.fill),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height / 2),
          alignment: Alignment.topCenter,
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Text("EZEE", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 35, fontWeight: FontWeight.bold)),
              Text("BOT", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 35))
            ]),
            Padding(padding: EdgeInsets.only(top: _minPadding * 2), child: Text("A BOT OF NOTIFICATIONS", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 18)))
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height / 1.9),
          padding: EdgeInsets.only(left: _minPadding * 12, right: _minPadding * 12),
          alignment: Alignment.center,
          child: RaisedButton(
            color: Colors.indigo,
            elevation: 2.0,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(padding: EdgeInsets.all(_minPadding * 2), child: Text("Let's Begin", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Colors.white)))
            ]),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            onPressed: () => CustomNavigator.push(context, SubscriptionForm()),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height / 1.1),
          alignment: Alignment.center,
          child: Text("Product of Ezeeinfo Cloud Solutions", style: TextStyle(fontFamily: 'Roboto', fontSize: 10)),
        ),
      ],
    ));
  }
}

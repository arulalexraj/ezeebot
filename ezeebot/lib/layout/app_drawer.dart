import 'dart:math';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatefulWidget {
  final int activeTab;

  AppDrawer({this.activeTab});

  @override
  State<StatefulWidget> createState() {
    return _AppDrawerState(this.activeTab);
  }
}

class _AppDrawerState extends State<AppDrawer> {
  double _minPadding = 5.0;
  final int activeTab;

  _AppDrawerState(this.activeTab);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextStyle subtitle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);

    return SafeArea(
        top: true,
        child: Container(
            margin: EdgeInsets.only(top: _minPadding * 11.26),
            child: Drawer(
                elevation: 2.0,
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
                  child: Stack(children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      margin: EdgeInsets.only(top: _minPadding * 6, left: _minPadding * 15),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(220, 220, 220, 1.0),
                          borderRadius: BorderRadius.circular(80.0),
                          image: DecorationImage(image: AssetImage('images/robot.png'), fit: BoxFit.fill)),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: _minPadding * 7.5, left: screenSize.width / 2),
                        child: Transform.rotate(angle: 90 * pi / 65, child: Icon(FontAwesomeIcons.comment, size: 18.0))),
                    Container(
                      height: 15.0,
                      width: 15.0,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: _minPadding * 8.8, left: _minPadding * 38.5),
                      decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(80.0)),
                      child: Text("5", style: TextStyle(color: Colors.white, fontSize: 9)),
                    ),
                    Container(
                        width: screenSize.width / 1.45,
                        margin: EdgeInsets.only(top: screenSize.height / 3.1, left: _minPadding * 3),
                        decoration: BoxDecoration(boxShadow: kElevationToShadow[1], color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(FontAwesomeIcons.edit, size: 20),
                              title: Text("Subscriptions", style: subtitle),
                              trailing: Container(
                                  height: _minPadding * 4,
                                  width: _minPadding * 4,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(80.0)),
                                  child: Icon(Icons.chevron_right, size: 20)),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.envelopeOpenText, size: 22),
                              title: Text("Share App", style: subtitle),
                              trailing: Container(
                                  height: _minPadding * 4,
                                  width: _minPadding * 4,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(80.0)),
                                  child: Icon(Icons.chevron_right, size: 20)),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.headset_mic, size: 22),
                              title: Text("Customer Support", style: subtitle),
                              trailing: Container(
                                  height: _minPadding * 4,
                                  width: _minPadding * 4,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(80.0)),
                                  child: Icon(Icons.chevron_right, size: 20)),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.clipboardCheck, size: 22),
                              title: Text("Make a Suggestion", style: subtitle),
                              trailing: Container(
                                  height: _minPadding * 4,
                                  width: _minPadding * 4,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(80.0)),
                                  child: Icon(Icons.chevron_right, size: 20)),
                            )
                          ],
                        ))
                  ]),
                ))));
  }
}

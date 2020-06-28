import 'dart:math';

import 'package:ezeebot/layout/app_drawer.dart';
import 'package:ezeebot/layout/appbar.dart';
import 'package:ezeebot/models/notification-group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardFormState();
  }
}

class _DashboardFormState extends State<DashboardForm> {
  double _minPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarForm.CustomAppBar(title: 'Dashboard', isShowSearch: true),
        drawerScrimColor: Colors.transparent,
        drawer: AppDrawer(activeTab: 0),
        body: Padding(
            padding: EdgeInsets.all(_minPadding * 3),
            child: ListView(physics: ScrollPhysics(), children: <Widget>[
              Row(children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Welcome, Deepak", style: TextStyle(fontFamily: "Roboto", fontSize: 23, fontWeight: FontWeight.bold)),
                    Row(children: <Widget>[
                      Icon(Icons.home, color: Colors.blue, size: 15),
                      Text("Dashboard", style: TextStyle(fontFamily: "Roboto", fontSize: 10, color: Colors.blue)),
                      Text("Last Updated 3 Mints ago", style: TextStyle(fontFamily: "Roboto", fontSize: 10, color: Colors.grey))
                    ])
                  ],
                ),
                Expanded(
                    child: Column(children: <Widget>[
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 15,
                          )))
                ]))
              ]),
              Padding(
                  padding: EdgeInsets.only(top: _minPadding * 2),
                  child: Row(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(_minPadding * 5),
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          width: screenSize.width / 2.5,
                          child:
                              Center(child: Text("Show All Notification", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Roboto", fontSize: 19, color: Colors.white))),
                        ),
                      ]),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: _minPadding * 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Total", style: TextStyle(fontFamily: "Roboto", fontSize: 12, fontWeight: FontWeight.bold)),
                                      ),
                                      Expanded(
                                        child: Text("368", style: TextStyle(fontFamily: "Roboto", fontSize: 12, fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: _minPadding),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text("Unread", style: TextStyle(fontFamily: "Roboto", fontSize: 10)),
                                          ),
                                          Expanded(
                                            child: Text("68", style: TextStyle(fontFamily: "Roboto", fontSize: 10)),
                                          )
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(top: _minPadding),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text("Read", style: TextStyle(fontFamily: "Roboto", fontSize: 10)),
                                          ),
                                          Expanded(
                                            child: Text("200", style: TextStyle(fontFamily: "Roboto", fontSize: 10)),
                                          )
                                        ],
                                      ))
                                ],
                              ))),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: _minPadding * 2),
                child: Container(
                  padding: EdgeInsets.all(_minPadding * 2),
                  color: Color.fromRGBO(229, 246, 255, 0.5),
                  width: screenSize.width,
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.solidCommentAlt, color: Colors.grey, size: 18),
                      Padding(padding: EdgeInsets.only(left: _minPadding), child: Text("Notifications")),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: _minPadding),
                        alignment: Alignment.topRight,
                        child: Transform.rotate(angle: 90 * pi / 60, child: Icon(Icons.tune, color: Colors.grey)),
                      ))
                    ],
                  ),
                ),
              ),
              Container(height: 600, padding: EdgeInsets.only(top: _minPadding), child: _loadTileNotification(context))
            ])));
  }

  Widget _loadTileNotification(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var notificationGroupList = getListOfGroupNofification();
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(notificationGroupList.length, (index) {
        var notificationGroup = notificationGroupList[index];
        return Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              margin: EdgeInsets.all(_minPadding),
              width: screenSize.width / 4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: notificationGroup.groupColor != null ? notificationGroup.groupColor : Color.fromRGBO(229, 246, 255, 0.5),
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color.fromRGBO(198, 191, 191, 0.5), width: 2.0)),
              child: Text(notificationGroup.groupName, textAlign: TextAlign.center, style: TextStyle(fontFamily: "Roboto", fontSize: 12, color: notificationGroup.groupColor != null ? Colors.white : Colors.black,))),
          Container(
            padding: EdgeInsets.all(_minPadding * 2),
            alignment: Alignment.topLeft,
            child: notificationGroup.isStared ? Icon(Icons.star, color: Colors.yellow, size: 15) : Icon(Icons.star, size: 15, color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(left: _minPadding * 13),
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(80.0), border: Border.all(color: Colors.white, width: 1.0)),
            child: Text(notificationGroup.messageCount.toString(), textAlign: TextAlign.center, style: TextStyle(fontFamily: "Roboto", fontSize: 10, color: Colors.white)),
          ),
        ]);
      }),
    );
  }

  List<NotificationGroupModel> getListOfGroupNofification() {
    List<NotificationGroupModel> notificationGroupList = List<NotificationGroupModel>();
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", true, 3, groupColor: Colors.indigoAccent));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", true, 2, groupColor: Colors.orangeAccent));
    notificationGroupList.add(NotificationGroupModel("Vehicle Running", true, 5, groupColor: Color.fromRGBO(0, 202, 242, 0.5)));
    notificationGroupList.add(NotificationGroupModel("New Boarding", true, 3, groupColor: Color.fromRGBO(246, 211, 101, 0.5)));
    notificationGroupList.add(NotificationGroupModel("Check Vehicle Halt", true, 2, groupColor: Colors.green));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", false, 1));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", false, 3));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", false, 4));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", false, 3));
    notificationGroupList.add(NotificationGroupModel("Trip Cancel", false, 7));
    return notificationGroupList;
  }
}

import 'package:device_info/device_info.dart';
import 'package:ezeebot/dashboard/dashboard.dart';
import 'package:ezeebot/layout/appbar.dart';
import 'package:ezeebot/models/subscription.dart';
import 'package:ezeebot/services/subscription-api.dart';
import 'package:ezeebot/shared/date-formatter.dart';
import 'package:flutter/material.dart';
import 'package:ezeebot/layout/app_drawer.dart';
import 'package:ezeebot/shared/navigator.dart';
import 'package:ezeebot/subscriptions/otp-verification.dart';

class SubscriptionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubscriptionFormState();
  }
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  double _minPadding = 5.0;
  bool _isDataAvailable = false;

  _SubscriptionFormState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var subscriptionList = getListOfSubscription();
    return Scaffold(
        appBar: AppBarForm.CustomAppBar(),
        drawerScrimColor: Colors.transparent,
        drawer: AppDrawer(activeTab: 0),
        body: !_isDataAvailable
            ? ListView(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: _minPadding * 2),
                      alignment: Alignment.topCenter,
                      child: Image(image: AssetImage('images/ezeebot-logo.png'), height: 350, width: 300, fit: BoxFit.fill)),
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topCenter,
                          child: Text("No Subscriptions Made",
                              style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.bold))),
                      Container(
                          padding: EdgeInsets.only(left: _minPadding * 5, top: _minPadding * 5, right: _minPadding * 5),
                          alignment: Alignment.topCenter,
                          child: Text("Contact your administrator",
                              style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontSize: 14, fontFamily: 'Roboto', fontStyle: FontStyle.italic))),
                      Container(
                          alignment: Alignment.topCenter,
                          child: Text("or view subscription menu for more details",
                              style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontSize: 14, fontFamily: 'Roboto', fontStyle: FontStyle.italic))),
                      Container(
                        padding: EdgeInsets.only(top: _minPadding * 8),
                        alignment: Alignment.center,
                        child: RaisedButton(
                          color: Colors.indigo,
                          elevation: 2.0,
                          child: Padding(
                              padding: EdgeInsets.only(top: _minPadding * 2, bottom: _minPadding * 2, left: _minPadding * 8, right: _minPadding * 8),
                              child: Text("Subscriptions", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Colors.white))),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: () => CustomNavigator.push(context, OTPVerificationForm()),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: _minPadding * 3),
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text("Go to list", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Colors.indigo)),
                          onTap: () {
                            setState(() {
                              this._isDataAvailable = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ))
                ],
              )
            : ListView(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0)),
                      boxShadow: kElevationToShadow[3]),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        children: <Widget>[Image(image: AssetImage('images/subscribe.png'), fit: BoxFit.fill)],
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: _minPadding),
                              child: Text("Your", style: TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold))),
                          Padding(
                              padding: EdgeInsets.only(top: _minPadding),
                              child: Text("Subscriptions", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold))),
                          Padding(
                              padding: EdgeInsets.only(top: _minPadding),
                              child: Text("Contact your administrator for Subscription OTP",
                                  style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontFamily: 'Roboto', fontSize: 8))),
                        ],
                      ))
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(_minPadding * 3),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: subscriptionList.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var subscription = subscriptionList[index];
                          return GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(left: _minPadding * 3, right: _minPadding * 3, top: _minPadding * 3, bottom: _minPadding * 3),
                                margin: EdgeInsets.only(top: _minPadding * 2),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(238, 247, 251, 1.0), boxShadow: kElevationToShadow[1], borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                child: Row(children: <Widget>[
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image(image: AssetImage('images/bits-logo.png'), fit: BoxFit.fill),
                                      Padding(padding: EdgeInsets.only(top: _minPadding * 2), child: Text("Bits Inventory"))
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(subscription.name, style: TextStyle(color: Colors.grey, fontFamily: 'Roboto')),
                                      Padding(
                                          padding: EdgeInsets.only(top: _minPadding),
                                          child: Text(subscription.subscriptionName, style: TextStyle(color: Colors.grey, fontFamily: 'Roboto'))),
                                      Padding(
                                          padding: EdgeInsets.only(top: _minPadding),
                                          child: Text('Subscribed on ' + DateFormatter.formatDate(subscription.subscribedOn, 'dd MMM yyyy'),
                                              style: TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 9.0))),
                                      Padding(
                                        padding: EdgeInsets.only(top: _minPadding),
                                        child: GestureDetector(
                                            child: Container(
                                          padding: EdgeInsets.all(_minPadding),
                                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(_minPadding))),
                                          child: Text("Unsubscribe", style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 10.0)),
                                        )),
                                      )
                                    ],
                                  ))
                                ])),
                            onTap: () => CustomNavigator.push(context, DashboardForm()),
                          );
                        }))
              ]));
  }

  List<SubscriptionModel> getListOfSubscription() {
    List<SubscriptionModel> subscriptionList = List<SubscriptionModel>();
    subscriptionList.add(SubscriptionModel('Deepak', 'Tranzking Travels', DateTime.now()));
    subscriptionList.add(SubscriptionModel('Deepak', 'YBM Travels', DateTime.now()));
    return subscriptionList;
  }
}

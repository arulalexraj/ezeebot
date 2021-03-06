import 'package:device_info/device_info.dart';
import 'package:ezeebot/layout/app_drawer.dart';
import 'package:ezeebot/layout/appbar.dart';
import 'package:ezeebot/services/auth-api.dart';
import 'package:ezeebot/services/subscription-api.dart';
import 'package:ezeebot/shared/auth.dart';
import 'package:ezeebot/shared/messageBox.dart';
import 'package:ezeebot/shared/navigator.dart';
import 'package:ezeebot/subscriptions/subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

class OTPVerificationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OTPVerificationFormState();
  }
}

class _OTPVerificationFormState extends State<OTPVerificationForm> {
  double _minPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  TextEditingController sixthController = TextEditingController();

  AuthService _authService;
  UserAuth _userAuth;
  SubscriptionService _subscriptionService;

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(width: 1, color: Color.fromRGBO(222, 241, 248, 5.0)),
  );

  var outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(width: 1, color: Color.fromRGBO(211, 138, 139, 5.0)),
  );

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _userAuth = UserAuth();
    _subscriptionService = SubscriptionService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarForm.CustomAppBar(),
        drawerScrimColor: Colors.transparent,
        drawer: AppDrawer(activeTab: 0),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: _minPadding * 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  Text("Enter", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(" One Time Password", style: TextStyle(fontFamily: 'Roboto', fontSize: 18))
                ])),
            Container(
                padding: EdgeInsets.only(top: _minPadding * 2),
                alignment: Alignment.topCenter,
                child: Text("Contact your administrator for Subscription OTP", style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontFamily: 'Roboto', fontSize: 11))),
            Container(
                alignment: Alignment.topCenter,
                child: Text("Request for adding BITS", style: TextStyle(color: Color.fromRGBO(255, 164, 232, 1.0), fontFamily: 'Roboto', fontSize: 11))),
            Container(
                padding: EdgeInsets.only(left: _minPadding * 8, right: _minPadding * 8, top: _minPadding * 7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: firstController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: secondController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: thirdController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: fourthController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: fifthController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(_minPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: sixthController,
                              maxLength: 1,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                errorBorder: outlineInputErrorBorder,
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: Color.fromRGBO(222, 241, 248, 5.0),
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hoverColor: Color.fromRGBO(24, 32, 114, 5.0),
                              ),
                            ))),
                  ],
                )),
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: _minPadding * 5, left: _minPadding * 8),
              child: Row(children: <Widget>[
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(80.0)),
                ),
                Text("  23 Sec")
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: _minPadding * 8),
              alignment: Alignment.center,
              child: RaisedButton(
                  color: Colors.indigo,
                  elevation: 2.0,
                  child: Padding(
                      padding: EdgeInsets.only(top: _minPadding * 2, bottom: _minPadding * 2, left: _minPadding * 15, right: _minPadding * 15),
                      child: Text("Verify", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Colors.white))),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () async {
                    String Otp = firstController.text.trim() +
                        secondController.text.trim() +
                        thirdController.text.trim() +
                        fourthController.text.trim() +
                        fifthController.text.trim() +
                        sixthController.text.trim();
                    var response = await _authService.validateOtp(Otp);
                    if (response != null) {
                      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
                      String udid = await FlutterUdid.udid;
                      var device = await deviceInfoPlugin.androidInfo;
                      String fcmAuthToken = await _userAuth.getFcmAuthToken();
                      String userCode = await _userAuth.getUserCode();
                      var map = Map<String, dynamic>();
                      map['udid'] = udid;
                      map['gcmToken'] = fcmAuthToken;
                      map['os'] = device.version.codename;
                      map['model'] = device.model;
                      map['brand'] = device.board;
                      map['code'] = userCode;
                      var deviceMedium = Map<String, dynamic>();
                      deviceMedium['code'] = "EZBOT";
                      map['deviceMedium'] = deviceMedium;
                      await _subscriptionService.getSubscriptionList(userCode, map);
                      CustomNavigator.push(context, SubscriptionForm());
                    } else {
                      MessageBox.warningMessage(context, "Sorry!! Unable to subscribe....");
                    }
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: _minPadding * 3),
              alignment: Alignment.topCenter,
              child: Text("Request again", style: TextStyle(color: Colors.pink, fontFamily: 'Roboto', fontSize: 12)),
            ),
            Container(
                padding: EdgeInsets.only(top: _minPadding),
                alignment: Alignment.topCenter,
                child: Image(image: AssetImage('images/otp.png'), height: 300, width: 300, fit: BoxFit.fill))
          ],
        ));
  }
}

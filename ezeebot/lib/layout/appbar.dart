import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarForm {
  static double _minPadding = 5.0;

  static CustomAppBar({String title, bool isShowSearch}) {
    return AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.indigo),
        title: title != null ? Text(title, style: TextStyle(color: Colors.black)) : Container(),
        centerTitle: true,
        actions: <Widget>[
          isShowSearch == true ? Padding(padding: EdgeInsets.only(right: _minPadding * 2), child: Icon(Icons.search, size: 30.0)) : Container(),
        ]);
  }

  @override
  Size get preferredSize => null;
}

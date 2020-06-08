import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarForm {
  static double _minPadding = 5.0;

  static CustomAppBar() {
    return AppBar(
      elevation: 5.0,
      backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.indigo),
    );
  }

  @override
  Size get preferredSize => null;
}

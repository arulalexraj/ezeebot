import 'package:ezeebot/home/home-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzeeBot',
      debugShowCheckedModeBanner: false,
      home: HomePageForm(),
    );
  }
}

import 'package:flutter/material.dart';

class NotificationGroupModel {
  String groupName;
  bool isStared;
  int messageCount;
  Color groupColor;

  NotificationGroupModel(this.groupName, this.isStared, this.messageCount, {this.groupColor});
}

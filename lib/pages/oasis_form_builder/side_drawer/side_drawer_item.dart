import 'package:flutter/material.dart';

class SideDrawerItem {
  String itemTitle;
  int? commentCount;
  Widget widget;

  SideDrawerItem({
     this.commentCount = 0,
    required this.itemTitle,
    required this.widget,
  });
}

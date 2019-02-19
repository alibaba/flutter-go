 /// Created with Android Studio.
 /// User: 三帆
 /// Date: 20/01/2019
 /// Time: 22:28
 /// email: sanfan.hx@alibaba-inc.com
 /// target:  CupertinoTabBar

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<TextDemo> {
  int index = 0;
  Duration timer = new Duration(minutes: 50);

  Widget build(BuildContext context) {
    return  Text("i'm a text");
  }
}
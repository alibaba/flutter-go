/// Created with Android Studio.
/// User: 三帆
/// Date: 14/01/2019
/// Time: 23:00
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_go/views/welcome_page/fourth_page.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(color: Colors.white, child: FourthPage());
  }
}

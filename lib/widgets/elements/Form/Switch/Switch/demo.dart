/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 27/12/2018
 * Time: 17:30
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';



class SwitchDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<SwitchDemo> {
  bool check = false;
  Widget build(BuildContext context) {
    return new Switch(
      value: this.check,
      onChanged: (bool val) {
        this.setState(() {
          this.check = !this.check;
        });
      },
    );
  }
}

class SwitchHighDemo extends StatefulWidget {
  _SwitchHighDemo createState() => _SwitchHighDemo();
}

class _SwitchHighDemo extends State<SwitchHighDemo> {
  bool check = false;
  Widget build(BuildContext context) {
    return new Switch.adaptive(
      value: this.check,
      activeColor: Colors.blue,     // 激活时原点颜色
      onChanged: (bool val) {
        this.setState(() {
          this.check = !this.check;
        });
      },
    );
  }
}


class SwitchTypesDemo extends StatefulWidget {
  _SwitchTypesDemo createState() => _SwitchTypesDemo();
}

class _SwitchTypesDemo extends State<SwitchTypesDemo> {
  bool check = false;
  Widget build(BuildContext context) {
    return new Switch(
      value: this.check,
      activeTrackColor:Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveThumbImage: NetworkImage('https://flutter.io/images/homepage/header-illustration.png'),
      activeThumbImage: NetworkImage(
          "https://flutter.io/images/homepage/screenshot-2.png"
      ),
      inactiveTrackColor: Colors.yellow,
      activeColor: Colors.blue,     // 激活时原点颜色
      onChanged: (bool val) {
        this.setState(() {
          this.check = !this.check;
        });
      },
    );
  }
}
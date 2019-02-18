/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 15/01/2019
 * Time: 22:23
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  CupertinoSwitchDemo
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoSwitchDemo> {
  bool _lights = false;
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text('CupertinoSwitch'),
        trailing: CupertinoSwitch(
          activeColor: Colors.yellow,
          value: _lights,
          onChanged: (bool value) { setState(() { _lights = value; }); },
        ),
        onTap: () { setState(() { _lights = !_lights; }); },
      ),
    );
  }

}


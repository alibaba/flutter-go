/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 28/12/2018
 * Time: 15:48
 * email: sanfan.hx@alibaba-inc.com
 * target:  xxx
 */

import 'package:flutter/material.dart';



class SwitchListTileDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<SwitchListTileDemo> {
  bool _lights = false;
  Widget build(BuildContext context) {
    return  SwitchListTile(
      title: const Text('Lights'),
      value: _lights,
      onChanged: (bool value) { setState(() { _lights = value; }); },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}
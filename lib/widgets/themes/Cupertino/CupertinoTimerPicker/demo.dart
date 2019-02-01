/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 20/01/2019
 * Time: 22:28
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  CupertinoTabBar
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPickerDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoTimerPickerDemo> {
  int index = 0;
  Duration timer =  Duration(minutes: 50);

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) {
              return _buildBottomPicker(CupertinoTimerPicker(
                initialTimerDuration: timer,
                minuteInterval: 5,
                  onTimerDurationChanged: (Duration newTimer) {
                  setState(() => timer = newTimer);
                },
              ));
            },
          );
        },
        child: Text("点我弹出"),
    );
  }
}
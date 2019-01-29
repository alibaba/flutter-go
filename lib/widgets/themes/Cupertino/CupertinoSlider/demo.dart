/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 15/01/2019
 * Time: 22:23
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoSliderDemo> {
  double value = 0.0;
  Widget build(BuildContext context) {
    return new CupertinoSlider(
      value: value,//实际进度的位置
      min: 0.0,
      max: 100.0,
      divisions: 100,
      activeColor: Colors.blue,//进度中活动部分的颜色
      onChanged: (double){
        setState(() {
          value = double.roundToDouble();
        });
      },
    );
  }

}


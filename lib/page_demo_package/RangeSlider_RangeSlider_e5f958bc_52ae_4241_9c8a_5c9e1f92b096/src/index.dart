import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Demo> {
  RangeValues valuess = RangeValues(20.0, 50.0);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: valuess,
      //实际进度的位置
      inactiveColor: Colors.black12,
      //进度中不活动部分的颜色
      labels: RangeLabels('12', '23'),
      min: 0.0,
      max: 100.0,
      divisions: 1000,
      activeColor: Colors.blue,
      //进度中活动部分的颜色
      onChanged: (rangeValues) {
        setState(() {
          valuess = rangeValues;
        });
      },
    );
  }
}

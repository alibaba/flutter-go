/// Created with Android Studio.
/// User: 三帆
/// Date: 20/12/2018
/// Time: 17:51
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<SliderDemo> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      //实际进度的位置
      inactiveColor: Colors.black12,
      //进度中不活动部分的颜色
      label: 'value: $value',
      min: 0.0,
      max: 100.0,
      divisions: 1000,
      activeColor: Colors.blue,
      //进度中活动部分的颜色
      onChanged: (double) {
        setState(() {
          value = double.roundToDouble();
        });
      },
    );
  }
}

class SliderThemeDemo extends StatefulWidget {
  _SliderThemeDemo createState() => _SliderThemeDemo();
}

class _SliderThemeDemo extends State<SliderThemeDemo> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
//                activeTickMarkColor:Colors.yellowAccent,
          activeTrackColor: Colors.yellowAccent,
          //实际进度的颜色
//                inactiveTickMarkColor:Colors.black
          thumbColor: Colors.black,
          //滑块中心的颜色
          inactiveTrackColor: Colors.red,
          //默 认进度条的颜色
          valueIndicatorColor: Colors.blue,
          //提示进度的气派的背景色
          valueIndicatorTextStyle: TextStyle(
            //提示气泡里面文字的样式
            color: Colors.white,
          ),
          inactiveTickMarkColor: Colors.blue,
          //divisions对进度线分割后 断续线中间间隔的颜色
          overlayColor: Colors.pink, //滑块边缘颜色
        ),
        child: Container(
          width: 340.0,
          margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          child: Row(
            children: <Widget>[
              Text('0.0'),
              Expanded(
                flex: 1,
                child: Slider(
                  value: value,
                  label: '$value',
                  divisions: 10,
                  onChanged: (double) {
                    setState(() {
                      value = double.floorToDouble(); //转化成double
                    });
                  },
                  min: 0.0,
                  max: 100.0,
                ),
              ),
              Text('100.0'),
            ],
          ),
        ),
      ),
    );
  }
}

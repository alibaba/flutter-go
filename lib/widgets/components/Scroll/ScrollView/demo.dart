/// @Author: 一凨
/// @Date: 2018-12-10 21:15:27
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-10 21:16:05

import 'package:flutter/material.dart';

class ScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0, //注意这里的高度必须得指定
      child: PageView(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                '这是一个PageView的示例',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                '这是PageView第二个子widget',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                '这是PageView第三个子widget',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

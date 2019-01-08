/*
 * @Author: 一凨 
 * @Date: 2018-11-28 20:09:40 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-11-28 20:10:32
 */
import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {

  TextStyle txtColor = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Expanded'),
        new Row(children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text('红色按钮',style: txtColor,),
          ),
          new Expanded(
            flex: 1,//flex用来设置当前可用空间的占优比
            child: new RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
              },
              color: const Color(0xfff1c232),
              child: new Text('黄色按钮',style: txtColor,),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print('点击粉色按钮事件');
            },
            color: const Color(0xffea9999),
            child: new Text('粉色按钮',style: txtColor,),
          ),
        ]),
        Text('Flexible'),
        new Row(children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text('红色按钮',style: txtColor,),
          ),
          new Flexible(
            flex: 1,
            child: new RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
              },
              color: const Color(0xfff1c232),
              child: new Text('黄色按钮',style: txtColor,),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print('点击粉色按钮事件');
            },
            color: const Color(0xffea9999),
            child: new Text('粉色按钮',style: txtColor,),
          ),
        ]),
      ],
    );
  }
}

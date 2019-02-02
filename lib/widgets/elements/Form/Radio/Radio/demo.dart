/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 22/11/2018
 * Time: 19:37
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';

class RadioADemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<RadioADemo> {
  int groupValue = 1;
  onChange(val) {
    this.setState(() {
      groupValue = val;
    });
  }
  Widget build(BuildContext context) {
    return  (
       Container(
        alignment: Alignment.centerLeft,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Radio(
                value: 1,
                groupValue: groupValue,//当value和groupValue一致的时候则选中
                onChanged: (T){
                  onChange(T);
                }
            ),
             Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: (T){
                  onChange(T);
                }
            ),
             Radio(
                value: 3,
                groupValue: groupValue,
                onChanged: (T){
                  onChange(T);
                }
            )
          ],
        ),
      )
    );
  }
}

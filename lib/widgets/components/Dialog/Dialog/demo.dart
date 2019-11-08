/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:31
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<DialogDemo> {
  void showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('我是一个dialog'),
              RaisedButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
      },
    );
  }

  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        //padding
        child: Text(
          '点我显示 Dialog',
          style: TextStyle(
            fontSize: 18.0, //textsize
            color: Colors.white, // textcolor
          ),
        ),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        //shadow
        splashColor: Colors.blueGrey,
        onPressed: () {
          showAlertDialog(context);
        });
  }
}

class DialogMoreDemo extends StatefulWidget {
  _DialogMoreDemo createState() => _DialogMoreDemo();
}

class _DialogMoreDemo extends State<DialogMoreDemo> {
  int value = 0;
  void showCommonDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return Dialog(
              child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('我是一个dialog'),
                    RaisedButton(
                      onPressed: () {
                        state(() {
                          value += 1;
                        });
                      },
                      child: Text("我是一个Dialog, 点我更新value: $value"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("取消"),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            //padding
            child: Text(
              '点我显示Dialog',
              style: TextStyle(
                fontSize: 18.0, //textsize
                color: Colors.white, // textcolor
              ),
            ),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            //shadow
            splashColor: Colors.blueGrey,
            onPressed: () {
              showCommonDialog(context);
            })
      ],
    );
  }
}

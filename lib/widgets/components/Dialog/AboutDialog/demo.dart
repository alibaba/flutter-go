/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:31
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';


class AboutDialogDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<AboutDialogDemo> {
  
  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AboutDialog(
          applicationName: '名称',
          applicationIcon: new Icon(Icons.ac_unit),
          applicationVersion: 'V1.0',
          children: <Widget>[
            Text('我是一个关于的dialog')
          ]
        ));
  }
  Widget build(BuildContext context) {
    return new RaisedButton(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        //padding
        child: new Text(
          'show aboutDialog',
          style: new TextStyle(
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

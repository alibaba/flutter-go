/// @Author: 一凨 
/// @Date: 2019-01-14 17:53:54 
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 17:57:51

import 'package:flutter_web/material.dart';
import '../routers/application.dart';
import '../routers/routers.dart';
import 'dart:core';
import 'dart:html' as html;


class ListViewItem extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const ListViewItem({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          // _launchURL(itemUrl, context);
          //Application.router.navigateTo(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri.encodeComponent(itemUrl)}');
          print('跳转到页面->${Routes.webViewPage}');
          html.window.open(itemUrl,'newwindow','height=667,width=375,scrollbars=yes,status=yes');
        },
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(data,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}

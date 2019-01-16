/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 15/01/2019
 * Time: 22:23
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CupertinoScrollbarDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoScrollbarDemo> {

  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: new SliverGrid(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
//              color: Colors.cyan[100 * (index % 5)],
              child: new Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      )
    );
  }
}

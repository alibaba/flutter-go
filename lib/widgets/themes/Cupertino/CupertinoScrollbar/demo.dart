/// Created with Android Studio.
/// User: 三帆
/// Date: 15/01/2019
/// Time: 22:23
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScrollbarDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoScrollbarDemo> {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CupertinoScrollbar(
            child: Container(
                height: 300,
                child: ListView.custom(
                  scrollDirection: Axis.vertical,
                  childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('list item $index'),
                    );
                  }, childCount: 10),
                )
            )
        ),
        Center(
          child: Text("CupertinoScrollbar效果"),
        )
      ],
    );
  }
}


class NoCupertinoScrollbarDemo extends StatefulWidget {
  _NoCupertinoScrollbarDemo createState() => _NoCupertinoScrollbarDemo();
}

class _NoCupertinoScrollbarDemo extends State<NoCupertinoScrollbarDemo> {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 300,
            child: ListView.custom(
              scrollDirection: Axis.vertical,
              childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              }, childCount: 10),
            )
        ),
        Center(
          child: Text("无CupertinoScrollbar效果"),
        )
      ],
    );
  }
}

/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:31
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class SliverGridDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<SliverGridDemo> {
  Widget showCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 5)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
//         SliverFixedExtentList(
//          itemExtent: 100.0,
//          delegate:  SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//              return  Container(
//                alignment: Alignment.center,
//                color: Colors.lightBlue[100 * (index % 9)],
//                child:  Text('list item $index'),
//              );
//            },
//          ),
//        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Container(
        height: 400, color: Color(0xffc91b3a), child: showCustomScrollView());
  }
}

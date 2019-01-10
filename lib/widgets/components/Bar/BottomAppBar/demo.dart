/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午8:56
 * email: zhu.yan@alibaba-inc.com
 * tartget: BottomAppBar 的示例
 */
import 'package:flutter/material.dart';

/*
* AppBar 默认的实例,无状态
* */
class AppBarLessDefaultSimple extends StatelessWidget {
  final widget;
  final parent;

  const AppBarLessDefaultSimple([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 100,
      child: Scaffold(
        //appBar: AppBar(title: const Text('Bottom App Bar')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () {},),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10.0,// FloatingActionButton和BottomAppBar 之间的差距
            color:Colors.pink,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),
        )
    );
}}
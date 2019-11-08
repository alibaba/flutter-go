/// Created with Android Studio.
/// User: 三帆
/// Date: 2019/1/6
/// Time: 下午7:33
/// email: sanfann@alibaba-inc.com
/// target: Scaffold 的示例

import 'package:flutter/material.dart';

class ScaffoldDemo extends StatefulWidget {
  const ScaffoldDemo() : super();

  @override
  State<StatefulWidget> createState() => _ScaffoldDemo();
}

// AppBar 默认的实例,有状态
class _ScaffoldDemo extends State with SingleTickerProviderStateMixin {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。
    // 否则，如果最近的 Navigator 具有任何先前的 router ，则会插入BackButton。
    // 这种行为可以通过设置来关闭automaticallyImplyLeading 为false。在这种情况下，空的 leading widget 将导致 middle/title widget 拉伸开始。
    return SizedBox(
        height: 500,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sample Code'),
          ),
          body: Center(
            child: Text('You have pressed the button times. $count'),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
              count += 1;
            }),
            tooltip: 'Increment Counter',
            child: Icon(Icons.add),
          ),
        ));
  }
}

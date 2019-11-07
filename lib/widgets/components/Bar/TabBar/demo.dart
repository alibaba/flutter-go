/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/6
/// Time: 下午7:33
/// email: sanfann@alibaba-inc.com
/// target: TabBar 的示例

import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo() : super();

  @override
  State<StatefulWidget> createState() => _TabBarDemo();
}

// AppBar 默认的实例,有状态
class _TabBarDemo extends State with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController =
        TabController(vsync: this, length: 6); // 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
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
            // 大量配置属性参考 SliverAppBar 示例
            title: Text('TabBar'),
            leading: Icon(Icons.home),
            backgroundColor: Colors.amber[1000],
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: "Tabs 1"),
                Tab(text: "Tabs 2"),
                Tab(text: "Tabs 3"),
                Tab(text: "Tabs 4"),
                Tab(text: "Tabs 5"),
                Tab(text: "Tabs 6"),
              ],
            ),
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            Text('TabsView 1'),
            Text('TabsView 2'),
            Text('TabsView 3'),
            Text('TabsView 4'),
            Text('TabsView 5'),
            Text('TabsView 6'),
          ]),
        ));
  }
}

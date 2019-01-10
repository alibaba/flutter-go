/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午7:33
 * email: zhu.yan@alibaba-inc.com
 * tartget: AppBar 的示例
 */

import 'dart:math';
import 'package:flutter/material.dart';

/*
* Checkbox 默认AppBar的实例
* index 当前AppBar 的索引值
* */
class AppBarLessDefaultComplex extends StatefulWidget {
  const AppBarLessDefaultComplex() : super();

  @override
  State<StatefulWidget> createState() => _AppBarLessDefaultComplex();
}

/*
* AppBar 默认的实例,有状态
* */
class _AppBarLessDefaultComplex extends State with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 6);// 和下面的 TabBar.tabs 数量对应
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
    return new SizedBox(
      height: 500,
      child:new AppBar( // 大量配置属性参考 SliverAppBar 示例
        title: new Text('title'),
        leading: new Icon(Icons.home),
        backgroundColor: Colors.amber[500],
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
          new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem<String>(
                    value: "price", child: new Text('Sort by price')),
                new PopupMenuItem<String>(
                    value: "time", child: new Text('Sort by time')),
              ],
              onSelected: (String action) {
                switch (action) {
                  case "price":
                  // do nothing
                    break;
                  case "time":
                  // do nothing
                    break;
                }
              })
        ],
        bottom: new TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            new Tab(text: "Tabs 1"),
            new Tab(text: "Tabs 2"),
            new Tab(text: "Tabs 3"),
            new Tab(text: "Tabs 4"),
            new Tab(text: "Tabs 5"),
            new Tab(text: "Tabs 6"),
          ],
        ),
      ),
    );
  }
}

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
          height: 200,
          child:AppBar(
            title: Text('My Fancy Dress'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.playlist_play),
                tooltip: 'Air it',
                onPressed: ()=>{},
              ),
              IconButton(
                icon: Icon(Icons.playlist_add),
                tooltip: 'Restitch it',
                onPressed: ()=>{},
              ),
              IconButton(
                icon: Icon(Icons.playlist_add_check),
                tooltip: 'Repair it',
                onPressed: ()=>{},
              ),
            ],
          )
      );
  }
}
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_go/views/widget_page/widget_page.dart' show WidgetPage;
import 'package:flutter_go/views/collection_page/collection_page.dart' show CollectionPage;
import 'demos.dart';

//class Home extends StatefulWidget {
//  const Home({
//    Key key,
//    this.testMode = false,
//    this.optionsPage,
//  }) : super(key: key);
//
//  final Widget optionsPage;
//  final bool testMode;
//
//  // In checked mode our MaterialApp will show the default "debug" banner.
//  // Otherwise show the "preview" banner.
//  static bool showPreviewBanner = true;
//
//  @override
//  _HomeState createState() => _HomeState();
//}
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _controller;
  GalleryDemoCategory _category;

  static List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)}
  ];
  List<Widget> list = List();
  List<BottomNavigationBarItem> myTabs = [];
  int _currentIndex = 0;

  void _ItemTapped(int index) {
    print('index-${index}');
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }

    list
      //..add(WidgetPage(null));
      ..add(Text('page1'))
      ..add(WidgetPage(null))
      ..add(CollectionPage())
      ..add(Text('page4'));

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildSearchInput(BuildContext context) {
    return Container(
        child:Text('Flutter GO')
    );
  }

  renderAppBar(BuildContext context, Widget widget, int index) {
    return AppBar(title: buildSearchInput(context));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget home = Scaffold(
      appBar: AppBar(title: buildSearchInput(context)),
      key: _scaffoldKey,
      //backgroundColor: theme.primaryColor,
      backgroundColor: Color(0xFFFFFF),
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _ItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(0xFFC91B3A),
      ),
      body: list[_currentIndex]
    );

    return home;
  }
}

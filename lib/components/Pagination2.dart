// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector({ this.icons });

  final List<Icon> icons;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller.animateTo((controller.index + delta).clamp(0, icons.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new IconTheme(
              data: new IconThemeData(
                size: 128.0,
                color: color,
              ),
              child: new TabBarView(
                children: icons.map((Icon icon) {
                  return
                    new Align(
                      alignment: Alignment.topCenter,
                      child:new Container(
                        color: Colors.red,
                        width:300.0,
                        height:250.0,
                        padding: const EdgeInsets.all(12.0),
                        child: new Card(
                          color: Colors.yellow,
                          child: new Center(
                            child: icon,
                          ),
                        ),
                      )
                    );
                }).toList()

              ),
            ),
          ),
          new Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: new Row(
                  children: <Widget>[
                    new IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: color,
                        onPressed: () { _handleArrowButtonPress(context, -1); },
                        tooltip: 'Page back'
                    ),
                    new TabPageSelector(controller: controller),
                    new IconButton(
                        icon: const Icon(Icons.chevron_right),
                        color: color,
                        onPressed: () { _handleArrowButtonPress(context, 1); },
                        tooltip: 'Page forward'
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
              )
          ),
        ],
      ),
    );
  }
}

class Pagination2 extends StatelessWidget {
  static const String routeName = '/material/page-selector';
  static final List<Icon> icons = <Icon>[
    const Icon(Icons.event, semanticLabel: 'Event'),
    const Icon(Icons.home, semanticLabel: 'Home'),
    const Icon(Icons.android, semanticLabel: 'Android'),
    const Icon(Icons.alarm, semanticLabel: 'Alarm'),
    const Icon(Icons.face, semanticLabel: 'Face'),
    const Icon(Icons.language, semanticLabel: 'Language'),
  ];

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(title: const Text('Page selector')),
//      body: new DefaultTabController(
//        length: icons.length,
//        child: new _PageSelector(icons: icons),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: icons.length,
        child: new _PageSelector(icons: icons),
      );
  }
}

/// @author Nealyang
/// 新widget详情页模板

import 'dart:core';

import 'package:flutter/material.dart';

import '../routers/application.dart';
import '../routers/routers.dart';
import '../components/markdown.dart';
import '../model/collection.dart';
import '../widgets/index.dart';
import '../event/event_bus.dart';
import '../event/event_model.dart';

class WidgetDemo extends StatefulWidget {
  final List<dynamic> contentList;
  final String docUrl;
  final String title;
  final String codeUrl;
  final Widget bottomNaviBar;

  WidgetDemo(
      {Key key,
      @required this.title,
      @required this.contentList,
      @required this.codeUrl,
      @required this.docUrl,
      this.bottomNaviBar})
      : super(key: key);

  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  bool _hasCollected = false;
  CollectionControlModel _collectionControl = new CollectionControlModel();
  var _collectionIcons;
  List widgetDemosList = new WidgetDemoList().getDemos();
  String _router = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildContent() {
    List<Widget> _list = [
      SizedBox(
        height: 10.0,
      ),
    ];
    widget.contentList.forEach((item) {
      if (item.runtimeType == String) {
        _list.add(MarkdownBody(item));
        _list.add(
          SizedBox(
            height: 20.0,
          ),
        );
      } else {
        _list.add(item);
      }
    });
    return _list;
  }

  @override
  void initState() {
    super.initState();
    _collectionControl.getRouterByName(widget.title).then((list) {
      widgetDemosList.forEach((item) {
        if (item.name == widget.title) {
          _router = item.routerName;
        }
      });
      if (this.mounted) {
        setState(() {
          _hasCollected = list.length > 0;
        });
      }
    });
  }

// 点击收藏按钮
  _getCollection() {
    if (_hasCollected) {
      // 删除操作
      _collectionControl.deleteByName(widget.title).then((result) {
        if (result > 0 && this.mounted) {
          setState(() {
            _hasCollected = false;
          });
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('已取消收藏')));
          if (ApplicationEvent.event != null) {
            ApplicationEvent.event
                .fire(CollectionEvent(widget.title, _router, true));
          }
          return;
        }
        print('删除错误');
      });
    } else {
      // 插入操作
      _collectionControl
          .insert(Collection(name: widget.title, router: _router))
          .then((result) {
        if (this.mounted) {
          setState(() {
            _hasCollected = true;
          });

          if (ApplicationEvent.event != null) {
            ApplicationEvent.event
                .fire(CollectionEvent(widget.title, _router, false));
          }

          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('收藏成功')));
        }
      });
    }
  }

  void _selectValue(value) {
    if (value == 'doc') {
      // _launchURL(widget.docUrl);
      Application.router.navigateTo(context,
          '${Routes.webViewPage}?title=${Uri.encodeComponent(widget.title)} Doc&&url=${Uri.encodeComponent(widget.docUrl)}');
    } else if (value == 'code') {
      Application.router.navigateTo(context,
          '${Routes.codeView}?filePath=${Uri.encodeComponent(widget.codeUrl)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
              tooltip: 'goBack home',
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: Icon(Icons.home),
            ),
            new IconButton(
              tooltip: 'collection',
              onPressed: _getCollection,
              icon: Icon(_collectionIcons),
            ),
            PopupMenuButton<String>(
              onSelected: _selectValue,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'doc',
                      child: ListTile(
                        leading: Icon(
                          Icons.library_books,
                          size: 22.0,
                        ),
                        title: Text('查看文档'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'code',
                      child: ListTile(
                        leading: Icon(
                          Icons.code,
                          size: 22.0,
                        ),
                        title: Text('查看Demo'),
                      ),
                    ),
                  ],
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Column(
                children: _buildContent(),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            (widget.bottomNaviBar is Widget) ? widget.bottomNaviBar : null);
  }
}

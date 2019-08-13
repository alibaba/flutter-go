/// @author Nealyang
/// 新widget详情页模板

import 'dart:core';
import 'package:flutter_web/material.dart';

import '../routers/application.dart' show Application;
import '../routers/routers.dart' show Routes;
import '../components/markdown.dart' show MarkdownBody;
import '../model/collection.dart' show Collection,CollectionControlModel;
import '../widgets/index.dart' show WidgetDemoList;
import '../event/event_bus.dart';
import '../event/event_model.dart';

import 'package:path/path.dart' as path;

import 'dart:async';
import 'dart:html' as html;
import 'package:flutter_web/material.dart';
import 'package:flutter_web/src/widgets/web_navigator.dart';
import 'package:flutter_web_ui/src/engine.dart' hide MethodCall;
import 'package:flutter_web_test/flutter_web_test.dart';


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
  BuildContext _context = null;

  List<Widget> _buildContent() {
    List<Widget> _list = [
      SizedBox(
        height: 10.0,
      ),
    ];
    widget.contentList.forEach((item) {
      if (item.runtimeType == String) {
        //_list.add(item);
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
      print('=============|||>');
      print(list);
      print('=============|||>');
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
      _collectionControl.insert(Collection(name: widget.title, router: _router))
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

  Future<void> _neverSatisfied(widget) async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Github Address"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Title:\n${widget.title} \n\nWebsite:\n${widget.docUrl}')
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('go to address'),
              onPressed: () {
                html.window.open(widget.docUrl,'newwindow','height=667,width=375,scrollbars=yes,status=yes');// 直接使用js,html
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectValue(value) {
    print(widget.title);
    print(widget.docUrl);
    print(Routes.codeView);
    if (value == 'doc') {
      //var uri = path.toUri(widget.docUrl);
      // _launchURL(widget.docUrl);
//      Application.router.navigateTo(context,
//          '${Routes.webViewPage}?title=${Uri.encodeComponent(widget.title)} Doc&&url=${Uri.encodeComponent(widget.docUrl)}');
      _neverSatisfied(widget);
      print('window-->${window}');

    } else if (value == 'code') {
      Application.router.navigateTo(context,
          '${Routes.codeView}?filePath=${Uri.encodeComponent(widget.codeUrl)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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

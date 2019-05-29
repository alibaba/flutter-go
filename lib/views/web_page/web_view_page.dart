/// @Author: 一凨
/// @Date: 2019-01-14 17:44:47
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 19:47:14

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter_go/model/collection.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:flutter_go/api/api.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  bool _hasCollected = false;
  String _router = '';
  var _collectionIcons;
  CollectionControlModel _collectionControl = new CollectionControlModel();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print('url change:$url');
      if (url.indexOf('${Api.RedirectIp}loginSuccess') == 0) {
        String loginName = url.substring(url.indexOf('=') + 1);
        if (ApplicationEvent.event != null) {
          ApplicationEvent.event.fire(UserGithubOAuthEvent(loginName, true));
        }
        flutterWebviewPlugin.close();
        // 验证成功
      } else if (url.indexOf('${Api.RedirectIp}loginFail') == 0) {
        // 验证失败
        if (ApplicationEvent.event != null) {
          ApplicationEvent.event.fire(UserGithubOAuthEvent('', true));
        }
        flutterWebviewPlugin.close();
      }
      // if(url == '${Api.RedirectIp}loginSuccess')
    });
    _collectionControl
        .getRouterByName(Uri.encodeComponent(widget.title.trim()))
        .then((list) {
      list.forEach((item) {
        if (widget.title.trim() == item['name']) {
          _router = item['router'];
        }
      });
      if (mounted) {
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
      _collectionControl
          .deleteByName(Uri.encodeComponent(widget.title.trim()))
          .then((result) {
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
          .insert(Collection(
              name: Uri.encodeComponent(widget.title.trim()),
              router: widget.url))
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
            onPressed: _getCollection,
            icon: Icon(
              _collectionIcons,
            ),
          ),
        ],
      ),
      body: WebviewScaffold(
        url: widget.url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}

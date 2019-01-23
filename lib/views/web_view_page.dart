/*
 * @Author: 一凨 
 * @Date: 2019-01-14 17:44:47 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-14 19:47:14
 */
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../model/collection.dart';
import '../event/event-bus.dart';
import '../event/event-model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:core';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool _hasCollected = false;
  String _router = '';
  var  _collectionIcons;
  CollectionControlModel _collectionControl = new CollectionControlModel();

  void showInSnackBar(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  @override
  void initState() {
    super.initState();
    _collectionControl.getRouterByName(Uri.encodeComponent(widget.title.trim())).then((list) {
      
      list.forEach((item) {
        if(widget.title.trim() == item['name']){
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
      _collectionControl.deleteByName(Uri.encodeComponent(widget.title.trim())).then((result) {
        if (result > 0 && this.mounted) {
          setState(() {
            _hasCollected = false;
          });
          showInSnackBar('已取消收藏');

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
          .insert(Collection(name:Uri.encodeComponent(widget.title.trim()) , router: widget.url))
          .then((result) {
        if (this.mounted) {
          setState(() {
            _hasCollected = true;
          });

          if (ApplicationEvent.event != null) {
            ApplicationEvent.event
                .fire(CollectionEvent(widget.title, _router, false));
          }

          showInSnackBar('收藏成功');
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
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            tooltip: 'goBack home',
            onPressed: _getCollection,
            icon: Icon(_collectionIcons,),
          ),
        ],
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}

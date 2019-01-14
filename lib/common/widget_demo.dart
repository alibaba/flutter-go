/**
 * @author Nealyang
 * 
 * 新widget详情页模板
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routers/application.dart';
import '../components/markdown.dart';
import '../model/collection.dart';
import '../widgets/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../event/event-bus.dart';
import '../event/event-model.dart';
import './full_screen_code_dialog.dart';
import '../routers/application.dart';
import '../routers/routers.dart';
import 'dart:core';

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
      this.bottomNaviBar
      })
      : super(key: key);

  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  bool _hasCollected = false;
  CollectionControlModel _collectionControl = new CollectionControlModel();
  Color _collectionColor;
  List widgetDemosList = new WidgetDemoList().getDemos();
  String _router = '';
  String _collText = '';

  void showInSnackBar(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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

          showInSnackBar('收藏成功');
        }
      });
    }
  }

  void _selectValue(value){
    if(value == 'doc'){
      _launchURL(widget.docUrl);
    }else if(value =='code'){
      //  _launchURL(Application.github['widgetsURL'] + widget.codeUrl);
      String targetUrl = 'lib/widgets/${widget.codeUrl}';
      Application.router.navigateTo(context, '${Routes.codeView}?filePath=${Uri.encodeComponent(targetUrl)}');
      
    }else{
      _getCollection();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasCollected) {
      _collectionColor = Colors.red;
      _collText='取消收藏';
    } else {
      _collectionColor =null;
      _collText='组件收藏';
    }
    return Scaffold(
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
          PopupMenuButton<String>(
            onSelected: _selectValue,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'doc',
                    child: ListTile(
                      leading: Icon(Icons.library_books,size: 22.0,),
                      title: Text('查看文档'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<String>(
                    value: 'code',
                    child: ListTile(
                      leading: Icon(Icons.code,size: 22.0,),
                      title: Text('查看Demo'),
                    ),
                  ),
                  const PopupMenuDivider(),
                   PopupMenuItem<String>(
                    value: 'collection',
                    child: ListTile(
                      leading: Icon(Icons.star,size: 22.0,color: _collectionColor,),
                      title: Text(_collText),
                      
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
      bottomNavigationBar: (widget.bottomNaviBar is Widget) ? widget
          .bottomNaviBar : null
    );
  }
}

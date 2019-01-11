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

class WidgetDemo extends StatefulWidget {
  final List<dynamic> contentList;
  final String docUrl;
  final String title;
  final String codeUrl;

  WidgetDemo(
      {Key key,
      @required this.title,
      @required this.contentList,
      @required this.codeUrl,
      @required this.docUrl})
      : super(key: key);

  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  bool _hasCollected = false;
  CollectionControlModel _collectionControl = new CollectionControlModel();
  Color _collectionColor;
  List widgetDemosList = new WidgetDemoList().getDemos();
  String _router = '';

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


  @override
  Widget build(BuildContext context) {
    if (_hasCollected) {
      _collectionColor = Colors.yellow;
    } else {
      _collectionColor = Colors.white;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            tooltip: 'widget doc',
            onPressed: () {
              _launchURL(widget.docUrl);
            },
            icon: Icon(Icons.library_books),
          ),
          new IconButton(
            tooltip: 'github code',
            onPressed: () {
              _launchURL(Application.github['widgetsURL'] + widget.codeUrl);
            },
            icon: Icon(Icons.code),
          ),
          new IconButton(
            tooltip: 'goBack home',
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: Icon(Icons.home),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _getCollection,
        mini: true,
        tooltip: '收藏',
        child: Icon(
          Icons.star,
          color: _collectionColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

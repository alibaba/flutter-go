/// @Author: 一凨
/// @Date: 2019-06-05 14:01:03
/// @Last Modified by:   一凨
/// @Last Modified time: 2019-06-05 14:01:03
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_go/model/collection.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:flutter_go/utils/data_utils.dart';

class CollectionFullPage extends StatefulWidget {
  final bool hasLogined;
  CollectionFullPage({Key key, this.hasLogined}) : super(key: key);

  @override
  _CollectionFullPageState createState() => _CollectionFullPageState();
}

class _CollectionFullPageState extends State<CollectionFullPage> {
  _CollectionFullPageState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }

  /// CollectionControlModel _collectionControl = new CollectionControlModel();
  List<Collection> _collectionList = [];
  ScrollController _scrollController = new ScrollController();
  var _icons;

  @override
  void initState() {
    super.initState();
    _getList();
    ApplicationEvent.event.on<CollectionEvent>().listen((event) {
      _getList();
    });
  }

  void _getList() {
    _collectionList.clear();
    DataUtils.getAllCollections(context).then((collectionList) {
      if (this.mounted) {
        setState(() {
          _collectionList = collectionList;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _renderList(context, index) {
    if (index == 0) {
      return Container(
        height: 40.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.warning,
              size: 22.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text('常用的组件都可以收藏在这里哦'),
          ],
        ),
      );
    }
    if (_collectionList[index - 1].router.contains('http')) {
      if (_collectionList[index - 1].name.endsWith('Doc')) {
        _icons = Icons.library_books;
      } else {
        _icons = Icons.language;
      }
    } else {
      _icons = Icons.extension;
    }
    String targetRouter = _collectionList[index - 1].router;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      margin: const EdgeInsets.only(bottom: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: const Color(0xFFd0d0d0),
            blurRadius: 1.0,
            spreadRadius: 2.0,
            offset: Offset(3.0, 2.0),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          _icons,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          _collectionList[index - 1].name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 17.0),
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          Application.router.navigateTo(context, targetRouter.toLowerCase(),
              transition: TransitionType.native);
        },
      ),
    );
  }

  ListView buildContent() {
    if (_collectionList.length == 0) {
      return ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/nothing.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Text('暂无收藏，赶紧去收藏一个吧!'),
            ],
          ),
        ],
      );
    }
    return ListView.builder(
      itemBuilder: _renderList,
      itemCount: _collectionList.length + 1,
      controller: _scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
      ),
      body: Container(
        child: buildContent(),
      ),
    );
  }
}

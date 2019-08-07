/// @Author: 一凨
/// @Date: 2019-01-08 17:12:58
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 20:13:28

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

import 'package:flutter_go/model/collection.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:flutter_go/utils/data_utils.dart';

class CollectionPage extends StatefulWidget {
  final bool hasLogined;

  CollectionPage({Key key, this.hasLogined}) : super(key: key);

  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  _CollectionPageState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }
  CollectionControlModel _collectionControl = new CollectionControlModel();
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            Text('模拟器重新运行会丢失收藏'),
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
//          Uri.decodeComponent(_collectionList[index - 1].name),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 17.0),
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          if (_collectionList[index - 1].router.contains('http')) {
            // 注意这里title已经转义过了
            Application.router.navigateTo(context,
                '${Routes.webViewPage}?title=${_collectionList[index - 1].name}&url=${Uri.encodeComponent(_collectionList[index - 1].router)}');
          } else {
            Application.router
                .navigateTo(context, "${_collectionList[index - 1].router}");
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
}

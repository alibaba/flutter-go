/*
 * @Author: 一凨 
 * @Date: 2019-01-08 17:12:58 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-08 20:14:56
 */
import 'package:flutter/material.dart';
import '../model/collection.dart';
import '../routers/application.dart';
import '../event/event-bus.dart';
import '../event/event-model.dart';
import 'package:event_bus/event_bus.dart';

class CollectionPage extends StatefulWidget {
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  _CollectionPageState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }
  CollectionControlModel _collectionControl = new CollectionControlModel();
  List<Collection> _collectionList;
  ScrollController _scrollController = new ScrollController();
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
    _collectionList = [];
    _collectionControl.getAllCollection().then((resultList) {
      resultList.forEach((item) {
        _collectionList.add(item);
      });
      if (this.mounted) {
        setState(() {
          _collectionList = _collectionList;
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
    return Container(
      padding: const EdgeInsets.all(10.0),
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
        title: Text(
          _collectionList[index - 1].name,
          style: TextStyle(fontSize: 17.0),
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          Application.router
              .navigateTo(context, "${_collectionList[index - 1].router}");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_collectionList);
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

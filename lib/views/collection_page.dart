/*
 * @Author: 一凨 
 * @Date: 2019-01-08 17:12:58 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-08 20:14:56
 */
import 'package:flutter/material.dart';
import '../model/collection.dart';

class CollectionPage extends StatefulWidget {
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  CollectionControlModel _collectionControl = new CollectionControlModel();
  List<Collection> _collectionList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _collectionControl.getAllCollection().then((resultList) {
      _collectionList = resultList;
      _collectionList.forEach((item){
        print(item.toMap());
      });
    });
    return Container(
      child: Text('敬请期待'),
    );
  }
}

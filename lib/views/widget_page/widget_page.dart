/*
 * @Author: 一凨 
 * @Date: 2019-01-11 14:39:48 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-11 14:40:09
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/cate_card.dart';
import 'package:flutter_go/model/cat.dart';

class WidgetPage extends StatefulWidget {
  final db;
  final CatControlModel catModel;
  WidgetPage(this.db)
      : catModel = new CatControlModel(),
        super();

  @override
  SecondPageState createState() => new SecondPageState(catModel);
}

class SecondPageState extends State<WidgetPage> with AutomaticKeepAliveClientMixin{
  CatControlModel catModel;
  SecondPageState(this.catModel) : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';

  List<Cat> categories = [];

  @override
    bool get wantKeepAlive => true;

  @override
  void initState() { 
    super.initState();
    renderCats();
  }

  void renderCats() {
    catModel.getList().then((List data) {
      if (data.isNotEmpty) {
        setState(() {
          categories = data;
        });
      }
    });
  }

  Widget buildGrid() {
    // 存放最后的widget
    List<Widget> tiles = [];
    for (Cat item in categories) {
      tiles.add(new CateCard(category: item));
    }
    return new ListView(
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (categories.length == 0) {
      return ListView(
        children: <Widget>[new Container()],
      );
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.buildGrid(),
    );
  }

}

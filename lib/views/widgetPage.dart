import 'package:flutter/material.dart';
import 'widgetPage/cate_card.dart';
import '../model/cat.dart';

class WidgetPage extends StatefulWidget {
  final db;
  final CatControlModel catModel;
  WidgetPage(this.db)
      : catModel = new CatControlModel(),
        super();

  @override
  SecondPageState createState() => new SecondPageState(catModel);
}

class SecondPageState extends State<WidgetPage> {
  CatControlModel catModel;
  SecondPageState(this.catModel) : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';

  List<Cat> categories = [];

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
    Widget content;
    for (Cat item in categories) {
      tiles.add(new CateCard(category: item));
    }
    return new ListView(
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
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

  void _onChanged(String value) {
    setState(() {
      active = value;
      data = '90';
    });
  }
}

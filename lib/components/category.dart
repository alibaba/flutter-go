import 'dart:async';

import 'package:flutter/material.dart';

import '../routers/application.dart';
import '../model/cat.dart';
import '../model/widget.dart';
import '../widgets/index.dart';
import '../components/widget_item_container.dart';



class CategoryHome extends StatefulWidget {
  CategoryHome(this.token);
  final String token;


  @override
  _CategoryHome createState() => new _CategoryHome();
}

class _CategoryHome extends State<CategoryHome> {
  String title = '';
  // 显示列表 cat or widget;
  List<CommonItem> items = [];
  List<Object> widgetPoints = [];
  List<CommonItem> catHistory = new List();


  // 所有的可用demos;
  List widgetDemosList = new WidgetDemoList().getDemos();

  @override
  void initState() {
    super.initState();
    // 初始化加入顶级的name
    print("这是新界面的id:>>> ${widget.token}");

    CommonItem targetGroup = Application.widgetTree.find(widget.token) ?? [];
    print("targetGroup::: $targetGroup");

    catHistory.add(
      targetGroup
    );
    this.setState(() {
      items = targetGroup.children;
    });
    searchCatOrWidget();
  }



  Future<bool> back() {
//    if (catHistory.length == 1) {
//      return Future<bool>.value(true);
//    }
//    catHistory.removeLast();
//    searchCatOrWidget();
    return Future<bool>.value(true);
  }

  void go(CommonItem cat) {
    catHistory.add(cat);
    searchCatOrWidget();
  }

  void searchCatOrWidget() async {
    print("searchCatOrWidget>>>");
    CommonItem widgetTree = Application.widgetTree;
//    // 假设进入这个界面的parent一定存在
    CommonItem targetGroup = catHistory.last;
//
//
//    // 继续搜索显示下一级depth: depth + 1, parentId: parentCat.id
//    List<Cat> _categories =
//        await catControl.getList(new Cat(parentId: parentCat.id));
//    List<WidgetPoint> _widgetPoints = new List();
//    if (_categories.isEmpty) {
//      _widgetPoints =
//          await widgetControl.getList(new WidgetPoint(catId: parentCat.id));
//    }
//
    print("targetGroup >>> $targetGroup");

    this.setState(() {
      title = targetGroup.name;
//      widgetPoints = targetGroup.children;
    });
  }

  void onCatgoryTap(CommonItem cat) {
    print("onCatgoryTap: ${cat}");
    go(cat);
  }



  Widget _buildContent() {
    WidgetItemContainer wiContaienr = WidgetItemContainer(
      columnCount: 3,
      commonItems: items
    );


    return Container(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/paimaiLogo.png'),
            alignment: Alignment.bottomRight),
      ),
      child: wiContaienr,
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: WillPopScope(

        onWillPop: () {
          return back();
        },

        child: ListView(
          children: <Widget>[
            _buildContent(),
          ],
        ),
        // child: Container(color: Colors.blue,child: Text('123'),),
      ),
    );
  }
}


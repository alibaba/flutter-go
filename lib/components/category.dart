import 'package:flutter/material.dart';

import '../components/widget_item_container.dart';

/// import '../model/cat.dart';
import '../model/widget.dart';
import '../routers/application.dart';
import '../widgets/index.dart';

class CategoryHome extends StatefulWidget {
  CategoryHome(this.token);
  final String token;

  @override
  _CategoryHome createState() => _CategoryHome();
}

class _CategoryHome extends State<CategoryHome> {
  String title = '';
  // 显示列表 cat or widget;
  List<CommonItem> items = [];
  List<Object> widgetPoints = [];
  List<CommonItem> catHistory = List();

  // 所有的可用demos;
  List widgetDemosList = WidgetDemoList().getDemos();

  @override
  void initState() {
    super.initState();
    // 初始化加入顶级的name
    print("这是新界面的id:>>> ${widget.token}");

    CommonItem targetGroup = Application.widgetTree.find(widget.token) ?? [];
    print("targetGroup::: $targetGroup");

    catHistory.add(targetGroup);
    this.setState(() {
      items = targetGroup.children;
    });
    searchCatOrWidget();
  }

  void go(CommonItem cat) {
    catHistory.add(cat);
    searchCatOrWidget();
  }

  void searchCatOrWidget() async {
    /// CommonItem widgetTree = Application.widgetTree;
    // 假设进入这个界面的parent一定存在
    CommonItem targetGroup = catHistory.last;

    this.setState(() {
      title = targetGroup.name;
    });
  }

  void onCatgoryTap(CommonItem cat) {
    go(cat);
  }

  Widget _buildContent() {
    WidgetItemContainer wiContaienr =
        WidgetItemContainer(columnCount: 3, commonItems: items);

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
      body: ListView(
        children: <Widget>[
          _buildContent(),
        ],
      ),
    );
  }
}

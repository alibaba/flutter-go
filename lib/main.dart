import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';

import 'views/FirstPage.dart';
import 'views/widgetPage.dart';
import 'views/ThirdPage.dart';
import 'views/FourthPage.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'common/provider.dart';
import 'model/widget.dart';
import 'package:flutter_rookie_book/components/SearchInput.dart';
import 'common/Style.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

var db;

void main() async{

  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  runApp(new MyApp());
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  bool isSearch = false;
  String data = '无';
  String data2ThirdPage = '这是传给ThirdPage的值';
  String appBarTitle = tabData[0]['text'];
  static List tabData = [
    {'text': '业界动态', 'icon': new Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': new Icon(Icons.extension)},
    {'text': '官网地址', 'icon': new Icon(Icons.home)},
    {'text': '关于手册', 'icon': new Icon(Icons.favorite)}
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(
        initialIndex: 0, vsync: this, length: 4); // 这里的length 决定有多少个底导 submenus
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }
    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget buildSearchInput(){
    return new SearchInput((value) async{
      return null;
//      if(value != ''){
//        widgetModel = new WidgetModel(db);
//        List<Map> list = await widgetModel.search(value);
//        print('list $list');
//        return list.map((item) => new MaterialSearchResult<String>(
//          value: item['name'],
//          text: item['name'] + '       ' + item['cnName'],
//        )).toList();
//      }else{
//        return null;
//      }

    },(value){},(){});

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
//          backgroundColor: new Color(AppColor.white),
            title: buildSearchInput()),
        body: new TabBarView(controller: controller, children: <Widget>[
          new FirstPage(),
          new WidgetPage(db),
          new ThirdPage(
              data2ThirdPage: data2ThirdPage,
              callback: (val) => _onDataChange(val)),
          new FourthPage()
        ]),
        bottomNavigationBar: new Material(
            color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
            child: new Container(
                height: 65.0,
                child: new TabBar(
                    controller: controller,
                    indicatorColor: Colors.blue, //tab标签的下划线颜色
                    labelColor: const Color(0xFF000000),
                    tabs: <Tab>[
                      new Tab(text: '业界动态', icon: new Icon(Icons.language)),
                      new Tab(text: '组件', icon: new Icon(Icons.extension)),
                      new Tab(text: '官网地址', icon: new Icon(Icons.home)),
                      new Tab(text: '关于手册', icon: new Icon(Icons.favorite)),
                    ]))));
  }

  void _onTabChange() {
    this.setState(() {
      appBarTitle = tabData[controller.index]['text'];
    });
  }

  void _onDataChange(val) {
    setState(() {
      data = val;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';

import 'views/first_page.dart';
import 'views/widget_page.dart';
import 'views/fourth_page.dart';
import 'views/collection_page.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'common/provider.dart';
import 'model/widget.dart';
import './widgets/index.dart';
import 'package:flutter_go/components/search_input.dart';

const int ThemeColor = 0xFFC91B3A;

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
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new MyHomePage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

var db;

void main() async {
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
  WidgetControlModel widgetControl = new WidgetControlModel();
  TabController controller;
  bool isSearch = false;
  String data = '无';
  String data2ThirdPage = '这是传给ThirdPage的值';
  String appBarTitle = tabData[0]['text'];
  static List tabData = [
    {'text': '业界动态', 'icon': new Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': new Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': new Icon(Icons.star)},
    {'text': '关于手册', 'icon': new Icon(Icons.favorite)}
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
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
    Application.controller = controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onWidgetTap(WidgetPoint widgetPoint, BuildContext context) {
    List widgetDemosList = new WidgetDemoList().getDemos();
    String targetName = widgetPoint.name;
    String targetRouter = '/category/error/404';
    widgetDemosList.forEach((item) {
      if (item.name == targetName) {
        targetRouter = item.routerName;
      }
    });
    Application.router.navigateTo(context, "$targetRouter");
  }

  Widget buildSearchInput(BuildContext context) {
    return new SearchInput((value) async {
      if (value != '') {
        List<WidgetPoint> list = await widgetControl.search(value);

        return list
            .map((item) => new MaterialSearchResult<String>(
          value: item.name,
          text: item.name,
          onTap: () {
            onWidgetTap(item, context);
          },
        ))
            .toList();
      } else {
        return null;
      }
    }, (value) {}, () {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: buildSearchInput(context)),
      body: new TabBarView(controller: controller, children: <Widget>[
        new FirstPage(),
        new WidgetPage(db),
        new CollectionPage(),
        new FourthPage()
      ]),
      bottomNavigationBar: Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(-1.0, -1.0),
                ),
              ],
            ),
            child: TabBar(
              controller: controller,
              indicatorColor: Theme.of(context).primaryColor, //tab标签的下划线颜色
              // labelColor: const Color(0xFF000000),
              indicatorWeight: 3.0,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: const Color(0xFF8E8E8E),
              tabs: <Tab>[
                Tab(text: '业界动态', icon: Icon(Icons.language)),
                Tab(text: '组件', icon: Icon(Icons.extension)),
                Tab(text: '组件收藏', icon: Icon(Icons.favorite)),
                Tab(text: '关于手册', icon: Icon(Icons.line_weight)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {
        appBarTitle = tabData[controller.index]['text'];
      });
    }
  }

// void _onDataChange(val) {
//   if (this.mounted) {
//     setState(() {
//       data = val;
//     });
//   }
// }
}

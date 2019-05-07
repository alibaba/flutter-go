/// Created with Android Studio.
/// User: 三帆
/// Date: 16/01/2019
/// Time: 11:16
/// email: sanfan.hx@alibaba-inc.com
/// target:  app首页

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_go/utils/shared_preferences.dart';
import 'package:flutter_go/views/first_page/first_page.dart';
import 'package:flutter_go/views/first_page/main_page.dart';
import 'package:flutter_go/views/widget_page/widget_page.dart';
import 'package:flutter_go/views/welcome_page/fourth_page.dart';
import 'package:flutter_go/views/collection_page/collection_page.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/utils/provider.dart';
import 'package:flutter_go/model/widget.dart';
import 'package:flutter_go/widgets/index.dart';
import 'package:flutter_go/components/search_input.dart';
import 'package:flutter_go/model/search_history.dart';
import 'package:flutter_go/resources/widget_name_to_icon.dart';

const int ThemeColor = 0xFFC91B3A;

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  SpUtil sp;
  WidgetControlModel widgetControl = new WidgetControlModel();
  SearchHistoryList searchHistoryList;
  bool isSearch = false;
  String appBarTitle = tabData[0]['text'];
  List<Widget> list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
//    {'text': '点击更新', 'icon': Icon(Icons.update)}
  ];

  List<BottomNavigationBarItem> myTabs = [];

  @override
  void initState() {
    super.initState();
    initSearchHistory();
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    list

//      ..add(FirstPage())
      ..add(MainPage())
      ..add(WidgetPage(Provider.db))
      ..add(CollectionPage())
      ..add(FourthPage());
//      ..add(FourthPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  initSearchHistory() async {
    sp = await SpUtil.getInstance();
    String json = sp.getString(SharedPreferencesKeys.searchHistory);
    print("json $json");
    searchHistoryList = SearchHistoryList.fromJSON(json);
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
    searchHistoryList
        .add(SearchHistory(name: targetName, targetRouter: targetRouter));
    print("searchHistoryList1 ${searchHistoryList.toString()}");
    print("searchHistoryList2 ${targetRouter}");
    print("searchHistoryList3 ${widgetPoint.name}");
    Application.router.navigateTo(context, "$targetRouter");
  }

  Widget buildSearchInput(BuildContext context) {
    return new SearchInput((value) async {
      if (value != '') {
        List<WidgetPoint> list = await widgetControl.search(value);
        return list
            .map((item) => new MaterialSearchResult<String>(
                  value: item.name,
                  icon: WidgetName2Icon.icons[item.name] ?? null,
                  text: 'widget',
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

  renderAppBar(BuildContext context,Widget widget,int index) {
    print('renderAppBar=====>>>>>>${index}');
    if(index == 0) {
      return null;
    }
    return AppBar(title: buildSearchInput(context));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: renderAppBar(context,widget,_currentIndex),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _ItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(0xFFC91B3A),
      ),
    );
  }

  void _ItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}

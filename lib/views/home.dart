/// Created with Android Studio.
/// User: 三帆
/// Date: 16/01/2019
/// Time: 11:16
/// email: sanfan.hx@alibaba-inc.com
/// target:  app首页

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_go/utils/data_utils.dart';
import 'package:flutter_go/utils/shared_preferences.dart';
import 'package:flutter_go/views/first_page/first_page.dart';
import 'package:flutter_go/views/first_page/main_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_go/views/user_page/user_page.dart';
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
import 'package:flutter_go/model/user_info.dart';

class AppPage extends StatefulWidget {
  final UserInformation userInfo;

  AppPage(this.userInfo);

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
  List<Widget> _list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
    
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    print('widget.userInfo    ${widget.userInfo}');
    initSearchHistory();
    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list
//      ..add(FirstPage())
      ..add(MainPage(userInfo: widget.userInfo))
      ..add(WidgetPage())
      ..add(FourthPage())
      ..add(UserPage(userInfo: widget.userInfo));
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
    String targetName = widgetPoint.name;
    searchHistoryList.add(
        SearchHistory(name: targetName, targetRouter: widgetPoint.routerName));
    print("searchHistoryList1 ${searchHistoryList.toString()}");
    Application.router.navigateTo(context, widgetPoint.routerName,
        transition: TransitionType.inFromRight);
  }

  Widget buildSearchInput(BuildContext context) {
    return new SearchInput((value) async {
      if (value != '') {
        print('value ::: $value');
        // List<WidgetPoint> list = await widgetControl.search(value);
        List<WidgetPoint> list = await DataUtils.searchWidget(value);
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

  renderAppBar(BuildContext context, Widget widget, int index) {
    if (index == 1) {
      return AppBar(title: buildSearchInput(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: renderAppBar(context, widget, _currentIndex),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}

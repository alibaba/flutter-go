/// Created with Android Studio.
/// User: 三帆
/// Date: 16/01/2019
/// Time: 11:16
/// email: sanfan.hx@alibaba-inc.com
/// target:  app首页
import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter_web/widgets.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_go/utils/shared_preferences.dart';

import 'package:flutter_go/views/first_page/first_page.dart' show FirstPage;
import 'package:flutter_go/views/widget_page/widget_page.dart';
import 'package:flutter_go/views/collection_page/collection_page.dart';
import 'package:flutter_go/views/welcome_page/fourth_page.dart' show FourthPage;

import 'package:flutter_go/routers/application.dart';
//import 'package:flutter_go/utils/provider.dart';
import 'package:flutter_go/model/widget.dart';
import 'package:flutter_go/widgets/index.dart';
import 'package:flutter_go/components/search_input.dart';
import 'package:flutter_go/model/search_history.dart';
import 'package:flutter_go/resources/widget_name_to_icon.dart';
import 'package:flutter_go/views/widget_page/widget_page.dart' show WidgetPage;
import 'package:flutter_go/views/collection_page/collection_page.dart' show CollectionPage;
import 'package:flutter_go/components/cate_card.dart' show CateCard;

const int ThemeColor = 0xFFC91B3A;

class Home extends StatefulWidget {
  List<Widget> pageList = List();
  static List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language), 'name': 'FirstPage'},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension), 'name': 'WidgetPage'},
    {'text': '组件收藏', 'icon': Icon(Icons.favorite), 'name': 'CollectionPage'},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts), 'name': 'FourthPage'},
  ];
  final int pageIndex;
  final String subPage;
  final parent;
  Home({Key key, this.pageIndex = 0, this.subPage = '', this.parent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<Home> with SingleTickerProviderStateMixin {
  SpUtil sp;
  WidgetControlModel widgetControl = new WidgetControlModel();
  SearchHistoryList searchHistoryList;
  bool isSearch = false;
  String appBarTitle = Home.tabData[0]['text'];
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _myTabs = [];
  bool addPosted = false; // 是否已经监听过

  @override
  void initState() {
    super.initState();
    initSearchHistory();
    _currentIndex = widget.pageIndex;
    for (int i = 0; i < Home.tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: Home.tabData[i]['icon'],
        title: Text(
          Home.tabData[i]['text'],
        ),
      ));
    }
    widget.pageList
//      ..add(MainPage())
      ..add(FirstPage())
      ..add(WidgetPage(null))
      ..add(CollectionPage())
      ..add(FourthPage());

    // 在生命周期的最后一帧调用
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (widget.subPage != '' && !addPosted) {
        print("addPostFrameCallback be invoke1=${timeStamp}");
        gointoWidget(context, widget.subPage);
        addPosted = true;
      }
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      print("addPostFrameCallback be invoke2=${timeStamp}");
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      print("addPostFrameCallback be invoke3=${timeStamp}");
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  initSearchHistory() async {
    sp = await SpUtil.getInstance();
    new SearchHistoryList(sp);

    /// print("json-----> ${SharedPreferencesKeys.searchHistory}");
    String json = sp.getString(SharedPreferencesKeys.searchHistory);

    /// print("json-----> $json");
    searchHistoryList = SearchHistoryList.fromJSON(json);
  }

  void gointoWidget(BuildContext context, String name) {
    String targetRouter = name;
    // 二级路由是否匹配
    if (name.indexOf('/category/') == -1) {
        List widgetDemosList = new WidgetDemoList().getDemos();
        String targetName = name;
        targetRouter = '/category/error/404';
        widgetDemosList.forEach((item) {
         if (item.routerName == targetName) {
           targetRouter = item.routerName;
        }
       });
       Application.router.navigateTo(context, "$targetRouter");
    }else{
      // 一级路由是否匹配
      String sname = targetRouter.replaceAll('/category/', '');
      (widget.pageList[1] as WidgetPage).catModel.getCatByName(sname).then((data) {
        if (data.toString()=='null') {
          targetRouter = '/category/error/404';
        }
        Application.router.navigateTo(context, "$targetRouter");
      });
    }
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

  renderAppBar(BuildContext context, Widget widget, int index) {
    /// if (index == 0) {return null;}
    return AppBar(title: buildSearchInput(context));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: renderAppBar(context, widget, _currentIndex),
      body: IndexedStack(
        index: _currentIndex,
        children: widget.pageList,
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

        fixedColor: Color(0xFFC91B3A),
      ),
    );
  }

  void _itemTapped(int index) {
    // setState(() {
    //   _currentIndex = index;
    //   appBarTitle = Home.tabData[index]['text'];
    // });
    _currentIndex = index;
    Navigator.of(context).pushReplacement(
        widget.parent.route(Home.tabData[index]['name'], index));
  }
}

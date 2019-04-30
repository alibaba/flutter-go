import 'package:flutter/material.dart';
//import 'package:flutter_wanandroid/common/component_index.dart';
//import 'package:flutter_wanandroid/ui/pages/main_left_page.dart';
//import 'package:flutter_wanandroid/ui/pages/page_index.dart';

import './main_app_bar.dart';

class _Page {
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
   _Page('titleHome'),
   _Page('titleHome'),
   _Page('titleHome'),
   _Page('titleHome'),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MainPagess build......");
    return  DefaultTabController(
        length: _allPages.length,
        child:  Scaffold(
          appBar: new MyAppBar(
            leading: Container(
                child: new ClipOval(
                  child: Image.network(
                    'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658',
                    scale: 15.0,
                  ),
                )
            ),
            centerTitle: true,
            title:  TabLayout(),
            actions: <Widget>[
               IconButton(
                  icon:  Icon(Icons.search),
                  onPressed: () {
                   /// NavigatorUtil.pushPage(context,  SearchPage(),
                        ///pageName: "SearchPage");
                    // NavigatorUtil.pushPage(context,   TestPage());
                    //  NavigatorUtil.pushPage(context,   DemoApp());
                  })
            ],
          ),
          body:  TabBarViewLayout(),
//          drawer:  Drawer(
//            child:  MainLeftPage(),
//          ),
        ));
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _allPages
          .map((_Page page) =>
              Tab(text: page.labelId))
          .toList(),
    );
  }
}

class TabBarViewLayout extends StatelessWidget {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
//    switch (labelId) {
//      case Ids.titleHome:
//        //return HomePage(labelId: labelId);
//        return ReposPage(labelId: labelId);
//        break;
//      case Ids.titleRepos:
//        return ReposPage(labelId: labelId);
//        break;
//      case Ids.titleEvents:
//        return EventsPage(labelId: labelId);
//        break;
//      case Ids.titleSystem:
//        return SystemPage(labelId: labelId);
//        break;
//      default:
//        return Container();
//        break;
//    }
    return Container(
        child: new ClipOval(
          child: Image.network(
          'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658',
          scale: 5.0,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print("TabBarViewLayout build.......");
    return  TabBarView(
        children: _allPages.map((_Page page) {
      return buildTabView(context, page);
    }).toList());
  }
}

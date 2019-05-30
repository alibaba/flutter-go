import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './first_page.dart';
import './sub_page.dart';
import './main_app_bar.dart';
import './search_page.dart';

class _Page {
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  _Page('项目1'),
  _Page('项目2'),
  _Page('项目3'),
  _Page('项目4'),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MainPagess build......");
    return DefaultTabController(
        length: _allPages.length,
        child: Scaffold(
          appBar: new MyAppBar(
            leading: Container(
                child: new ClipOval(
              child: Image.network(
                'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658',
                scale: 15.0,
              ),
            )),
            centerTitle: true,
            title: TabLayout(),
            actions: <Widget>[
              IconButton(
                  icon:  Icon(Icons.search),
                  onPressed: () {
                    pushPage(context, SearchPage(), pageName: "SearchPage");
                  })
            ],
          ),
          drawer: Drawer(
            child: new ListView(
              children: <Widget>[
                new ListTile(
                  title: new Text("欢迎"),
                ),
                new Divider(),
                new ListTile(
                    title: new Text("设置"),
                    trailing: new Icon(Icons.settings),
                    onTap: () {}),
              ],
            ),
          ),
          body: TabBarViewLayout(),
//          drawer:  Drawer(
//            child:  MainLeftPage(),
//          ),
        ));
  }
}

void pushPage(BuildContext context, Widget page, {String pageName}) {
  if (context == null || page == null) return;
  Navigator.push(context, CupertinoPageRoute<void>(builder: (ctx) => page));
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      //labelPadding: EdgeInsets.all(12.0),
      labelPadding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
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
    switch (labelId) {
      case '项目1':
        return FirstPage();
        break;
      case '项目2':
        return SubPage();
        break;
      case '项目3':
        return SubPage();
        break;
      case '项目4':
        return SubPage();
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("TabBarViewLayout build.......");
    return TabBarView(
        children: _allPages.map((_Page page) {
          return buildTabView(context, page);
        }).toList());
  }
}

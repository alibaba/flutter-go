import 'package:flutter_web/material.dart';
import 'package:flutter_go/routers/hashRouter/route.dart' show SimpleRoute;
import 'package:flutter_go/routers/application.dart' as Application;
import 'home.dart' show Home;

void main() => runApp(MyApp());

const int ThemeColor = 0xFFC91B3A;

class MyApp extends StatelessWidget {
  Route<dynamic> route(String name, int index, [String subPath = '']) {
    return SimpleRoute(
        name: name,
        title: Home.tabData[index]['text'],
        builder: (_) => new Scaffold(
            body: Home(pageIndex: index, parent: this, subPage: subPath)));
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

      ///home: new Scaffold(body: home),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name.indexOf('/category/') != -1) {
          return route(Home.tabData[1]['name'], 1, settings.name);
        } else if (settings.name.indexOf('/components/') != -1) {
          return route(Home.tabData[1]['name'], 1, settings.name);
        }else if (settings.name.indexOf('/elements/') != -1) {
          return route(Home.tabData[1]['name'], 1, settings.name);
        }else if (settings.name.indexOf('/themes/') != -1) {
          return route(Home.tabData[1]['name'], 1, settings.name);
        }
        switch (settings.name) {
          case "/":
            return route(Home.tabData[0]['name'], 0);
          case "/firstPage":
            return route(Home.tabData[0]['name'], 0);
          case "/WidgetPage":
            return route(Home.tabData[1]['name'], 1);
          case "/CollectionPage":
            return route(Home.tabData[2]['name'], 2);
          case "/FourthPage":
            return route(Home.tabData[3]['name'], 3);
          default:
            return route(Home.tabData[0]['name'], 0);
        }
      },
      initialRoute: "/",

      /// navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

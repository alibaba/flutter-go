/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/20
 * Time: 上午11:34
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoApp 的示例
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* Checkbox 默认按钮的实例
* index 当前checkbox 的索引值
* */
class CupertinoAppFullDefault extends StatefulWidget {
  const CupertinoAppFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoAppFullDefault();
}

/*
* CupertinoApp 默认的实例,有状态
* */
class _CupertinoAppFullDefault extends State {
  routerHandler(setting) {
    //setting.isInitialRoute; bool类型 是否初始路由
    //setting.name; 要跳转的路由名key
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          //这里为返回的Widget
          return HomePage();
        },
        opaque: false,
        //跳转动画
        transitionDuration: Duration(milliseconds: 200),
        transitionsBuilder:
            (___, Animation<double> animation, ____, Widget child) {
          return FadeTransition(
            opacity: animation,
            child:  ScaleTransition(
              scale:  Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //height: 500.0,
        child: CupertinoApp(
          title: '这里是标题', // 设备用于识别用户的应用程序的单行描述
          builder: (BuildContext context, Widget child) {
            // 覆盖下面的所有界面,一般当作追加属性用
            //return Container(child:Text('这里是内容1',style:TextStyle(color:Colors.black)));
            return MediaQuery(
                // 当构建一个Widget前,调用一般做字体大小，方向，主题颜色等配置
                //字体大小
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.4),
                child: child);
          },
          checkerboardOffscreenLayers: false, // 打开渲染到屏幕外位图的图层的checkerboarding
          checkerboardRasterCacheImages: false, // 打开光栅缓存图像的检查板。
          debugShowCheckedModeBanner:
              true, // 在debug模式下打开一个小“DEBUG”横幅，表示该应用程序处于检查模式
          color: Colors.red, // 该颜色为程序切换中应用图标背景的颜色，当应用图标背景为透明时
//          home: HomePage(),// 进入程序后显示的第一个页面,传入的是一个Widget，但实际上这个Widget需要包裹一个Scaffold
          home: CupertinoPageScaffold(
            // 进入程序后显示的第一个页面,传入的是一个Widget，但实际上这个Widget需要包裹一个Scaffold
            navigationBar: CupertinoNavigationBar(
              leading: Icon(CupertinoIcons.back),
              middle: Text('Title'),
              trailing: Icon(CupertinoIcons.share),
            ),
            child: Container(
                // home 对应的内容和 router对应的内容，同时存在
                padding: const EdgeInsets.only(bottom: 60.0),
                alignment: Alignment.center,
                child: Text('这里是 home 属性对应的内容',
                    style: TextStyle(
                        color: Colors
                            .black))), // 应用程序默认路由,（Navigator.defaultRouteName，即/）
          ),
          initialRoute:
              '/home', // 如果构建了导航器，则显示的第一条路径的名称,初始路由，当用户进入程序时，自动打开对应的路由。(home还是位于一级)传入的是上面routes的key
          locale: Locale('zh', 'CH'), // 本地化初始值
          localeResolutionCallback: (local, support) {
            // 区域分辨回调,当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
            return const Locale('us', 'uk');
          },
          localizationsDelegates: [], // 本地化委托，用于更改Flutter Widget默认的提示语，按钮text等,返回一个 继承自 LocalizationsDelegate 的对象
          navigatorKey: GlobalKey(), // 导航主键 GlobalKey<NavigatorState>
          navigatorObservers: [
            // 路由观察器，当调用Navigator的相关方法时，会回调相关的操作
            MyObserver(),
          ],
          onGenerateRoute: (setting) {
            // 当通过Navigation.of(context).pushNamed跳转路由时，在routes查找不到时，会调用该方法
            routerHandler(setting);
          },
          onGenerateTitle: (context) {
            // 跟上面的tiitle一样，但含有一个context参数用于做本地化
            return 'Flutter应用';
          },
          onUnknownRoute: (setting) {
            // 效果跟onGenerateRoute一样调用顺序为onGenerateRoute ==> onUnknownRoute
            //RouterHandler(setting);
          },
          routes: {
            // 声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由参数以键值对的形式传递key:路由名字value:对应的Widget
            '/home': (BuildContext context) => HomePage(),
            '/home/one': (BuildContext context) => OnePage(),
          },
          showPerformanceOverlay:
              false, // 当为true时应用程序顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
          showSemanticsDebugger:
              false, // 当为true时，打开Widget边框，类似Android开发者模式中显示布局边界
          supportedLocales: [
            // 传入支持的语种数组
            const Locale('uok'),
            const Locale('meg'),
          ],
        ));
  }

  Widget homeBuild(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/btn_icon_dingyuehao_normal.png')),
                title: Text('Tab 1'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/btn_icon_dingyuehao_normal.png')),
                title: Text('Tab 2'),
              ),
            ]),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: CupertinoColors.destructiveRed,
              middle: Text('这里是标题', style: TextStyle(color: Colors.white)),
            ),
            child: Center(
                child: Text('这里是内容', style: TextStyle(color: Colors.black))),
            backgroundColor: CupertinoColors.extraLightBackgroundGray,
          );
        });
  }
}

class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    print('MyObserver 路由观察器:${route.settings.name}');
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('HomePage', style: TextStyle(color: Colors.black)));
  }
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('OnePage', style: TextStyle(color: Colors.red)));
  }
}

/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/20
 * Time: 上午11:34
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoNavigationBar 的示例
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* CupertinoNavigationBar 默认的实例
* */
class CupertinoNavigationBarFullDefault extends StatefulWidget {
  const CupertinoNavigationBarFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoNavigationBarFullDefault();
}

/*
* CupertinoNavigationBar 默认的实例,有状态
* */
class _CupertinoNavigationBarFullDefault extends State {

  Widget build2(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //height: 500.0,
      child:CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.share),
              title: Text('Tab 1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.share),
              title: Text('Tab 2'),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          // For 1-indexed readability.
          ++index;
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page 1 of tab $index'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: Center(
                                child: CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
     )
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height/1.5,
        child: navigationBar(context)
    );
  }

  Widget navigationBar(BuildContext context) {
    return CupertinoPageScaffold( // 进入程序后显示的第一个页面,传入的是一个Widget，但实际上这个Widget需要包裹一个Scaffold
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),// 放置在导航栏的开头。通常是正常页面的后退按钮或完整页面对话框的取消按钮
        middle: Text('Title'),// 放置在导航栏的中间。通常是标题或分段控件
        trailing: Icon(CupertinoIcons.share),// 放置在导航栏的末尾。通常在页面上执行其他操作，例如搜索或编辑功能
        actionsForegroundColor:CupertinoColors.white,// 用于 导航栏中前导和尾随小部件的文本和图标的默认颜色。
        backgroundColor:CupertinoColors.activeOrange,// 导航栏的背景颜色。如果它包含透明度，标签栏将自动对其背后的内容产生模糊效果
        border:Border( // 边框样式
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 1.0),
        ),
        //heroTag :null,
        previousPageTitle:'???',// 自动隐含前导按钮时手动指定上一个路线的标题
        transitionBetweenRoutes:true // 是否在导航栏之间转换
      ),
      child: Center(
          child: Text('这里是内容', style: TextStyle(color: Colors.black))
      ), // 应用程序默认路由,（Navigator.defaultRouteName，即/）
    );
  }

  Widget tabBar(BuildContext context){
    return CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            title: Text('Support'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
          ),
        ]
    );
  }
}

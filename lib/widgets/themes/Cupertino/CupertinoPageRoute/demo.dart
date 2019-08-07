/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoPageRoute 的示例

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// CupertinoPageRoute 默认的实例
class CupertinoPageRouteFullDefault extends StatefulWidget {
  const CupertinoPageRouteFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoPageRouteFullDefault();
}

// CupertinoPageRoute 默认的实例,有状态
class _CupertinoPageRouteFullDefault extends State {

  Widget pageRoute(BuildContext context,int index){
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
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text('无滑动的切换1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.share),
              title: Text('无滑动的切换2'),
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
                    child: const Text('点击我，看滑动动画'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          maintainState:false, //  是否前一个路由将保留在内存中
                          builder: (BuildContext context) { // 生成器
                            return pageRoute(context,index);
                          }
                        )
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
}

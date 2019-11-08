/// Created with Android Studio.
/// User: 三帆
/// Date: 20/01/2019
/// Time: 22:28
/// email: sanfan.hx@alibaba-inc.com
/// target:  CupertinoTabBar

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabScaffoldDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoTabScaffoldDemo> {
  int index = 0;

  changeIndex(int _index) {
    this.setState(() {
      index = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("A"),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              title: Text("B"),
              icon: Icon(Icons.add),
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            routes: {
              '/': (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Page 1 of tabView $index'),
                  ),
                  child: Center(
                    child: Text('CupertinoTabView /'),
                  ),
                );
              },
              '/home': (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Page 1 of tabView $index'),
                  ),
                  child: Center(
                    child: Text('CupertinoTabView home'),
                  ),
                );
              }
            },
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Page 1 of tabView $index'),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      CupertinoButton(
                        child: Text('Next page is self home page'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                      ),
                      CupertinoButton(
                        child: Text('Next page is home home page'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed('/home');
                        },
                      )
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
}

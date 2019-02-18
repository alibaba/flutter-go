/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 20/01/2019
 * Time: 22:28
 * email: sanfan.hx@alibaba-inc.com
 * target:  CupertinoTabBar
 */

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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              title: Text("1"),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              title: Text("2"),
              icon: Icon(Icons.add),
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page 1 of tab $index'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: Text('Next page = $index'),
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
                                  onPressed: () { Navigator.of(context).pop(); },
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
    );
  }
}